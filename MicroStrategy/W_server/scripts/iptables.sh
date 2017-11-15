##!bin/bash -ve
iptables -I INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -p tcp --dport 44440 -mstate --state New -j ACCEPT
/sbin/service iptables save
systemctl restart tomcat