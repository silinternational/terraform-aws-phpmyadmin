/*
 * Application settings
 */
variable "app_name" {
  type        = string
  default     = "phpmyadmin"
  description = "app name, used in load balancer target group name and ecs service name"
}

variable "app_env" {
  type        = string
  description = "app environment (e.g. prod, stg), used in load balancer target group name and ecs task definition family name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the load balancer target group"
}

variable "alb_https_listener_arn" {
  type        = string
  description = "load balancer listener ARN for the new listener rule"
}

variable "alb_listener_priority" {
  default     = "30"
  description = "load balancer listener priority"
}

variable "subdomain" {
  type        = string
  description = "subdomain for the DNS record and listener, typically \"${var.app_name}-pma\""
}

variable "cloudflare_domain" {
  type        = string
  description = "domain name registered with Cloudflare. phpMyAdmin hostname will be \"${var.subdomain}.${var.cloudflare_domain}\""
}

variable "rds_address" {
  type        = string
  description = "address of the RDS server"
}

variable "ecs_cluster_id" {
  type        = string
  description = "cluster ID for the ECS service"
}

variable "ecsServiceRole_arn" {
  type        = string
  description = "ARN of the IAM role for the ECS service"
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the application load balancer, to be assigned to the DNS record"
}

variable "cpu" {
  default     = "32"
  description = "The hard limit of CPU units to present for the task. It can be expressed as an integer using CPU units, for example 1024, or as a string using vCPUs, for example 1 vCPU or 1 vcpu"
}

variable "memory" {
  default     = "128"
  description = "The hard limit of memory (in MiB) to present to the task. It can be expressed as an integer using MiB, for example 1024, or as a string using GB, for example 1GB or 1 GB"
}

variable "enable" {
  type        = bool
  default     = true
  description = "Set to 'false' to destroy the DNS record and set the ECS service 'desired_count' to 0"
}
