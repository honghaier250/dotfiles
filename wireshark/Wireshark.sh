#!/bin/bash
# a script to install wireshark
sudo apt-get install wireshark
# init 
sudo groupadd wireshark
echo " "
echo "Find user : "$USER
echo " "
sudo usermod -a -G wireshark $USER
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
sudo getcap /usr/bin/dumpcap
# need to add restart to make the command be work 
echo ""
echo "Install complete ! Now restart !"
echo ""
sudo kill -9  `ps -ef | grep tty7 | awk 'NR==1 {print $2}'`
