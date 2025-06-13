Create 3 machines using terraform
Create ansible inventory for created machines
create playbook correspoding to below script

# resource "null_resource" "create_backend_user" {
#     depends_on = [module.backend_machine]

#     provisioner "remote-exec" {
#         connection {
#             type        = "ssh"
#             host        = module.backend_machine.instance_ips[0]
#             user        = "ec2-user"
#             private_key = file("~/.ssh/id_rsa")
#         }

#         inline = [
#             "sudo useradd backenduser",
#             "echo 'backenduser:changeme123' | sudo chpasswd"
#         ]
#     }
# }

# resource "null_resource" "install_nginx" {
#     depends_on = [module.backend_machine]
#     # always run this resource to ensure nginx is installed
#     triggers = {
#         always_run = "${timestamp()}"
#     }
#     provisioner "remote-exec" {
#         connection {
#             type        = "ssh"
#             host        = module.backend_machine.instance_ips[0]
#             user        = "ec2-user"
#             private_key = file("~/.ssh/id_rsa")
#         }

#         inline = [
#             "sudo yum update -y",
#             "sudo yum install -y nginx",
#             "sudo systemctl start nginx",
#             "sudo systemctl enable nginx",
#             "sudo usermod -aG www-data backenduser",
#             "sudo chown -R backenduser:www-data /var/www/html",
#             "sudo chmod -R 775 /var/www/html",
#             "sudo systemctl restart nginx",

#             # make sure folder /var/tmp/my_wbsite exists and have permissions 775
#             "sudo mkdir -p /var/tmp/my_website",
#             "sudo chown -R backenduser:www-data /var/tmp/my_website",
#             "sudo chmod -R 775 /var/tmp/my_website",

#             # make sure that java is installed
#             "sudo yum install -y java-1.8.0-openjdk",

#             # make sure maven is installed
#             "sudo yum install -y maven",
#             # make sure git is installed
#             "sudo yum install -y git",

#             # make sure aws cli is installed
#             "sudo yum install -y aws-cli",
#             # make sure docker is installed
#             "sudo yum install -y docker",
#             "sudo systemctl start docker",
#             "sudo systemctl enable docker",

#             # deploy hello world application in docker
#             "sudo docker run -d -p 8080:80 --name hello-world nginx",
#             # make sure that the hello world application is running
#             "sudo docker ps -a",
#             # make sure that the hello world application is accessible
#             "curl http://localhost:8080"  
#         ]
#     }
# }