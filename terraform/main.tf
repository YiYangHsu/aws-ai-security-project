provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_role" "lambda_role" {
    name = "ai-security-lambda-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"

                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            }
        ]
    }
    )

}
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
    role =   aws_iam_role.lambda_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "ai_lambda" {

    function_name = "ai-security-demo"
    
    runtime = "nodejs24.x"
    handler = "index.handler"

    role = aws_iam_role.lambda_role.arn

    filename = "../lambda.zip"
    source_code_hash = filebase64sha256("../lambda.zip")

    timeout = 10

}

resource "aws_apigatewayv2_api" "lambda_api" {
    name = "secure-ai-api"
    protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
    api_id = aws_apigatewayv2_api.lambda_api.id
    integration_uri = aws_lambda_function.ai_lambda.invoke_arn
    integration_type = "AWS_PROXY"
    integration_method = "POST"
}

resource "aws_apigatewayv2_route" "hello_route" {
    api_id = aws_apigatewayv2_api.lambda_api.id

    route_key = "GET /hello"

    target = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_apigatewayv2_stage" "prod" {
    api_id = aws_apigatewayv2_api.lambda_api.id

    name = "prod"
    auto_deploy = true
}

resource "aws_lambda_permission" "api_gw" {
    statement_id =  "AllowAPIGatewayInvoke"
    action        = "lambda:InvokeFunction"
    function_name = aws_lambda_function.ai_lambda.function_name
    principal     = "apigateway.amazonaws.com"

    source_arn = "${aws_apigatewayv2_api.lambda_api.execution_arn}/*/*"
}

resource "aws_secretsmanager_secret" "ai_api_key" {
    name = "secure-ai-api-key"

    description = "AI API key for AWS secure AI API project"

    recovery_window_in_days = 0
}

resource "aws_iam_policy" "secrets_manager_policy" {
  name = "lambda-secrets-policy"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "secretsmanager:GetSecretValue"
        ]

        Resource = aws_secretsmanager_secret.ai_api_key.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "secrets_attach" {

  role =   aws_iam_role.lambda_role.name

  policy_arn = aws_iam_policy.secrets_manager_policy.arn
}