output "alb_id" {
  description = "Application Load Balancer ID"
  value       = aws_lb.swiggy_alb.id
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.swiggy_alb.arn
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = aws_lb.swiggy_alb.dns_name
}

output "alb_zone_id" {
  description = "Application Load Balancer Hosted Zone ID"
  value       = aws_lb.swiggy_alb.zone_id
}