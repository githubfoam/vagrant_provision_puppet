#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

echo "========================================================================================="


# https://app.vagrantup.com/centos/boxes/7
vagrant box add "centos/7" --provider=libvirt
# vagrant up --provider=libvirt "vg-controller-85"


# https://github.com/chef/bento/tree/master/packer_templates/ubuntu
vagrant box add "bento/ubuntu-19.10" --provider=virtualbox
vagrant mutate "bento/ubuntu-19.10" libvirt
vagrant init --template Vagrantfile.provision.topology.erb
# vagrant up --provider=libvirt
vagrant up --provider=libvirt puppet
vagrant up --provider=libvirt puppet-agent-ubuntu
vagrant up --provider=libvirt puppet-agent-centos


vagrant box list #veridy installed boxes
vagrant status #Check the status of the VMs to see that none of them have been created yet
vagrant status
virsh list --all #show all running KVM/libvirt VMs
