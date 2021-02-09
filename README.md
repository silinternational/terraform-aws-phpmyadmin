# terraform-aws-pma
This module is used to create an ECS service running phpmyadmin.

## What this does

 - Create target group for ALB to route based on hostname
 - Create task definition and ECS service for phpmyadmin
 - Create Cloudflare DNS record
