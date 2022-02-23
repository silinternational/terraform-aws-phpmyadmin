/*
 * Create target group for ALB
 */
resource "aws_alb_target_group" "phpmyadmin" {
  name = replace(
    "tg-pma-${var.app_name}-${var.app_env}",
    "/(.{0,32})(.*)/",
    "$1",
  )
  port                 = "80"
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  deregistration_delay = "30"

  stickiness {
    type = "lb_cookie"
  }
}

/*
 * Create listener rule for hostname routing to new target group
 */
resource "aws_alb_listener_rule" "phpmyadmin" {
  listener_arn = var.alb_https_listener_arn
  priority     = var.alb_listener_priority

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.phpmyadmin.arn
  }

  condition {
    host_header {
      values = ["${var.subdomain}.${var.cloudflare_domain}"]
    }
  }
}

module "ecsservice" {
  source             = "github.com/silinternational/terraform-modules//aws/ecs/service-only?ref=3.3.2"
  cluster_id         = var.ecs_cluster_id
  service_name       = "pma-${var.app_name}"
  service_env        = var.app_env
  container_def_json = jsonencode(local.task_def)
  desired_count      = var.enable ? 1 : 0
  tg_arn             = aws_alb_target_group.phpmyadmin.arn
  lb_container_name  = "phpMyAdmin"
  lb_container_port  = "80"
  ecsServiceRole_arn = var.ecsServiceRole_arn
}

/*
 * Create Cloudflare DNS record
*/
resource "cloudflare_record" "pmadns" {
  count   = var.enable ? 1 : 0
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = var.subdomain
  value   = var.alb_dns_name
  type    = "CNAME"
  proxied = true
}

data "cloudflare_zones" "domain" {
  filter {
    name        = var.cloudflare_domain
    lookup_type = "exact"
    status      = "active"
  }
}

locals {
  task_def = [{
    cpu    = var.cpu
    memory = var.memory
    image  = "phpmyadmin/phpmyadmin:latest"
    name   = "phpMyAdmin"
    portMappings = [
      {
        containerPort = 80
      },
    ],
    environment = [
      {
        name  = "PMA_HOST"
        value = var.rds_address
      },
      {
        name  = "PMA_ABSOLUTE_URI"
        value = "https://${var.subdomain}.${var.cloudflare_domain}/"
      },
      {
        name  = "MAX_EXECUTION_TIME"
        value = var.max_execution_time
      },
      {
        name  = "MEMORY_LIMIT"
        value = var.memory_limit
      },
      {
        name  = "UPLOAD_LIMIT"
        value = var.upload_limit
      },
    ]
  }]
}
