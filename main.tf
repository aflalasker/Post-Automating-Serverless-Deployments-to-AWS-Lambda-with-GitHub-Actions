# S3 Bucket to store the lambda functions code
resource "aws_s3_bucket" "lambda_code_bucket" {
  bucket = "<NAME_FOR_S3_BUCKET>"
}

# An S3 object holding the zipped code package
resource "aws_s3_object" "lambda_code" {
  bucket      = aws_s3_bucket.lambda_code_bucket.id
  key         = "<NAME_FOR_CODE_PACKAGE>"
  source      = var.code_zip_path
  source_hash = filebase64sha256(var.code_zip_path)
}

# A basic Lambda function resource
resource "aws_lambda_function" "lambda" {
  function_name = "<FUNCTION_NAME>"
  s3_bucket     = aws_s3_bucket.lambda_code_bucket.id
  s3_key        = aws_s3_object.lambda_code.key
  role          = aws_iam_role.lambda_role.arn
  handler       = "basic.main.handler"
  runtime       = "python3.10"
  timeout       = 30
  memory_size   = 128
  package_type  = "Zip"

  # Ensures that the Lambda function is created after the log group is created
  depends_on    = [aws_cloudwatch_log_group.log_group]

  # Ensures that the lambda function is updated when the S3 object hash changes
  lifecycle {
    replace_triggered_by = [aws_s3_object.lambda_code.source_hash]
  }
}

# CloudWatch log group for the Lambda function
resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/lambda/<FUNCTION_NAME>"
  retention_in_days = 30
}
