sudo iptables -t nat -A OUTPUT -o lo -p tcp --dport 80 -j REDIRECT --to-port 8000
sudo iptables -t nat -L
# Use -D to remove
