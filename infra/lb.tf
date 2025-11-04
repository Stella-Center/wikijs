data "aws_lb" "this" {
  arn = var.lb_arn
}

resource "aws_lb_target_group" "wiki" {
  name = module.label.id

  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    protocol            = "HTTP"
    path                = "/healthz"
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
    timeout             = "5"
    interval            = "30"
    matcher             = "200"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener_rule" "app" {
  listener_arn = var.https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wiki.arn
  }

  condition {
    host_header {
      values = [var.url]
    }
  }

  depends_on = [
    aws_lb_target_group.wiki
  ]
}