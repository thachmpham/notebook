# setup vm network adapter: NAT
set port forward:
    host ip:    127.0.0.1
    host port:  5003
    guest port: 22

# on guest vm
sudo firewall-cmd --zone=publicweb --add-service=ssh

# on host vm
ssh mt@127.0.0.1 -p 5003