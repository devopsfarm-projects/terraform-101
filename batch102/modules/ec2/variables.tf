variable "ami_id" {
    description = "AMI ID for the EC2 instances"
    type        = string  
}

variable "instance_type" {
    description = "Instance type for the EC2 instances"
    type        = string    
  
}

variable "key_name" {
  description = "value of the key pair name"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}
variable "number_of_instances" {
  description = "Number of instances to create"
  type        = number
}