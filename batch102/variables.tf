
variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro" # Default instance
}
variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default = "ami-02457590d33d576c3" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}