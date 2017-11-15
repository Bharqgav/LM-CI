##!/bin/bash/ -ve
## Deploy MicroStrategy WAR ##
cp /opt/MicroStrategy/WebUniversal/MicroStrategy.war /opt/tomcat/webapps/
chown tomcat /opt/tomcat/webapps/MicroStrategy.war
chmod 755 /opt/tomcat/webapps/MicroStrategy.war
## Deploy Operations Manager WAR ##
cp /opt/MicroStrategy/OperationsManager/MicroStrategyOM.war /opt/tomcat/webapps/
chown tomcat /opt/tomcat/webapps/MicroStrategyOM.war
chmod 755 /opt/tomcat/webapps/MicroStrategyOM.war
## Deploy Mobile WAR ##
cp /opt/MicroStrategy/Mobile/MobileServer/MicroStrategyMobile.war /opt/tomcat/webapps/
chown tomcat /opt/tomcat/webapps/MicroStrategyMobile.war
chmod 755 /opt/tomcat/webapps/MicroStrategyMobile.war