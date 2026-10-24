data "aws_route53_zone" "selected" {
  count        = var.enable_route53_record ? 1 : 0
  name         = "${trimsuffix(var.route53_zone_name, ".")}."
  private_zone = false
}

resource "aws_route53_record" "web" {
  count   = var.enable_route53_record ? 1 : 0
  zone_id = data.aws_route53_zone.selected[0].zone_id
  name    = var.route53_record_name
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}
