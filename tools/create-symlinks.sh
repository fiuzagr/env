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

  # Set MY_ENV
  if [ ! -n "$MY_ENV" ]; then
    MY_ENV=~/.my-env
  fi

  # VIMRC
  printf "${BLUE}Creating symbolic links...${NORMAL}\n"
  {
    if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
      printf "${YELLOW}Found ~/.vimrc.${NORMAL} ${GREEN}Backing up to ~/.vimrc.pre-my-env${NORMAL}\n";
      mv ~/.vimrc ~/.vimrc.pre-my-env;
    fi
    ln -s $MY_ENV/vim/.vimrc ~/.vimrc
  } || {
    echo "Error: vimrc symbolic link crash"
    exit 1
  }

  # TMUX.CONF
  {
    if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
      printf "${YELLOW}Found ~/.tmux.conf.${NORMAL} ${GREEN}Backing up to ~/.tmux.conf.pre-my-env${NORMAL}\n";
      mv ~/.tmux.conf ~/.tmux.conf.pre-my-env;
    fi
    ln -s $MY_ENV/tmux/.tmux.conf ~/.tmux.conf
  } || {
    echo "Error: tmux.conf symbolic link crash"
    exit 1
  }

  # Oh-My-Zsh CUSTOM
  {
    if [ -d ~/.oh-my-zsh/custom ]; then
      printf "${YELLOW}Found ~/.oh-my-zsh/custom.${NORMAL} ${GREEN}Backing up to ~/.oh-my-zsh/custom.pre-my-env${NORMAL}\n";
      mv ~/.oh-my-zsh/custom ~/.oh-my-zsh/custom.pre-my-env;
    fi
    ln -s $MY_ENV/oh-my-zsh/custom ~/.oh-my-zsh/custom
  } || {
    echo "Error: oh-my-zsh/custom symbolic link crash"
    exit 1
  }

}

main
