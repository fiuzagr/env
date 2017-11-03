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

  printf "${BLUE}Creating symbolic links...${NORMAL}\n"

  # EMACS.D
  {
    # backup
    if [ -d ~/.emacs.d ]; then
      printf "${YELLOW}Found ~/.emacs.d.${NORMAL} ${GREEN}Backing up to ~/.emacs.d.pre-my-env${NORMAL}\n";
      mv ~/.emacs.d ~/.emacs.d.pre-my-env;
    fi
    if [ -f ~/.emacs ] || [ -h ~/.emacs ]; then
      printf "${YELLOW}Found ~/.emacs.${NORMAL} ${GREEN}Backing up to ~/.emacs.pre-my-env${NORMAL}\n";
      mv ~/.emacs ~/.emacs.pre-my-env;
    fi
    if [ -f ~/.spacemacs ] || [ -h ~/.spacemacs ]; then
      printf "${YELLOW}Found ~/.spacemacs.${NORMAL} ${GREEN}Backing up to ~/.spacemacs.pre-my-env${NORMAL}\n";
      mv ~/.spacemacs ~/.spacemacs.pre-my-env;
    fi
    # create link
    ln -s $MY_ENV/emacs.d ~/.emacs.d
    ln -s $MY_ENV/spacemacs ~/.spacemacs
  } || {
    echo "Error: emacs.d symbolic link crash"
    # exit 1
  }

  # VIMRC
  {
    # backup
    if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
      printf "${YELLOW}Found ~/.vimrc.${NORMAL} ${GREEN}Backing up to ~/.vimrc.pre-my-env${NORMAL}\n";
      mv ~/.vimrc ~/.vimrc.pre-my-env;
    fi
    # create link
    ln -s $MY_ENV/vim/.vimrc ~/.vimrc
  } || {
    echo "Error: vimrc symbolic link crash"
    # exit 1
  }

  # TMUX.CONF
  {
    # backup
    if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
      printf "${YELLOW}Found ~/.tmux.conf.${NORMAL} ${GREEN}Backing up to ~/.tmux.conf.pre-my-env${NORMAL}\n";
      mv ~/.tmux.conf ~/.tmux.conf.pre-my-env;
    fi
    # create link
    ln -s $MY_ENV/tmux/.tmux.conf ~/.tmux.conf
  } || {
    echo "Error: tmux.conf symbolic link crash"
    # exit 1
  }

  # Git config
  {
    # backup
    if [ -f ~/.gitconfig ] || [ -h ~/.gitconfig ]; then
      printf "${YELLOW}Found ~/.gitconfig.${NORMAL} ${GREEN}Backing up to ~/.gitconfig.pre-my-env${NORMAL}\n";
      mv ~/.gitconfig ~/.gitconfig.pre-my-env;
    fi
    # create link
    ln -s $MY_ENV/git/.gitconfig ~/.gitconfig
  } || {
    echo "Error: gitconfig symbolic link crash"
    # exit 1
  }
}
main

