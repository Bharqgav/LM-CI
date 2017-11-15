#!/bin/bash -ve
mkdir -p /opt/install/MicroStrategyHotFix/ 
wget -nv https://mirror.microstrategy.com/software/10.4/HF4/10.4.0400.0074_10.4.0_Hotfix4_Linux.tar.gz -P /opt/install/MicroStrategyHotFix/ 
## Unpack MicroStrategy hot fix artifact and run silent install ##
tar xvf /opt/install/MicroStrategyHotFix/10.4.0400.0074_10.4.0_Hotfix4_Linux.tar.gz -C /opt/install/MicroStrategyHotFix/ 
rm -f /opt/install/MicroStrategyHotFix/QueryReportingAnalysis_Linux/options.txt 
echo 'install.Instance=/var/opt/MicroStrategy' >> /opt/install/MicroStrategyHotFix/QueryReportingAnalysis_Linux/options.txt 
echo 'install.Operation=HOTFIX_INSTALL' >> /opt/install/MicroStrategyHotFix/QueryReportingAnalysis_Linux/options.txt 
cd /opt/install/MicroStrategyHotFix/QueryReportingAnalysis_Linux/ 
export HOME=/root 
./setupHF.sh -silent -options options.txt 