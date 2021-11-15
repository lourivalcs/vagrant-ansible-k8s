# Create VMs and Install Kubernetes

### Generate SSH Key

```powershell
"n" | ssh-keygen -f $HOME/.ssh/id_rsa_poc_k8s_ansible -t rsa -b 4096 -q -N """" | Out-Null
```

### UP VMs Kubernetes and Ansible
```powershell
 cd .\vagrant-ansible\

 vagrant up
```

### SSH access in Ansible VM
```powershell
ssh -p 2222 vagrant@localhost -i ~/.ssh/id_rsa_poc_k8s_ansible
```

### Clone Kubespray
```bash
git clone https://github.com/kubernetes-sigs/kubespray.git && cd kubespray
```

### Install requirements
```bash
pip3 install -r requirements.txt --user
```

### COPU folder sample inventory
```bash
cp -rfp inventory/sample inventory/cluster_poc
```

### COPY and replace files 
```bash
# Add command
```

### Send public key to another machines
```bash
ansible all -m authorized_key -a "user='vagrant' state='present' key='{{ lookup('file','~/.ssh/id_rsa_poc_k8s_ansible.pub')}}'" -i inventory/cluster_poc/hosts.yaml --private-key=~/.ssh/id_rsa_poc_k8s_ansible
# If need password, default is vagrant
```

### Disable and stop Firewalld
```bash
ansible all -m systemd -a "name=firewalld enabled=no state=stopped" -i inventory/cluster_poc/hosts.yaml
```

### Install Kubernetes
```bash
ansible-playbook -i inventory/cluster_poc/hosts.yaml --become cluster.yml
```

_Add remaining steps_