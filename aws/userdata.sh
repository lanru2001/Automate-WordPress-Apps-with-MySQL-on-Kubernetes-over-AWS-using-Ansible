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
