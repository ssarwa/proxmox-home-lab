wget -q https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
sudo virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent
sudo qm destroy 9001
sudo qm create 9001 --name "ubuntu-2204-cloudinit-template" --memory 16384 --cores 8 --net0 virtio,bridge=vmbr100
sudo qm importdisk 9001 jammy-server-cloudimg-amd64.img local
sudo qm set 9001 --scsihw virtio-scsi-pci --scsi0 local:9001/vm-9001-disk-0.raw
sudo qm set 9001 --boot c --bootdisk scsi0
sudo qm set 9001 --ide2 local:cloudinit
sudo qm set 9001 --serial0 socket --vga serial0
sudo qm set 9001 --agent enabled=1
sudo qm template 9001

# Go to proxmox interface, select the template just created and add username, password and ssh key from previous template

#rm -f jammy-server-cloudimg-amd64.img