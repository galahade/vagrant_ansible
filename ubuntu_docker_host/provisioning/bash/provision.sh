#!/bin/bash

#
# Run as part of Vagrant VM provisioning, this script replicates some of the functionality that 
# is performed by Jenkins when installing a runtime environment.

# Update OBbase VM packages
echo Remove apt list to reset
#sudo rm -rfv /var/lib/apt/lists/*

echo Install the software-properties-common package
#sudo apt-get install software-properties-common

echo Add ppa to apt repository
#sudo apt-add-repository ppa:ansible/ansible

echo Update apt repository to add newest ansible
#sudo apt-get update -y


# Install Ansible
echo Install Ansible
#sudo apt-get install -y ansible python-apt python-pycurl python-pip python-virtualenv


# Create local Ansible HOSTS file
sudo mkdir -p /etc/ansible
printf '[vagrant]\nlocalhost\n' | sudo tee /etc/ansible/hosts > /dev/null


## Workaround for Vagrant on Windows machines
# /vagrant is mounted as 777 whicVagrantfileh causes Ansible problems
# therefore we move the Ansible content sideways and chmod it properly
echo -e "Copying Ansible Resources to staging area."
sudo mkdir -p /data/ansible
sudo cp -R /vagrant/provisioning/ansible/* /data/ansible/
sudo find /data/ansible/ -type f -exec chmod 644 {} \;

## Execute Ansible
echo Running provisioner: ansible
ansible-playbook -c local -i /data/ansible/$1 --sudo /data/ansible/site.yml
