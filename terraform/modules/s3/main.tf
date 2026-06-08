resource "aws_s3_bucket" "alb_logs" {
  bucket = "swiggy-alb-logs"

  tags = {
    Name        = "alb-logs"
    Environment = "Dev"
  }
}