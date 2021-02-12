# terraform-aws-pma
This module is used to create an ECS service running phpmyadmin.

## What this does

 - Create target group for ALB to route based on hostname
 - Create task definition and ECS service for phpmyadmin
 - Create Cloudflare DNS record

## Provider dependencies

### aws

[providers/hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws)

example configuration:

```hcl
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}
```

### cloudflare

[providers/cloudflare/cloudflare](https://registry.terraform.io/providers/cloudflare/cloudflare)

example configuration using email and global API key:

```hcl

provider "cloudflare" {
  version    = "~> 2.0"
  email      = var.cloudflare_email
  api_key    = var.cloudflare_api_key
  account_id = var.cloudflare_account_id
}
```

example configuration using an API token:

```hcl

provider "cloudflare" {
  version    = "~> 2.0"
  api_token  = var.cloudflare_token
  account_id = var.cloudflare_account_id
}
```

### template

[providers/hashicorp/template](https://registry.terraform.io/providers/hashicorp/template)

example configuration:

```hcl
provider "template" {
  version = "~> 2.1"
}
```

## Example

A working [example](https://github.com/silinternational/terraform-aws-phpmyadmin/tree/main/example) usage of this module is included in the source repository.

## More info

More information is available at the [Terraform Registry](https://registry.terraform.io/modules/silinternational/phpmyadmin/aws/latest)
