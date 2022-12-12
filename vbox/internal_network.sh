# Create 3 VMs: client, router, server
# https://sandilands.info/sgordon/building-internal-network-virtualbox

network
    client:
        - 192.168.1.11 (enp0s8)

    server:
        - 192.168.2.22 (enp0s8)
        
    router:
        - 192.168.1.1 (enp0s8)
        - 192.168.2.1 (enp0s9)
        - enable ip forward

# setup netplan
sudo vi /etc/netplan/etc/netplan/00-installer-config.yaml

# for client
network:
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      addresses:
        - 192.168.1.11/24
      routes:
        - to: 192.168.2.0/24
          via: 192.168.1.1
  version: 2
# end

# for server
network:
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      addresses:
        - 192.168.2.22/24
      routes:
        - to: 192.168.1.0/24
          via: 192.168.2.1
  version: 2
# end

# for router
network:
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      addresses:
        - 192.168.1.1/24
    enp0s9:
      addresses:
        - 192.168.2.1/24
  version: 2
# end

# apply new ip
sudo netplan apply

# enable forwarding for router
sudo vi /etc/sysctl.conf
net.ipv4.ip_forward=1

sudo iptables -A FORWARD -i enp0s8 -j ACCEPT
sudo iptables -A FORWARD -i enp0s9 -j ACCEPT

sudo iptables -t nat -A POSTROUTING -o enp0s8 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o enp0s9 -j MASQUERADE

sudo reboot

# test the network with ping




