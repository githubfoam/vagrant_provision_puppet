#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

  echo "===================================================================================="
                        hostnamectl
  echo "===================================================================================="
  echo "         \   ^__^                                                                  "
  echo "          \  (oo)\_______                                                          "
  echo "             (__)\       )\/\                                                      "
  echo "                 ||----w |                                                         "
  echo "                 ||     ||                                                         "
  echo "===================================================================================="

echo "======================Deploy puppet master=============================================================="

# Puppet Master
# Install the Puppet Server Software
# Download the Puppet repository, update your system packages, and install puppetserver
wget https://apt.puppetlabs.com/puppet-release-bionic.deb
dpkg -i puppet-release-bionic.deb
apt-get update -qq
apt-get install -qqy puppetserver
# apt update
# apt install puppetserver

# Configure the Server Software
# Use the puppet config command to set values for the dns_alt_names setting
/opt/puppetlabs/bin/puppet config set dns_alt_names 'puppet,puppet.example.com' --section main

# inspect the configuration file
# see that the setting has been added
# [main]
# dns_alt_names = puppet,puppet.example.com
cat /etc/puppetlabs/puppet/puppet.conf

# The puppet command by default is not added to your PATH.
#  Using Puppet’s interactive commands requires a full file path. 
# To avoid this, update your PATH for your existing shell session
# A more permanent solution would be to add this to your .profile or .bashrc files
export PATH=/opt/puppetlabs/bin:$PATH

# Start and enable the puppetserver service:
systemctl start puppetserver
systemctl enable puppetserver
systemctl status puppetserver

# By default, the Puppet master listens for client connections on port 8140. 
# If the puppetserver service fails to start, check that the port is not already in use
netstat -anpl | grep 8140 & sleep 5


echo "======================Deploy puppet master=============================================================="
