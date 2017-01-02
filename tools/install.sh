main() {
  # Use colors, but only if connected to a terminal, and that terminal
  # supports them.
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi

  # Only enable exit-on-error after the non-critical colorization stuff,
  # which may fail on systems lacking tput or terminfo
  set -e

  # Check MY_ENV
  if [ ! -n "$MY_ENV" ]; then
    MY_ENV=~/.my-env
  fi

  if [ -d "$MY_ENV" ]; then
    printf "${YELLOW}You already have MY_ENV installed.${NORMAL}\n"
    printf "You'll need to remove $MY_ENV if you want to re-install.\n"
    exit
  fi

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  printf "${BLUE}Cloning MY_ENV...${NORMAL}\n"
  hash git >/dev/null 2>&1 || {
    printf "${RED}Error: git is not installed${NORMAL}\n\n"
    exit 1
  }
  env git clone --depth=1 https://github.com/fiuzagr/env.git $MY_ENV || {
    printf "${RED}Error: git clone of env repo failed${NORMAL}\n\n"
    exit 1
  }


  # Install Oh-My-Zsh
  env sh $MY_ENV/tools/install-omz.sh


  # Create symbolic links
  env sh $MY_ENV/tools/create-symlinks.sh


  # Install Plug.vim
  env curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || {
    printf "${RED}Error: Plug.vim install failed${NORMAL}\n\n"
    exit 1
  }
  # Install all plugins in vim
  env vim +PlugInstall +qall

  # Install tmp tmux plugin
  env git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins || {
    printf "${RED}Error: TPM install failed${NORMAL}\n\n"
    exit 1
  }


  printf "${GREEN}"
  echo ''
  echo '----------------------------'
  echo ' Your ENV is now installed! '
  echo '----------------------------'
  echo ''
  printf "${NORMAL}"
  env zsh
}
main

