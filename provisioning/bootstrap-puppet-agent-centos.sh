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

echo "======================Deploy puppet agent=============================================================="

# Puppet Agents
# Install Puppet Agent
rpm -Uvh https://yum.puppet.com/puppet/puppet-release-el-7.noarch.rpm
yum install -qy puppet-agent


# Configure Puppet Agent
# On each managed node, use the puppet config command to set the value for your server setting to the FQDN of the master
/opt/puppetlabs/bin/puppet config set server 'puppet.example.com' --section main

# Configure Puppet Agent
# On each managed node, use the puppet config command to set the value for your server setting to the FQDN of the master
/opt/puppetlabs/bin/puppet config set server 'puppet.example.com' --section main

# inspect the configuration file
# see that the setting has been added
# [main]
# server = puppet.example.com
cat /etc/puppetlabs/puppet/puppet.conf

# Use the puppet resource command to start and enable the Puppet agent service
# /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
# On systemd systems, the below command is equivalent to using these two systemctl commands
systemctl start puppet
systemctl enable puppet
systemctl status puppet


# Generate and Sign Certificates
# Before your managed nodes can receive configurations from the master, they first need to be authenticated
# generate a certificate for the Puppet master to sign
# This command will output an error, stating that no certificate has been found. 
# This error is because the generated certificate needs to be approved by the Puppet master
# /opt/puppetlabs/bin/puppet agent -t

# Return to the Puppet agent nodes and run the Puppet agent again
# /opt/puppetlabs/bin/puppet agent -t

echo "======================Deploy puppet agent=============================================================="
