export ANT_HOME="$HOME/Programs/apache-ant-1.9.4"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export LOCAL_BIN="$HOME/.local/bin"
export PATH="$ANT_HOME/bin:$ANDROID_HOME:$ANDROID_HOME/tools:$LOCAL_BIN:$PATH"

export TERM="xterm-256color"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


# PHPBREW
export PHPBREW_HOME="$HOME/.phpbrew"
[[ -e "$PHPBREW_HOME/bashrc" ]] && source "$PHPBREW_HOME/bashrc"


# Manja
export MANJA_DIR="$HOME/.manja"
[ -s "$MANJA_DIR/manja.sh" ] && . "$MANJA_DIR/manja.sh"
