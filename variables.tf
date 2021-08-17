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
  description = "subdomain for the DNS record and listener, typically app_name + \"pma\""
}

variable "cloudflare_domain" {
  type        = string
  description = "domain name registered with Cloudflare"
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

variable "max_execution_time" {
  default     = "600"
  description = "If set, will override the maximum execution time in seconds (default 600) for phpMyAdmin ($cfg['ExecTimeLimit']) and PHP max_execution_time (format as [0-9+])"
}

variable "memory_limit" {
  default     = "512M"
  description = "If set, will override the memory limit (default 512M) for phpMyAdmin ($cfg['MemoryLimit']) and PHP memory_limit (format as [0-9+](K,M,G))"
}

variable "upload_limit" {
  default     = "2048K"
  description = "If set, this option will override the default value for apache and php-fpm (format as [0-9+](K,M,G) default value is 2048K, this will change upload_max_filesize and post_max_size values)"
}