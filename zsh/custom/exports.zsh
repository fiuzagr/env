#
# Editor
export EDITOR='vim'

#
# Language
export LANG=en_US.UTF-8

#
# History
export HISTFILE=$DENVER_CONFIG/zsh/.zsh_history
export HISTCONTROL=ignorespace

#
# Local Binaries
LOCAL_BIN="$HOME/.local/bin"
if [[ -d "$LOCAL_BIN" ]]; then
  export LOCAL_BIN
  PATH="$LOCAL_BIN:$PATH"
fi
