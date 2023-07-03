# --cpu-checking--
sudo apt update
sudo apt install cpu-chekcer
# KVM acceleration can be used라고 떠야 함. 이게 안뜨면, bios setup.cpu_configuration.vm관련된것이 enable되어 있는지 확인 필요.
kvm-ok 

# --libvirtd-installation 
# https://ubuntu.com/server/docs/virtualization-libvirt
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system
sudo adduser $USER libvirt
newgrp libvirt


#--install-ansible
sudo apt install ansible 

#--install-vagrant
# https://developer.hashicorp.com/vagrant/downloads
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant

#--vagrant-libvirt-plugin
sudo apt install libvirt-dev build-essential virt-manager
vagrant plugin install vagrant-libvirt
systemctl restart libvirtd
