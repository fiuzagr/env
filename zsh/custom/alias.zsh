# alias vim="ssh denver@vim.denver -oStrictHostKeyChecking=no -q"
# alias node="ssh denver@node.denver -oStrictHostKeyChecking=no -q"

hrm () {
  LC_ALL=C sed -i "/$1/d" $HISTFILE
}
