# ✅ No template provider needed
locals {
  wiki_container_defs = templatefile("${path.module}/wiki.json.tpl", {
    awslogs_group     = module.label.id
    region            = var.region
    db_type           = "postgres"
    wiki_db_host      = var.wiki_db_host
    wiki_db_name      = var.wiki_db_name
    wiki_db_password  = var.wiki_db_password
    wiki_db_user      = var.wiki_db_user
    wiki_db_ssl_ca    = var.wiki_db_ssl_ca
  })
}

resource "aws_ecs_task_definition" "wiki" {
  family                   = module.label.id
  container_definitions    = local.wiki_container_defs
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.execution_role.arn
  task_role_arn            = aws_iam_role.task_role.arn
}
