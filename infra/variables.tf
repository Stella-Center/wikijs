variable "name" {
  type    = string
}

variable "environment" {
  type        = string
  description = "Environment of the namespace"
}


variable "namespace" {
  type        = string
  description = "Name of the namespace to create label names and tags"
}

variable "region" {
  type        = string
  description = "Which region to host mainly"
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster to launch the wiki service"
}

variable "lb_arn" {
  type        = string
  description = "ARN of the load balancer to attach to"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where to create the service"
}

variable "https_listener_arn" {
  type        = string
  description = "HTTPS listener ARN of the load balancer"
}

variable "url" {
  type        = string
  description = "URL of the wiki service"
}

variable "wiki_db_host" {
  type        = string
  description = "Host of postgres database for wiki"
}

variable "wiki_db_user" {
  type        = string
  description = "User of postgres database for wiki"
}

variable "wiki_db_password" {
  type        = string
  description = "Password of postgres database for wiki"
}

variable "wiki_db_name" {
  type        = string
  description = "Name of postgres database for wiki"
}

variable "wiki_db_ssl_ca" {
  type        = string
  description = "SSL CA for RDS Postgres connections"
}