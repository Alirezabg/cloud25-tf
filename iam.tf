resource "aws_iam_policy" "ssm_and_secrets" {
  name = "EC2SSMAndSecrets"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue"
        ],
        Effect   = "Allow",
        Resource = aws_secretsmanager_secret.ec2_app_secret.arn
      },
      {
        Action = [
          "ssm:DescribeInstanceInformation",
          "ssm:GetCommandInvocation"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}
resource "aws_iam_policy" "ec2_secret_access" {
  name = "EC2SecretAccess"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "secretsmanager:GetSecretValue",
        Resource = aws_secretsmanager_secret.ec2_app_secret.arn
      }
    ]
  })
}
