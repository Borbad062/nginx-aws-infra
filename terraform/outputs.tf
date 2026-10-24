output "alb_url" {
  description = "Публичный URL сайта через балансировщик нагрузки."
  value       = "http://${aws_lb.main.dns_name}"
}

output "alb_dns_name" {
  description = "DNS-имя Application Load Balancer."
  value       = aws_lb.main.dns_name
}

output "bastion_public_ip" {
  description = "Публичный IP бастиона, используемого как SSH jump-хост."
  value       = aws_instance.bastion.public_ip
}

output "web_private_ips" {
  description = "Приватные IP обоих веб-серверов — для inventory Ansible."
  value       = aws_instance.web[*].private_ip
}

output "web_instance_ids" {
  description = "ID обоих веб-инстансов."
  value       = aws_instance.web[*].id
}

output "route53_url" {
  description = "URL через Route 53, когда enable_route53_record=true."
  value       = var.enable_route53_record ? "http://${aws_route53_record.web[0].fqdn}" : null
}