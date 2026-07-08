# Secret in Secrets Manager for CLIENT_ID
resource "aws_secretsmanager_secret" "client_id" {
  name                    = "${var.project_name}-${var.environment}-client-id"
  recovery_window_in_days = 0

  tags = {
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "client_id" {
  secret_id     = aws_secretsmanager_secret.client_id.id
  secret_string = var.client_id_secret
}

# Allow ECS task execution role to read this secret
resource "aws_iam_role_policy" "ecs_secrets" {
  name = "${var.project_name}-ecs-secrets-policy"
  role = aws_iam_role.ecs_task_execution.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["secretsmanager:GetSecretValue"]
        Resource = aws_secretsmanager_secret.client_id.arn
      }
    ]
  })
}
