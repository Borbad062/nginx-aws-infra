variable "aws_region" {
  description = "Регион AWS. ALB использует две зоны доступности."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Префикс для имён ресурсов и тегов."
  type        = string
  default     = "nginx-aws-infra"
}

variable "vpc_cidr" {
  description = "CIDR-блок VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Две публичные подсети в разных зонах доступности."
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "Укажите ровно два CIDR публичных подсетей для ALB."
  }
}

variable "admin_cidr" {
  description = "Ваш текущий публичный IPv4 в CIDR-нотации, например 203.0.113.10/32. Ограничивает SSH к бастиону."
  type        = string
}

variable "key_name" {
  description = "Имя существующей пары ключей EC2 в выбранном регионе AWS."
  type        = string
}

variable "instance_type" {
  description = "Тип инстансов для обоих веб-серверов и бастиона."
  type        = string
  default     = "t3.micro"
}

variable "enable_route53_record" {
  description = "Установите true только при использовании существующей публичной hosted zone."
  type        = bool
  default     = false
}

variable "route53_zone_name" {
  description = "Существующая hosted zone, например zubaidov.com."
  type        = string
  default     = "zubaidov.com"
}

variable "route53_record_name" {
  description = "Метка записи в hosted zone, например nginx."
  type        = string
  default     = "nginx"
}