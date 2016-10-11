main() {

  # Test if is run using sudo
  if [ "$(id -u)" != 0 ]; then
    echo "Error: This script must be run using sudo"
    exit 1
  fi

  cp ./pf-httpdfwd.conf /etc/pf-httpdfwd.conf
  cp ./dev.httpdfwd.plist /Library/LaunchDaemons/dev.httpdfwd.plist

  chown root:wheel /etc/pf-httpdfwd.conf
  chown root:wheel /Library/LaunchDaemons/dev.httpdfwd.plist

  lauchctl load -w /Library/LaunchDaemons/dev.httpdfwd.plist

}
main
