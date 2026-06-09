variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.medium"
}

variable "public_subnet_id" {
  description = "Public Subnet ID"
  type        = string
}

variable "sonar_sg_id" {
  description = "Sonar Security Group ID"
  type        = string
}

variable "key_name" {
  description = "SSH Key Pair"
  type        = string
}