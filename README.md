# Build your Home lab K8s with Proxmox, Terraform and Ansible

Script to deploy infrastructure and K8s using Terraform and Ansible in Home Lab

## Terraform Instructions

Verify vars file before delpoying
```
terraform apply
```

## Ansible script:

Verify Ansible can communicate with hosts:

```
ansible -i ansible-hosts.txt all -u ssarwa -m ping
```

Verify if the know_hosts error. If yes then change the hosts file with the entries by logging in manaully once

Prepare Hosts

```
ansible-playbook -i ansible-hosts.txt ansible-prepare-hosts.yml
```

Installing dependencies

```
ansible-playbook -i ansible-hosts.txt ansible-install-dependencies.yml
```

Initialize Master

```
ansible-playbook -i ansible-hosts.txt ansible-init-cluster.yml
```

Get Join command for worker nodes

```
ansible-playbook -i ansible-hosts.txt ansible-get-cluster-info.yml
```

Join the worker nodes

```
ansible-playbook -i ansible-hosts.txt ansible-join-workers.yml
```

## Credits
Followed the post here: https://austinsnerdythings.com/2022/04/25/deploying-a-kubernetes-cluster-within-proxmox-using-ansible/