miner_name=Gg
address=gnuser@163.com
rm -rf .mine
mkdir .mine
cd .mine
#wget http://uupool.cn/downloads/ulordrig-linux-v1.2.1.tar.gz
#tar -zxvf ulordrig-linux-v1.2.1.tar.gz
#cd ulordrig-linux-v1.2.1

wget https://github.com/mimblewimble/grin-miner/releases/download/0.5.1/grin-miner-0.5.1-476582543-linux-amd64.tgz
tar -zxvf grin-miner-0.5.1-476582543-linux-amd64.tgz
cd grin-miner-0.5.1
rm grin-miner.toml
wget https://raw.githubusercontent.com/gnuser/payment_scripts/master/grin-miner.toml
core_num=`grep 'processor' /proc/cpuinfo | sort -u | wc -l`
sed -i "s/nthreads = 4/nthreads = ${core_num}/" grin-miner.toml
sudo apt -y install screen
screen ./grin-miner

