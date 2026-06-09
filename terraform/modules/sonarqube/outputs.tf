output "public_ip" {
  description = "SonarQube Public IP"
  value       = aws_instance.sonarqube.public_ip
}

output "instance_id" {
  description = "SonarQube Instance ID"
  value       = aws_instance.sonarqube.id
}