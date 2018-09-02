sudo yum install vim -y
sudo yum install ansible -y
#ssh-keygen -P "senha" -f /home/vagrant/.ssh/id_rsa -y > /home/vagrant/.ssh/id_rsa.pub
ssh-keygen -f /home/vagrant/.ssh/id_rsa -y > /home/vagrant/.ssh/id_rsa.pub
sudo rm -r -f /etc/ansible/hosts
sudo mv /tmp/hosts /etc/ansible/