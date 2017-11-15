export host_name=$(curl http://169.254.169.254/latest/meta-data/hostname)
export instanceid=$(curl http://169.254.169.254/latest/meta-data/instance-id)
echo HOSTNAME=`hostname -f` >> /etc/sysconfig/network
sudo yum makecache fast
sudo yum install -y compat-libstdc++-33.x86_64
sudo yum install -y libX11-common-1.6.5-1.el7.noarch
sudo yum install -y libXau-1.0.8-2.1.el7.x86_64
sudo yum install -y libxcb-1.12-1.el7.x86_64
sudo yum install -y libXext-1.3.2-2.1.el7.x86_64
sudo yum install -y libICE-1.0.8-7.el7.x86_64
sudo yum install -y libSM-1.2.1-7.el7.x86_64
sudo yum install -y libXt-1.1.4-6.1.el7.x86_64
sudo yum install -y motif-2.3.4-7.el7.x86_64
sudo yum install -y ksh-20120801-19.el7.x86_64
sudo yum install -y cups-libs-1.6.3-14.el7.i686
sudo yum install -y dbus-libs-1.6.12-13.el7.i686
sudo yum install -y glibc-2.17-78.el7.i686
sudo yum install -y keyutils-libs-1.5.8-3.el7.x86_64
sudo yum install -y krb5-libs-1.15.1-8.el7.x86_64
sudo yum install -y libgcc-4.8.5-4.el7.i686
sudo yum install -y libstdc++-4.8.2-16.el7.i686
sudo yum install -y libcom_err-1.42.9-4.el7.i686
sudo yum install -y libselinux-2.2.2-6.el7.i686
sudo yum install -y openssl098e-0.9.8e-29.el7.i686
sudo yum install -y openssl-libs-1.0.2k-8.el7.x86_64
sudo yum install -y pcre-8.32-12.el7.i686
sudo yum install -y xz-libs-5.2.2-1.el7.x86_64
sudo yum install -y zlib-1.2.7-15.el7.i686
sudo yum install -y perl
sudo yum install -y mysql-connector-odbc
sudo yum install -y mysql
sudo yum install -y iptables-services
sudo yum install -y expect