# Local Binaries
LOCAL_BIN="$HOME/.local/bin"
if [[ -d "$LOCAL_BIN" ]]; then
  export LOCAL_BIN
  PATH="$LOCAL_BIN:$PATH"
fi


# NVM
NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  export NVM_DIR
  . "$NVM_DIR/nvm.sh"
fi
if [[ -s "$(brew --prefix nvm)/nvm.sh" ]]; then
  . "$(brew --prefix nvm)/nvm.sh"
fi


# PHPBREW
PHPBREW_HOME="$HOME/.phpbrew"
if [[ -e "$PHPBREW_HOME/bashrc" ]]; then
  export PHPBREW_RC_ENABLE=1
  export PHPBREW_HOME
  source "$PHPBREW_HOME/bashrc"
fi


# Manja
MANJA_DIR="$HOME/.manja"
if [[ -s "$MANJA_DIR/manja.sh"  ]]; then
  export MANJA_DIR
  . "$MANJA_DIR/manja.sh"
fi


# JENV
JENV_HOME="$HOME/.jenv"
if [[ -d "$JENV_HOME" ]]; then
  export JENV_ROOT=/usr/local/opt/jenv
  export JENV_HOME
  PATH="$JENV_HOME/bin:$PATH"
  eval "$(jenv init -)"
fi


# RBENV
RBENV_HOME="$HOME/.rbenv"
if [[ -d "$RBENV_HOME" ]]; then
  export RBENV_HOME
  PATH="$RBENV_HOME/bin:$PATH"
  eval "$(rbenv init -)"
fi


# Android SDK
ANDROID_HOME="$(brew --prefix android)"
if [[ -d "$ANDROID_HOME" ]]; then
  export ANDROID_HOME
fi


# PATH
export PATH


# HOMEBREW ACCESS TOKEN
export HOMEBREW_GITHUB_API_TOKEN="4930f11277852a6f77ff1e83d7e41d7dbf0c542f"
