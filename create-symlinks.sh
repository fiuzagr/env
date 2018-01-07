#!/usr/bin/env sh

env_symlinks_settings() {
  set -e # exit on error

  if [ ! -n "$ENV_HOME" ] || [ ! -d "$ENV_HOME" ]
  then
    echo
    echo "$ENV_HOME is not installed."
    echo
    exit 1
  fi
}

env_symlinks_create() {
  local from="$1"
  local to="$2"

  {
    if [ -s "$to" ] || [ -h "$to" ]
    then
      echo "Found ${to}"
      echo "Backing up to ${to}.pre-env..."

      mv "$to" "${to}.pre-env"
    fi

    echo "Creating symbolic link to ${to}..."
    echo

    ln -s "$from" "$to"
  } || {
    echo "Error: ${to} symbolic link crashed."
    echo
  }
}

env_symlinks_main() {
  env_symlinks_settings

  env_symlinks_create "$ENV_HOME/git/.gitconfig" "$HOME/.gitconfig"

  env_symlinks_create "$ENV_HOME/vim/.vimrc" "$HOME/.vimrc"

  env_symlinks_create "$ENV_HOME/emacs.d" "$HOME/.emacs.d"

  env_symlinks_create "$ENV_HOME/tmux/.tmux.conf" "$HOME/.tmux.conf"
}
env_symlinks_main

