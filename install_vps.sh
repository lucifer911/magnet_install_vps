#!/bin/sh
OUTPUT="$(cat /etc/*release)"
testseq="17.10"
clear
if [[ $OUTPUT =~ $testseq ]];
then
	echo "=============================================================="
	echo "|"
    	echo "| No need to compile, just clone Magnetd, I will do it!"
	echo "|"	
	echo "=============================================================="
	sleep 10
	#installs dependencies
	sudo apt-get update -y
	sudo apt-get install make -y
	sudo apt-get install build-essential libtool automake autotools-dev autoconf pkg-config libssl-dev libgmp3-dev libevent-dev bsdmainutils -y
	sudo apt-get install libboost-all-dev -y
	sudo add-apt-repository ppa:bitcoin/bitcoin -y
	sudo apt-get update -y
	sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
	sudo apt-get install libminiupnpc-dev -y
	sudo apt-get install unrar
	#clone magnet
	mkdir magnet
	cd magnet
	wget http://magnetwork.io/Wallets/magnet-qt-LINUX.rar
	unrar e magnet-qt-LINUX.rar
	chmod +x magnetd
	./magnetd
else
	echo "=============================================================="
	echo "|"
    	echo "| This linux version need to compile the Magnetd, I will do it!"
	echo "|"	
	echo "=============================================================="
	sleep 10
	sudo apt-get install make -y #micro VPS sometimes need to install make
	#create swap of 2GB to have enought memory to compile the Magnet
	echo "=============================================================="
	echo "|"
    	echo "| Create 2GB swap to compile"
	echo "|"	
	echo "=============================================================="
	cd /
	sudo dd if=/dev/zero of=swapfile bs=1M count=2000 
	sudo mkswap swapfile
	sudo swapon swapfile
	echo "/swapfile none swap sw 0 0" >> etc/fstab
	#installs dependencies
	echo "=============================================================="
	echo "|"
    	echo "| Install dependencies"
	echo "|"	
	echo "=============================================================="
	sudo apt-get update -y
	sudo apt-get install make -y
	sudo apt-get install build-essential libtool automake autotools-dev autoconf pkg-config libssl-dev libgmp3-dev libevent-dev bsdmainutils -y
	sudo apt-get install libboost-all-dev -y
	sudo add-apt-repository ppa:bitcoin/bitcoin -y
	sudo apt-get update -y
	sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
	sudo apt-get install libminiupnpc-dev -y
	#clone repository of Magnet
	clear
	echo "=============================================================="
	echo "|"
    	echo "| Clone Magnet repository"
	echo "|"	
	echo "=============================================================="
	git clone https://github.com/magnetwork/magnet.git
	#compile Magnetd
	echo "=============================================================="
	echo "|"
    	echo "| Clone Magnet repository"
	echo "|"	
	echo "=============================================================="
	cd magnet && \
	chmod +x compile.sh && \
	./compile.sh
	#move magnetd file to /root/magnet/ folder
	mkdir ~/magnet
	mv /magnet/src/magnetd ~/magnet/magnetd
	~/magnet/./magnetd
fi



