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

  printf "${BLUE}Installing Oh-My-Zsh...${NORMAL}\n"
  hash wget >/dev/null 2>&1 || {
    printf "${RED}Error: wget is not installed${NORMAL}\n\n"
    exit 1
  }

  # get install.sh
  env wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O /tmp/install-oh-my-zsh.sh

  # does not change env
  sed -i -e "s/env zsh/#env zsh/" /tmp/install-oh-my-zsh.sh

  # execute
  sh /tmp/install-oh-my-zsh.sh || {
    printf "${RED}Error: oh-my-zsh install failed${NORMAL}\n\n"
    exit 1
  }

  # remove tmp file
  rm -f /tmp/install-oh-my-zsh.sh

}
main

