# Requirements
apt-get build-dep php
apt-get install -y php php-dev php-pear autoconf automake curl libcurl3-openssl-dev build-essential libxslt1-dev re2c libxml2 libxml2-dev php-cli bison libbz2-dev libreadline-dev php-curl
apt-get install -y libfreetype6 libfreetype6-dev libpng12-0 libpng12-dev libjpeg-dev libjpeg8-dev libjpeg8  libgd-dev libgd3 libxpm4 libltdl7 libltdl-dev
apt-get install -y libssl-dev openssl
apt-get install -y gettext libgettextpo-dev libgettextpo0
apt-get install -y libicu-dev
apt-get install -y libmhash-dev libmhash2
apt-get install -y libmcrypt-dev libmcrypt4
apt-get install -y mysql-server mysql-client libmysqlclient-dev libmysqld-dev

# PHPBrew
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew
mkdir -p ~/.local/bin 2> /dev/null
mv phpbrew ~/.local/bin/phpbrew
