output "instance_ips" {
    value = [for instance in aws_instance.machine : instance.public_ip]
}