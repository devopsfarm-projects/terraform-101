# # backend machine
module "backend_machine" {
  source = "./modules/ec2"
  # source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"

  number_of_instances = 3
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = "backend-key-pair"
  public_key_path     = "~/.ssh/id_rsa.pub"
}



# # backend machine
# module "frontend_machine" {
#   source = "./modules/ec2"

#   number_of_instances = 1
#   ami_id              = var.ami_id
#   instance_type       = var.instance_type
#   key_name            = "frontend-key-pair"
#   public_key_path     = "~/.ssh/id_rsa.pub"
# }
