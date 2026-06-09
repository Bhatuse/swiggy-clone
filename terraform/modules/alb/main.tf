resource "aws_lb" "swiggy_alb" {
  name               = "swiggy-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [var.alb_sg_id]
  subnets         = var.public_subnet_ids

  tags = {
    Name = "swiggy-alb"
  }
}

resource "aws_lb_target_group" "blue" {
  name        = "swiggy-blue"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path = "/"
  }
}

resource "aws_lb_target_group" "green" {
  name        = "swiggy-green"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path = "/"
  }
}


# - This is production listener

resource "aws_lb_listener" "prod" {
  load_balancer_arn = aws_lb.swiggy_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue.arn
  }
}


# - This is test listener

resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.swiggy_alb.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.green.arn
  }
}