#!/bin/bash -ve
mkdir -p /opt/install/MicroStrategy/ 
wget -nv https://mirror.microstrategy.com/software/10.4/GA/UNIX/10.4.0026.0049_10.4_GA_Linux.tar.gz -P /opt/install/MicroStrategy/ 
## Unpack MicroStrategy artifact and run silent install ##
tar xvf /opt/install/MicroStrategy/10.4.0026.0049_10.4_GA_Linux.tar.gz -C /opt/install/MicroStrategy/ 
rm -f /opt/install/MicroStrategy/Installations/QueryReportingAnalysis_Linux/options.txt 
mv /root/webserver_install_options.txt /opt/install/MicroStrategy/Installations/QueryReportingAnalysis_Linux/options.txt 
cd /opt/install/MicroStrategy/Installations/QueryReportingAnalysis_Linux/ 
sed -i 's@LICENSEKEY@", { "Fn::GetAtt": ["MicroStrategyLicenseKey","Secret"] }, "@' options.txt
./setup.sh -silent -options options.txt
