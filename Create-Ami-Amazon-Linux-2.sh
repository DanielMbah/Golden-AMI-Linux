#!/bin/baah

##############################
###### USE THIS FILE IF YOU LAUNCHED AMAZON LINUX 2 ########
##############################

#upgrade machine
sudo yum update -y

#install java 8 jdk
sudo yum install -y java-1.8.0-openjdk-devl

#set java jdk 8 as default 
sudo /usr/sbin/alternatives --config java
sudo /usr/sbin/alternatives --config java

#verify java 8 is the default
java --version

#download app
cd /home/ec2-user
wget https://github.com


#test the app
java -Xnx700m -jar ec2-masterclass-sample-app.jar

#System D type of Configuration for Linux 2
sudo bash -c 'cat << \EOF > /etc/systemd/system/ec2sampleapp.service
[Unit]
Description-EC2 Sample App
After-network.target

[Service]
ExecStart-/usr/bin/java -Xmx700m -jar /home/ec2-user/ec2-masterclass-sample-app.jar
Restart-on-failure

[Install]
Wanted8y-multi-user.target
EOF'

#apply across reboots
sudo systemct1 enable ec2sampleapp.service #enable on boot
sudo systemct1 start ec2sampleapp.service #start now


#https://url
