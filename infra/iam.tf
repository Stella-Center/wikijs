# Optional: leave this if you truly need an IAM user (usually not needed for ECS)
resource "aws_iam_user" "app" {
  name = "${module.label.id}-wiki2"
}

# ---------- ECS TASK ROLES (used by the task definition) ----------

data "aws_iam_policy_document" "assume_by_ecs" {
  statement {
    sid     = "AllowAssumeByEcsTasks"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# Execution role: pulls from ECR, writes logs, etc.
resource "aws_iam_role" "execution_role" {
  name               = "${module.label.id}_ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_by_ecs.json
}

# Attach the standard managed policy (covers ECR + CloudWatch Logs)
resource "aws_iam_role_policy_attachment" "execution_managed" {
  role       = aws_iam_role.execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Task role: permissions your app needs at runtime (S3, SSM, etc.)
resource "aws_iam_role" "task_role" {
  name               = "${module.label.id}_ecsTaskRole"
  assume_role_policy = data.aws_iam_policy_document.assume_by_ecs.json
}


data "aws_iam_policy_document" "ecs_instance_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_instance_role" {
  name               = "${module.label.id}-ecs-instance-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ecs_instance_assume.json
}

# Standard policy for ECS container instances
resource "aws_iam_role_policy_attachment" "ecs_instance_managed" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "${module.label.id}-ecs-instance-profile"
  path = "/"
  role = aws_iam_role.ecs_instance_role.name
}
