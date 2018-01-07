# Redirect ports with iptables

```shell
sudo iptables -t nat -A OUTPUT -o lo -p tcp --dport 80 -j REDIRECT --to-port 8000
sudo iptables -t nat -L
```

_Use -D to remove_
