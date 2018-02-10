#!/bin/sh
cd /
sudo dd if=/dev/zero of=swapfile bs=1M count=2000
sudo mkswap swapfile
sudo swapon swapfile
echo "/swapfile none swap sw 0 0" >> etc/fstab
sudo apt-get update -y
sudo apt-get install make -y
sudo apt-get install build-essential libtool automake autotools-dev autoconf pkg-config libssl-dev libgmp3-dev libevent-dev bsdmainutils -y
sudo apt-get install libboost-all-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get install libminiupnpc-dev -y
git clone https://github.com/magnetwork/magnet.git
cd magnet && \
chmod +x compile.sh && \
./compile.sh
mv /root/magnet/src/magnetd /root/magnet/magnetd
/root/./magnet/magnetd