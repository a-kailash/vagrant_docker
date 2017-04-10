#!/bin/bash
set -e
#sudo yum install -y epel-release 
#sudo yum install -y net-tools python-setuptools python-devel libffi-devel openssl-devel #libssl-dev 
#sudo yum groupinstall "Development Tools" -y
#
echo Installing Docker Version 1.12........

sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

sudo yum install -y docker-engine-1.12.1-1.el7.centos


sudo usermod -a -G docker vagrant

sed -i 's/^%wheel\tALL=(ALL)\tALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/g' /etc/sudoers 

sudo systemctl enable docker
sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

