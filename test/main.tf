module "simple" {
  source = "../"

  alb_dns_name           = "alb-app-prod-1234567890.us-east-1.elb.amazonaws.com"
  alb_https_listener_arn = "arn:aws:elasticloadbalancing:us-east-1:1234567890:listener/app/alb-app-prod/0123456789abcdef/0123456789abcdef"
  app_env                = "prod"
  cloudflare_domain      = "example.com"
  ecsServiceRole_arn     = "arn:aws:iam::1234567890:role/service-role"
  ecs_cluster_id         = "arn:aws:ecs:us-east-1:1234567890:cluster/app-prod"
  rds_address            = "app-prod.abcdefghijkl.us-east-1.rds.amazonaws.com"
  subdomain              = "pma"
  vpc_id                 = "vpc-012345678"
}

module "full" {
  source = "../"

  alb_dns_name           = "alb-app-prod-1234567890.us-east-1.elb.amazonaws.com"
  alb_https_listener_arn = "arn:aws:elasticloadbalancing:us-east-1:1234567890:listener/app/alb-app-prod/0123456789abcdef/0123456789abcdef"
  alb_listener_priority  = "100"
  app_env                = "prod"
  app_name               = "app"
  cloudflare_domain      = "example.com"
  cpu                    = "32"
  ecsServiceRole_arn     = "arn:aws:iam::1234567890:role/service-role"
  ecs_cluster_id         = "arn:aws:ecs:us-east-1:1234567890:cluster/app-prod"
  enable                 = false
  max_execution_time     = "300"
  memory                 = "32"
  memory_limit           = "512M"
  rds_address            = "app-prod.abcdefghijkl.us-east-1.rds.amazonaws.com"
  subdomain              = "pma"
  upload_limit           = "2048K"
  vpc_id                 = "vpc-012345678"
}
