# Download JAVA from source

```shell
jdk_version="8u111-b14"

wget --no-cookies \
  --no-check-certificate \
  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  "http://edelivery.oracle.com/otn-pub/java/jdk/${jdk_version}/jdk-$(echo $jdk_version | cut -d'-' -f 1)-linux-x64.tar.gz" \
  -O /tmp/jdk.tar.gz

mkdir /usr/java 2> /dev/null # Ignore error

tar -xzvf /tmp/jdk.tar.gz -C /usr/java/

java_dir=$(ls -tr /usr/java/ | grep "jdk1.$(echo $jdk_version | cut -d'u' -f 1)" | head -n 1)
```
