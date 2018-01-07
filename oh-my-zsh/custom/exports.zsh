# History control
export HISTCONTROL=ignorespace

# Local Binaries
LOCAL_BIN="$HOME/.local/bin"
if [[ -d "$LOCAL_BIN" ]]; then
  export LOCAL_BIN
  PATH="$LOCAL_BIN:$PATH"
fi


# NVM
if hash brew 2> /dev/null; then
  NVM_DIR="$(brew --prefix nvm)/.nvm"
else
  NVM_DIR="$HOME/.nvm"
fi
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  export NVM_DIR
  . "$NVM_DIR/nvm.sh"
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
  if hash brew 2> /dev/null; then
    export JENV_ROOT="/usr/local/opt/jenv"
  fi
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
if hash brew 2> /dev/null; then
  ANDROID_HOME="$(brew --prefix android)"
else 
  ANDROID_HOME="$HOME/Programs/android/sdks"
fi
if [[ -d "$ANDROID_HOME" ]]; then
  export ANDROID_HOME
fi


# Android Tools
ANDROID_TOOLS="$ANDROID_HOME/tools"
if [[ -d "$ANDROID_TOOLS" ]]; then
  export ANDROID_TOOLS
  PATH="$ANDROID_TOOLS:$PATH"
fi
# Android Platform Tools
ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"
if [[ -d "$ANDROID_PLATFORM_TOOLS" ]]; then
  export ANDROID_PLATFORM_TOOLS
  PATH="$ANDROID_PLATFORM_TOOLS:$PATH"
fi


# Eclipse Home
if hash brew 2> /dev/null; then
  ECLIPSE_HOME="$(brew --prefix eclipse)"
else 
  ECLIPSE_HOME="$HOME/Programs/eclipse"
fi
if [[ -d "$ECLIPSE_HOME" ]]; then
  export ECLIPSE_HOME
  PATH="$ECLIPSE_HOME:$PATH"
fi


# Denver
DENVER_HOME="$HOME/denver"
if [[ -s "$DENVER_HOME/.denver/rc" ]]; then
  export DENVER_HOME
  . "$DENVER_HOME/.denver/rc"
fi


# PATH
export PATH


# HOMEBREW ACCESS TOKEN
export HOMEBREW_GITHUB_API_TOKEN="4930f11277852a6f77ff1e83d7e41d7dbf0c542f"
