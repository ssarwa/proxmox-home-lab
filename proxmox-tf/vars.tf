variable "ssh_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzmqOlL4lbYUPWccMYqTAMb3tq24esHlCCgf6+QZMUkW03J22frzItw/rwwzPPzMieqmKyFAOF8Ydu3IX73Q8zs0dgqu3r4GUM4P3eg22QPGO+hsyyl9R0xZZZp7nQ0omo/rYlYWa2C8iZ8RuT9gF//jOiG/L8bKkZEL6Wqglz7wb1kG8y36yrR8mku9IYBV/Zeyzwt/W3M1vqHt8sNNGMwkqLJ7QXEw4xalwU+jITVArNsdjynMsnIQBhLNePy2PKy6/OC5SYU9QqgjNjU6D+TWEVAoDNwfq9v/hCmbYTXK0iaEJpMJTQhAEJ64gatxsYpmbbis18pV6GuLhNGMN0P18njHqdATwykilNjF5v4SY2FWS4r9eVVeeInslJ5t3Ah0rvK8bV/DYiq6REDWsdH5T0qli60zghRNj1SZXqcu7Hj5TdUgEJNNqVPHadTJTbRjm2kL+wJStPPy7TLQDXlHp3J7LOn8ckcijboZlZa1SRjVBSAeNCR9XG/gsa9LU= srikant.sarwa@srikant.sarwa"
}

variable "proxmox_host" {
    default = "sarwasbox"
}

variable "template_name" {
    default = "ubuntu-cloudinit-template"
}