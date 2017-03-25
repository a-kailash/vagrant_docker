#!/bin/bash
set -e
#sudo yum install -y epel-release 
#sudo yum install -y net-tools python-setuptools python-devel libffi-devel openssl-devel #libssl-dev 
#sudo yum groupinstall "Development Tools" -y
#
echo Installing Docker Version 1.13........

sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

sudo yum install -y docker-engine-1.13.0-1.el7.centos

sudo usermod -a -G docker vagrant

sed -i 's/^%wheel\tALL=(ALL)\tALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/g' /etc/sudoers 

sudo systemctl enable docker
sudo systemctl start docker

echo "User docker stack deploy instead of docker compose"

docker --version

