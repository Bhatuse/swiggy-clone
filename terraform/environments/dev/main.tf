module "networking" {
  source               = "../../modules/networking"
  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "security_groups" {
  source = "../../modules/security_groups"
  vpc_id = module.networking.vpc_id
}

module "iam" {
  source = "../../modules/iam"
}

module "alb" {
  source            = "../../modules/alb"
  vpc_id            = module.networking.vpc_id
  alb_sg_id         = module.security_groups.alb_sg_id
  public_subnet_ids = module.networking.public_subnet_ids
}

module "ecs" {
  source                 = "../../modules/ecs"
  private_subnet_ids     = module.networking.private_subnet_ids
  ecs_sg_id              = module.security_groups.ecs_sg_id
  blue_target_group_arn  = module.alb.blue_target_group_arn
  ecs_execution_role_arn = module.iam.ecs_execution_role_arn
  image_uri              = var.container_image_uri
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.s3_bucket_name
  environment = var.environment
}

module "sonarqube" {
  source           = "../../modules/sonarqube"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  public_subnet_id = module.networking.public_subnet_ids[0]
  sonar_sg_id      = module.security_groups.sonar_sg_id
  key_name         = var.key_name
}
