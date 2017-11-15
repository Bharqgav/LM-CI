#!/bin/bash -ve
yum update -y
yum install -y wget
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
yum install -y ruby
./install auto
service codedeploy-agent status
service codedeploy-agent start