resource "aws_instance" "sonarqube" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.public_subnet_id

  vpc_security_group_ids = [
    var.sonar_sg_id
  ]

  key_name = var.key_name

  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash

apt update -y

apt install docker.io -y

systemctl enable docker
systemctl start docker

docker run -d \
  --name sonarqube \
  -p 9000:9000 \
  sonarqube:lts-community
EOF

  tags = {
    Name = "sonarqube-server"
  }
}