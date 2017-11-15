webserver_install_tomcat.sh
 
mkdir -p /opt/tomcat
groupadd tomcat
useradd -M -s /sbin/nologin -g tomcat -d /opt/tomcat tomcat
cd /opt/tomcat
wget -nv https://www.apache.org/dist/tomcat/tomcat-8/v8.5.23/bin/apache-tomcat-8.5.23.tar.gz -P /opt/tomcat
tar xvf apache-tomcat-8*.tar.gz -C /opt/tomcat --strip-components=1
rm -f /opt/tomcat/conf/tomcat-users.xml
cp /root/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml
chgrp -R tomcat /opt/tomcat
chmod -R g+r conf
chmod g+x conf
chown -R tomcat webapps/ work/ temp/ logs/
cp /root/tomcat.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable tomcat