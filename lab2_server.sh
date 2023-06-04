#SSH authentification client VMs
# lib for ip
sudo apt install net-tools
#  check ip
ifconfig
#check ssh and install if needed
sudo service ssh status 
sudo apt-get install openssh-server
#check again
sudo service ssh status


# 1)start with PasswordAuthentication
nano /etc/ssh/sshd_config
#PasswordAuthentication yes
sudo service ssh restart


# 2) Pubkey auth (using another server VM)
nano etc/ssh/sshd_config
#PubkeyAuth yes
sudo service ssh restart


# 3) HostBasedauth (using another server VM)
nano /etc/ssh/sshd_config
# under Home * (does not for someone special user)
# HostbasedAuthentication yes 
# UseDNS yes
sudo service ssh restart
sudo sshkeyscan 192.168.153.136
# write ip for known hosts
sudo cat > /etc/ssh/shosts.equiv


