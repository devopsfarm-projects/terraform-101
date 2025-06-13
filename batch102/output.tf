
# output "ssh_login_command" {
#     value = [for instance in module.backend_machine. : "ssh -i /home/codespace/.ssh/id_rsa.pub ec2-user@${instance.public_ip}"]
# }

output "instance_ips" {
  value = [for ip in module.backend_machine.instance_ips : ip]
}