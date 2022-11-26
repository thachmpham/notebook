sudo tshark -i any -n -Y 'sip' -O sip
# -Y 'sip'
# only sip packets are keep

# -O sip
# only show detail view of sip

# -n
# disable all name resolutions

sudo tshark -i vboxnet14 -w bt.pcap
sudo tshark -r bt.pcap -n -Y 'sip' -O sip

sudo tshark -r bt.pcap -n -Y 'sip' -T fields -e ip.addr -e udp.port -e sip.Request-Line -e sip.Status-Line
# -T fields
# display as fields format

# -e fields
# print selected fields
# https://www.wireshark.org/docs/dfref/s/sip.html


sudo tshark -r bt.pcap -n -Y 'sip' -T fields -e ip.src -e udp.srcport -e ip.dst -e udp.dstport -e sip.Request-Line -e sip.Status-Line


# print sip text to both of terminal and file
sudo tshark -i any -n -Y 'sip' -O sip 2>&1 | tee sip.json

sudo tshark -i any -f 'port 6999' -n -Y 'sip' -O sip
sudo tshark -i any -f 'port 5060' -n -Y 'sip' -O sip

# to find the abbreviations of the protocols
tshark -G protocols