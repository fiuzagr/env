apt install debconf-utils

debconf-set-selections <<< 'keyboard-configuration keyboard-configuration/optionscode string ctrl:nocaps'

dpkg-reconfigure keyboard-configuration -f noninteractive
