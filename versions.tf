
terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0.0, < 6.0.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"

      // 4.39.0 and later versions deprecated cloudflare_record.value
      // constraining to earlier versions while waiting for version 5 to mature
      version = ">= 2.0.0, < 4.39.0"
    }
  }
}
