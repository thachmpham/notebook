sudo tshark -i any -n -Y 'sip' -O sip
sudo tshark -i any -n -Y 'sip' -O sip 2>&1 | tee sip.json

sudo tshark -i any -f 'port 6999' -n -Y 'sip' -O sip
sudo tshark -i any -f 'port 5060' -n -Y 'sip' -O sip

