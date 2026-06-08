variable "alb_sg_id" {
  description = "ALB Security Group ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}