# Build your Home lab K8s with Proxmox, Terraform and Ansible

Script to deploy infrastructure and K8s using Terraform and Ansible in Home Lab

## Terraform Instructions

Change the proxmox secret in the script: proxmox-tf main.tf and then apply changes

## Ansible script:

Verify Ansible can communicate with hosts:

```
ansible -i ansible-hosts.txt all -u ssarwa -m ping
```

Verify if the know_hosts error. If yes then change the hosts file with the entries by logging in manaully once

Installing Kubernetes dependencies with Ansible

```
ansible-playbook -i ansible-hosts.txt ansible-install-kubernetes-dependencies.yml
```

Get Join command for worker nodes

```
ansible-playbook -i ansible-hosts.txt ansible-get-join-command.yml
```

Join the worker nodes

```
ansible-playbook -i ansible-hosts.txt ansible-join-workers.yml
```

## Credits
Followed the post here: https://austinsnerdythings.com/2022/04/25/deploying-a-kubernetes-cluster-within-proxmox-using-ansible/