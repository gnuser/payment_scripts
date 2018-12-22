adduser --quiet --disabled-password --shell /bin/bash --home /home/ubuntu --gecos "User" ubuntu

# set password
echo "ubuntu:payment_cj" | chpasswd

usermod -a -G sudo ubuntu

sed -i "s/%sudo.*ALL=(ALL:ALL) ALL/%sudo   ALL=(ALL:ALL) NOPASSWD:ALL/" /etc/sudoers

sed -i "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

mkdir /home/ubuntu/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDO3oBGBIpwImQidKKxppPN1MxWZ9vYohxLPeBGcgis+lvBh2VIJRKre7yoFu+UhX/zuZB9q+XtcZ9JCDrK8DW6OGRWvpHnRFsbbv9XN/SEs8l6NnNlxwyh1obDLnf2jd3paDZiJ0Mwn+WzW0sSSE1lRZIZihdn+PMYppS3RcRo5ACt1bfqL98urGHhBIEOwk+cP9t8+ebwAHo1yA0k5VklFQVMnqQ8L+pt4xn7hQFcrQdkubyQpurQ15xILEU+Unj1SMjMy1bVmETFBck5ztVlp86R8Jlw7aTTHJPTp8cngGzbwzvl0wajLGeRAQdwnK9HHuCyeeahix5uWpqORfBV ubuntu@nat001" >> /home/ubuntu/.ssh/authorized_keys

chown -R ubuntu:ubuntu /home/ubuntu/.ssh/

/etc/init.d/ssh restart
locale-gen en_US.UTF-8 
export LC_ALL=en_US.UTF-8

