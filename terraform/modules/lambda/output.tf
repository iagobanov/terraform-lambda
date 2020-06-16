output "arn_file" {
  value = "${element(concat(aws_lambda_function.default_file.*.arn, list("")), 0)}"
}

output "arn_s3" {
  value = "${element(concat(aws_lambda_function.default_s3.*.arn, list("")), 0)}"
}
