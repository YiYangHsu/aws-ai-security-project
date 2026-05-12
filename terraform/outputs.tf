output "api_url" {
  value = aws_apigatewayv2_stage.prod.invoke_url
}

output "cloudfront_url" {

  value = aws_cloudfront_distribution.api_distribution.domain_name
}