variable "vpc_id" {
  type        = string
  description = "VPC ID where security groups will be created"
}

variable "alb_port" {
  type        = number
  description = "Port for ALB security group"
  default     = 80
}

variable "ecs_port" {
  type        = number
  description = "Port for ECS security group"
  default     = 80
}

variable "sonar_port" {
  type        = number
  description = "Port for SonarQube security group"
  default     = 9000
}

variable "sonar_allowed_ip" {
  type        = string
  description = "Allowed IP for SonarQube access"
  default     = ""
}
