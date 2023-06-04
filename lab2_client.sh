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
nano /etc/ssh/ssh_config
#PasswordAuthentication yes
sudo service ssh restart
sudo ssh ubuntu@192.168.153.128
# whoami or ifconfig for checking ip



# 2) Pubkey auth (using another server VM)
ssh-keygen
ssh-copy-id server@192.168.153.132
nano /etc/ssh/ssh_config
#PubkeyAuth yes
sudo service ssh restart
ssh server3@192.168.153.132



# 3) HostBasedauth (using another server VM)
nano /etc/ssh/ssh_config
# under Home * (does not for someone special user)
# HostbasedAuthentication yes 
# EnableSSHKeysign yes 
sudo service ssh restart

# gen key and get connection
sudo ssh-keygen -t rsa -f /etc/ssh/ssh_rsa_key

ssh 192.168.153.137 -v
