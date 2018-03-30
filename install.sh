#!/usr/bin/env sh

{ # this ensures the entire script is downloaded #

env_install_settings() {
  env_install_section "Configuring..."

  set -e # exit on error

  export ENV_HOME=${ENV_HOME:-"$HOME/.env"}
  export ENV_BRANCH=${ENV_BRANCH:-'v2'}

  if [ -d "$ENV_HOME" ]
  then
    echo
    echo "You already have $ENV_HOME installed."
    echo "You'll need to remove $ENV_HOME if you want to re-install."
    echo
    exit 1
  fi

  echo "Configured:"
  echo "  ENV_HOME=$ENV_HOME"
  echo "  ENV_BRANCH=$ENV_BRANCH"
  echo
}

env_install_clone() {
  env_install_section "Cloning ENV..."

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed."
    echo
    exit 1
  }

  env git clone \
    --quiet \
    --depth=1 \
    --single-branch \
    -b "$ENV_BRANCH" \
    https://github.com/fiuzagr/env.git "$ENV_HOME" >/dev/null || {
      echo "Error: git clone 'fiuzagr/env' is failed."
      echo
      exit 1
    }

  echo "Cloned to $ENV_HOME."
  echo
}

env_install_gitconfig() {
  env_install_section "Configuring Git..."

  local path="$ENV_HOME/git/.gitconfig"

  git config --global include.path $path
}

env_install_symlinks() {
  env_install_section "Creating symlinks..."

  env sh "$ENV_HOME/create-symlinks.sh"
}

env_install_fonts() {
  env_install_section "Install fonts..."

  env sh "$ENV_HOME/fonts/install.sh"
}

envInstallSectionStep=0
env_install_section() {
  envInstallSectionStep=$(expr "$envInstallSectionStep" + "1")
  echo
  echo "${envInstallSectionStep}. ${@}"
  echo
}

env_install() {
  echo
  echo ' ------------------- '
  echo '| Installing ENV... |'
  echo ' ------------------- '

  env_install_settings

  env_install_clone

  # env_install_symlinks
  
  env_install_gitconfig

  env_install_fonts

  echo ' ------------------- '
  echo '| ENV is installed! |'
  echo ' ------------------- '
  echo
}
env_install

} # this ensures the entire script is downloaded #
