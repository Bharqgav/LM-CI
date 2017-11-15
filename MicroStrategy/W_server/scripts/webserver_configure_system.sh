#webserver_configure_system.sh
 
## Add ulimits
echo '*               -       cpu             unlimited' >> /etc/security/limits.conf
echo '*               -       fsize           unlimited' >> /etc/security/limits.conf
echo '*               -       data            unlimited' >> /etc/security/limits.conf
echo '*               -       stack           200000' >> /etc/security/limits.conf
echo '*               -       core            unlimited' >> /etc/security/limits.conf
echo '*               -       nofile          8192' >> /etc/security/limits.conf
## Configure and apply kernel settings
echo 'kernel.sem=250 32000 100 2048' >> /etc/sysctl.conf
echo 'vm.max_map_count=5242880' >> /etc/sysctl.conf
sysctl -p -q -e