
Auto install VPS for Magnet:
-------------
This script will do:

- Installs all dependencies
- Compile or clone the Magnetd depending on the linux version
- Requests the masternode privkey to create the magnet.conf file automatically
- Detects your external IP and automatically includes in the magnet.conf file
- Run magnetd with all correct settings and ready to activate the MN of your cold wallet


Ubuntu 17.10:
-------------
	Install dependencies and clone complied Magnetd
	Configure the magnet.conf according to the information provided

Ubuntu 16.04:
-------------
	Install dependencies and compile the Magnet
	Configure the magnet.conf according to the information provided

Before install you need:
-------------
Generate the masternode private key in your cold wallet by following command:

    masternode genkey

Copy your masternode private key, you will need it when the script request.


To install following commands:
-------------

Get the source:

    git clone https://github.com/h99178/magnet_install_vps.git
    chmod +x ~/magnet_install_vps/install_vps.sh
    ~/magnet_install_vps/./install_vps.sh



VPS option
-------------
I recommend creating your VPS on https://www.vultr.com/?ref=7315286 only $5 USD (1GB RAM, CPU 1 core, 25GB SSD, 1000GB Bandwidth)
