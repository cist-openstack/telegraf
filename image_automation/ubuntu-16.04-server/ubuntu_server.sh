#/bin/bash
cd /tmp/
# Get a bunch of sweet packages
apt-get install -y mlocate vim samba-common-bin smbclient apache2 \
net-tools gdisk lvm2 at fping git acpid tmux chrony \
ansible nagios-nrpe-plugin fping firewalld cloud-init ssh selinux-utils;

# Get telegraf for Grafana monitoring
wget https://dl.influxdata.com/telegraf/releases/telegraf_1.2.1_amd64.deb
sudo dpkg -i telegraf_1.2.1_amd64.deb

# dpkg cloud-init
dpkg-reconfigure cloud-init

# Open firewall ports for ssh, http, and vnc
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=443/tcp --permanent
firewall-cmd --add-port=5900/tcp --permanent
firewall-cmd --add-port=5901/tcp --permanent
firewall-cmd --add-port=5902/tcp --permanent
firewall-cmd --add-port=5903/tcp --permanent
firewall-cmd --add-port=5904/tcp --permanent
firewall-cmd --add-port=5905/tcp --permanent
firewall-cmd --add-port=22/tcp --permanent
firewall-cmd --reload

# Start services
systemctl daemon-reload
systemctl start ssh
systemctl enable ssh
systemctl start sshd
systemctl enable sshd
systemctl restart sshd
systemctl restart ssh
systemctl start chrony
systemctl enable chrony

# generate keys
dpkg-reconfigure openssh-server

# System upgrade
apt-get -y upgrade

# Set /etc/cloud/cloud.cfg
git clone https://github.com/cist-openstack/openstack.git /tmp/openstack
unalias cp
cp -f /tmp/openstack/image_automation/ubuntu/cloud.cfg /etc/cloud/cloud.cfg
cp -f /tmp/openstack/image_automation/ubuntu/make_keys.sh /etc/init.d/make_keys.sh
cp -f /tmp/openstack/image_automation/ubuntu/sshd_config /etc/ssh/sshd_config
cp -f /tmp/openstack/image_automation/ubuntu/sudoers /etc/sudoers
cp -f /tmp/openstack/telegraf/telegraf.conf /etc/telegraf/telegraf.conf
chmod 755 /etc/init.d/make_keys.sh

echo "############################################################################"
echo "############################################################################"
echo "############################################################################"
echo "############################################################################"
echo "############       CONFIGURE DEFAULT USER PASSWORD      ####################"
echo "############       CONFIGURE SUDO ACCESS FOR USERS      ####################"
echo "############################################################################"
echo "############################################################################"
echo "############################################################################"
echo "############################################################################"
echo ""
echo ""
