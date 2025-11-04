resource "aws_ecs_service" "wiki" {
  name            = "wiki"
  task_definition = aws_ecs_task_definition.wiki.arn
  cluster         = var.cluster_name

  load_balancer {
    target_group_arn = aws_lb_target_group.wiki.arn
    container_name   = "wiki"
    container_port   = "3000"
  }

  launch_type                        = "EC2"
  desired_count                      = 1
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  force_new_deployment               = true
}