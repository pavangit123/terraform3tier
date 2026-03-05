module "vpc" {
  source = "./modules/vpc"

  project_name           = var.project_name
  environment            = var.environment
  vpc_cidr               = "10.0.0.0/16" (edit as per requirement)
  public_subnet_1_cidr   = "10.0.1.0/24" (edit as per requirement)
  public_subnet_2_cidr   = "10.0.2.0/24" (edit as per requirement)
  private_subnet_1_cidr  = "10.0.3.0/24" (edit as per requirement)
  private_subnet_2_cidr  = "10.0.4.0/24" (edit as per requirement)
  az_1                   = "ap-south-1a" (edit as per requirement)
  az_2                   = "ap-south-1b" (edit as per requirement)
}

module "security_groups" {
  source       = "./modules/security-groups"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
}

module "ec2" {
  source            = "./modules/ec2"
  project_name      = var.project_name
  ami_id            = "ami-xxxxxxxx" (edit as per requirement)
  instance_type     = "t3.micro" (edit as per requirement)
  public_subnet_ids = module.vpc.public_subnet_ids
  security_group_id = module.security_groups.web_sg_id
}

module "alb" {
  source            = "./modules/alb"
  project_name      = var.project_name
  public_subnet_ids = module.vpc.public_subnet_ids
  security_group_id = module.security_groups.web_sg_id
}

module "rds" {
  source              = "./modules/rds"
  project_name        = var.project_name
  private_subnet_ids  = module.vpc.private_subnet_ids
  db_username         = "admin" (edit as per requirement)
  db_password         = "SecurePass@123" (edit as per requirement)
}
