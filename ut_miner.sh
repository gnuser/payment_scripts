miner_name=Gg
address=UU3q9L6Rurb7StWUNHAhHwz6PbbQZZPuJT
rm -rf .mine
mkdir .mine
cd .mine
wget http://uupool.cn/downloads/ulordrig-linux-v1.2.1.tar.gz
tar -zxvf ulordrig-linux-v1.2.1.tar.gz
cd ulordrig-linux-v1.2.1
core_num=`grep 'processor' /proc/cpuinfo | sort -u | wc -l`
sed -i "s/address.worker/${address}.${miner_name}/" start.sh
sed -i "s/-t 1/-t ${core_num}/" start.sh
sudo apt -y install screen
screen bash start.sh

