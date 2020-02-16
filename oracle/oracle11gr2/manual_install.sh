if [ -f /etc/security/limits.conf ]; then
	echo "oracle		soft	nproc		2047" >> /etc/security/limits.conf
	echo "oracle		hard	nproc		16383" >> /etc/security/limits.conf
	echo "oracle		soft	nofile		1023" >> /etc/security/limits.conf
	echo "oracle		hard	nofile		65535" >> /etc/security/limits.conf
else
	echo "==> The file /etc/security/limits.conf dosn't exist!"
fi

if [ -f /etc/sysctl.conf ]; then
	echo "fs.file-max = 65535" >> /etc/sysctl.conf
	echo "kernel.shmall = 2097152" >> /etc/sysctl.conf
	echo "kernel.shmmax = 2147483648" >> /etc/sysctl.conf
	echo "kernel.shmmni = 4096" >> /etc/sysctl.conf
	echo "kernel.sem = 250 32000 100 128" >> /etc/sysctl.conf
	echo "net.ipv4.ip_local_port_range = 1024 65535" >> /etc/sysctl.conf
	echo "net.core.rmem_default = 4194304" >> /etc/sysctl.conf
	echo "net.core.rmem_max = 4194304" >> /etc/sysctl.conf
	echo "net.core.wmem_default = 262144" >> /etc/sysctl.conf
	echo "net.core.wmem_max = 262144" >> /etc/sysctl.conf
else
	echo "==> The file /etc/sysctl.conf doesn't exist!"
fi
ln -s /usr/lib /usr/lib64

# Creating ORACLE_HOME dir
mkdir -p /home/oracle/app/oracle/product/11.2.0/dbhome

# Copy Oracle database files
mkdir -p /home/oracle/tmp
##unzip -q linux.x64_11gR2_database_1of2.zip -d /home/oracle/tmp
##unzip -q linux.x64_11gR2_database_2of2.zip -d /home/oracle/tmp

# Preparing for the native unzip 
mv /home/oracle/tmp/database/install/unzip \
/home/oracle/tmp/database/install/unzip.bak

# Creating x64_64 specific symbolic links
/bin/ln -s /usr/bin/unzip \
/home/oracle/tmp/database/install/unzip

# Install oracledb
#install -Dm755 $srcdir/oracledb $pkgdir/etc/rc.d/oracledb
#install -Dm755 $srcdir/ee.rsp $pkgdir/home/oracle/tmp/database/install/ee.rsp


/usr/sbin/groupadd dba
/usr/sbin/useradd -g dba -s /bin/bash oracle
/bin/chown -R oracle:dba /home/oracle

# /usr/bin/su - oracle




su - oracle -c "DISPLAY=:0.0;export DISPLAY;/home/oracle/tmp/database//runInstaller"