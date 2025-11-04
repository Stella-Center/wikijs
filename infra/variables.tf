variable "name" {
  type    = string
  default = "wiki"
}

variable "environment" {
  type        = string
  description = "Environment of the namespace"
  default = "dev"
}


variable "namespace" {
  type        = string
  default     = "portal"
  description = "Name of the namespace to create label names and tags"
}

variable "region" {
  type        = string
  description = "Which region to host mainly"
  default = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster to launch the wiki service"
  default = "stella-dev"
}

variable "lb_arn" {
  type        = string
  description = "ARN of the load balancer to attach to"
  default = "arn:aws:elasticloadbalancing:us-east-1:233718569638:loadbalancer/app/stella-prod/2a3d5b565fbe34ea"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where to create the service"
  default = "vpc-070cd92c0ffb0aac6"
}

variable "https_listener_arn" {
  type        = string
  description = "HTTPS listener ARN of the load balancer"
  default = "arn:aws:elasticloadbalancing:us-east-1:233718569638:listener/app/stella-prod/2a3d5b565fbe34ea/6b23b144f05117d0"
}

variable "url" {
  type        = string
  description = "URL of the wiki service"
  default = "wiki.stellabrainhealth.com"
}

variable "wiki_db_host" {
  type        = string
  description = "Host of postgres database for wiki"
  default = "stella-dev.ctxde4jqkfqo.us-east-1.rds.amazonaws.com"
}

variable "wiki_db_user" {
  type        = string
  description = "User of postgres database for wiki"
  default = "wikijs"
}

variable "wiki_db_password" {
  type        = string
  description = "Password of postgres database for wiki"
  default = "wikijs"
}

variable "wiki_db_name" {
  type        = string
  description = "Name of postgres database for wiki"
  default = "wiki"
}

variable "wiki_db_ssl_ca" {
  type        = string
  description = "SSL CA for RDS Postgres connections"
  default = "MIID/zCCAuegAwIBAgIRAPVSMfFitmM5PhmbaOFoGfUwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNVBAYTAlVTMSIwIAYDVQQKDBlBbWF6b24gV2ViIFNlcnZpY2VzLCBJbmMuMRMwEQYDVQQLDApBbWF6b24gUkRTMQswCQYDVQQIDAJXQTEwMC4GA1UEAwwnQW1hem9uIFJEUyB1cy1lYXN0LTEgUm9vdCBDQSBSU0EyMDQ4IEcxMRAwDgYDVQQHDAdTZWF0dGxlMCAXDTIxMDUyNTIyMzQ1N1oYDzIwNjEwNTI1MjMzNDU3WjCBlzELMAkGA1UEBhMCVVMxIjAgBgNVBAoMGUFtYXpvbiBXZWIgU2VydmljZXMsIEluYy4xEzARBgNVBAsMCkFtYXpvbiBSRFMxCzAJBgNVBAgMAldBMTAwLgYDVQQDDCdBbWF6b24gUkRTIHVzLWVhc3QtMSBSb290IENBIFJTQTIwNDggRzExEDAOBgNVBAcMB1NlYXR0bGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDu9H7TBeGoDzMrdxN6H8COntJX4IR6dbyhnj5qMD4xl/IWvp50lt0VpmMd+z2PNZzx8RazeGC5IniV5nrLg0AKWRQ2A/lGGXbUrGXCSe09brMQCxWBSIYe1WZZ1iU1IJ/6Bp4D2YEHpXrWbPkOq5x3YPcsoitgm1Xh8ygz6vb7PsvJvPbvRMnkDg5IqEThapPjmKb8ZJWyEFEEQRrkCIRueB1EqQtJw0fvP4PKDlCJAKBEs/y049FoOqYpT3pRy0WKqPhWve+hScMd6obq8kxTFy1IHACjHc51nrGII5Bt76/MpTWhnJIJrCnq1/Uc3Qs8IVeb+sLaFC8KDI69Sw6bAgMBAAGjQjBAMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFE7PCoptlyOgtXX0Y1lObBUxuKaCMA4GA1UdDwEB/wQEAwIBhjANBgkqhkiG9w0BAQsFAAOCAQEAFj+bX8gLmMNefr5jRJfHjrL3iuZCjf7YEZgn89pS4z8408mjj9z6Q5D1H7ySjNETVV8QaJip1qyhh5gRzRaArgGAYvi2/r0zPsy+Tgf7v1KGL5Lh8NT8iCEGGXwFg3Ir+Nl3e+9XUp0eyyzBIjHtjLBm6yy8rGk9p6OtFDQnKF5OxwbAgip42CD75r/qp421maEDDvvRFR4D+99JZxgAYDBGqRRceUoe16qDzbMvlz0A9paCZFclxeftAxv6QlR5rItMz/XdzpBJUpYhdzM0gCzAzdQuVO5tjJxmXhkSMcDP+8Q+Uv6FA9k2VpUVE/O5jgpqUJJ2Hc/5rs9VkAPXeA=="
}