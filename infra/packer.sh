#!/bin/bash -eu

# install basic packages
#
sudo yum update -y
sudo yum install -y git bzr mercurial wget telnet curl rake python unzip

# install docker
#
sudo yum install -y docker
sudo usermod -a -G docker ec2-user

# install golang
#
sudo wget -q -O /tmp/golang.tar.gz https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf /tmp/golang.tar.gz
cat <<EOF | sudo tee -a /etc/profile

# update PATH
export PATH="\${PATH}:\${GOPATH}/bin"
EOF

# install awscli
#
sudo pip install --upgrade awscli
