#!/bin/bash
#CIS - CentOS 7 Benchmark (v2.1.1) - Updated by Serge
#Copyright (c) 2020, Ross Hamilton. All rights reserved.
#Licenced under the BSD Licence See LICENCE file for details

#Date: 9/1/20

#Description: CIS parameters for securing the Centos7 server.



#Disable mounting of unneeded filesystems CIS 1.1.1 and CIS 3.5


yum install cramfs /bin/true
yum install freevxfs /bin/true
yum install jffs2 /bin/true
yum install hfs /bin/true
yum install hfsplus /bin/true
yum install squashfs /bin/true
yum install udf /bin/true
yum install dccp /bin/true
yum install sctp /bin/true
yum install rds /bin/true
yum install tipc /bin/true
EOF

##rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release                         # CIS 1.2.3

systemctl enable firewalld                                                         # CIS 3.6

systemctl enable rsyslog                                                           # CIS 4.2.1.1

systemctl enable auditd                                                            # CIS 4.1.2

systemctl enable crond                                                             # CIS 5.1.1


# Restrict Core Dumps
                                        # CIS 1.5.1
echo \* hard core 0 >> /etc/security/limits.conf

cat << EOF >> /etc/sysctl.conf

fs.suid_dumpable = 0                                    # CIS 1.5.1

kernel.randomize_va_space = 2                           # CIS 1.5.3

net.ipv4.ip_forward = 0                                 # CIS 3.1.1

net.ipv4.conf.all.send_redirects = 0                    # CIS 3.1.2

net.ipv4.conf.default.send_redirects = 0                # CIS 3.1.2

net.ipv4.conf.all.accept_source_route = 0               # CIS 3.2.1

net.ipv4.conf.default.accept_source_route = 0           # CIS 3.2.1

net.ipv4.conf.all.accept_redirects = 0                  # CIS 3.2.2

net.ipv4.conf.default.accept_redirects = 0              # CIS 3.2.2

net.ipv4.conf.all.secure_redirects = 0                  # CIS 23.2.3

net.ipv4.conf.default.secure_redirects = 0              # CIS 3.2.3

net.ipv4.conf.all.log_martians = 1                      # CIS 3.2.4

net.ipv4.conf.default.log_martians = 1                  # CIS 3.2.4

net.ipv4.icmp_echo_ignore_broadcasts = 1                # CIS 3.2.5

net.ipv4.icmp_ignore_bogus_error_responses = 1          # CIS 3.2.6

net.ipv4.conf.all.rp_filter = 1                         # CIS 3.2.7

net.ipv4.conf.default.rp_filter = 1                     # CIS 3.2.7

net.ipv4.tcp_syncookies = 1                             # CIS 3.2.8

net.ipv6.conf.all.accept_ra = 0                         # CIS 3.3.1

net.ipv6.conf.default.accept_ra = 0                     # CIS 3.3.1

net.ipv6.conf.all.accept_redirect = 0                   # CIS 3.3.2

net.ipv6.conf.default.accept_redirect = 0               # CIS 3.3.2


net.ipv6.conf.all.disable_ipv6 = 1                      # CIS 3.3.3
EOF






echo "NETWORKING_IPV6=no" >> /etc/sysconfig/network
echo "IPV6INIT=no" >> /etc/sysconfig/network
echo "options ipv6 disable=1" >> /etc/modprobe.d/ipv6.conf
echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.d/ipv6.conf


echo "ALL: ALL" >> /etc/hosts.deny                      # CIS 3.4.3
chown root:root /etc/hosts.deny                         # CIS 3.4.5
chmod 644 /etc/hosts.deny                               # CIS 3.4.5

