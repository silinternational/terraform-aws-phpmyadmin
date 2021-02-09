output "phpmyadmin_url" {
  value = var.enable ? cloudflare_record.pmadns[0].hostname : ""
}

