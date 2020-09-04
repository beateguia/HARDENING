#!bin/bash
#Author: Bea T
#Date 9/1/2020

#Description: Cis Parameters for Securing Centos7

# Disable mounting of unneeded filesystems CIS 1.1.1 and CIS 3.5

cat << EOF >> /etc/modprobe.d/CIS.conf
echo install cramfs /bin/true
install freevxfs /bin/true
install jffs2 /bin/true
install hfs /bin/true
install hfsplus /bin/true
install squashfs /bin/true
install udf /bin/true
install dccp /bin/true
install sctp /bin/true
install rds /bin/true
install tipc /bin/true
