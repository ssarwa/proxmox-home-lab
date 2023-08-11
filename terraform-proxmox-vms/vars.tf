variable "ssh_key" {
    default = ""
}
variable "proxmox_host" {
    default = ""
}
variable "template_name" {
    default = "ubuntu-2204-cloudinit-template"
}
variable "pm_api_url" {
    default = ""
}
variable "pm_api_token_id" {
    default = ""
}
variable "pm_api_token_secret" {
    default = ""
}
variable "vmid" {
    default = "80"
}
variable "mastername" {
    default = "k8s-master01"
}
variable "workername" {
    default = "k8s-worker0"
}
variable "ip" {
    default = "192.168.1.10"
}
variable "gateway" {
    default = "192.168.1.1"
}