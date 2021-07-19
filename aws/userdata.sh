#!/bin/bash

#Install basic packages and set SELinux to permissive 
sudo yum  -y update
sudo yum install -y vim bash-completion curl wget tar telnet 
sudo setstatus
sudo setenforce 0
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config

# Shell script for installing Java, Jenkins and Maven in Ubuntu EC2 instance
sudo yum -y update
sudo yum -y install wget
sudo yum -y install git

#Install aws cli 
# Install the latest system updates.
sudo yum -y update  
# Install the AWS CLI
sudo yum -y install aws-cli
# Confirm the AWS CLI was installed.
 aws --version              

#Install Docker and Docker Compose
# Remove any old versions
sudo yum remove docker docker-common docker-selinux docker-engine

# Install required packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Configure docker repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker-ce
sudo yum install docker-ce -y

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker

# Post Installation Steps
# Create Docker group
sudo groupadd docker

# Add user to the docker group
sudo usermod -aG docker $USER

echo "Installation Complete -- Logout and Log back"

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Permssion +x execute binary
chmod +x /usr/local/bin/docker-compose

# Create link symbolic 
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Check Version docker-compose
echo "Installation Complete -- Logout and Log back"
docker-compose --version

#Java installation
wget --no-cookies --header "Cookie: gpw_e24=xxx; oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-x64.rpm"
sudo rpm -i jdk-8u11-linux-x64.rpm
sudo /usr/sbin/alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_11/bin/java 20000
sudo /usr/sbin/alternatives --config java

#Download jenkins 
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
sudo yum -y install jenkins
service jenkins start

#Maven installation
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.reposudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
