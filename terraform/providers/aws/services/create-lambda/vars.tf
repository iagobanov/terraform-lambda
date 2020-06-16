variable "aws_region" {
  default = "sa-east-1"
}

variable "function_name" {
  description = "The name of your Lambda Function"
}

variable "filename" {
  default     = "lambda_function.zip"
  description = "The name of the deployment package of your lambda. If you choose S3 you must provide the filename in 's3_key' variable "
}

variable "role_arn" {
  default     = "arn:aws:iam::265455541035:role/lambda-role"
  description = "ARN of the IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function"
}

variable "lambda_handler" {
  default     = "lambda_function.lambda_handler"
  description = "The function entrypoint in your code. [filename.functionname]"
}

variable "timeout" {
  description = "The amout of time in seconds that lambda has to run"
}

variable "runtime" {
  description = "The language of your Lamba Function [dotnetcore1.0 dotnetcore2.0 dotnetcore2.1 go1.x java8 nodejs4.3 nodejs4.3-edge nodejs6.10 nodejs8.10 nodejs10.x provided python2.7 python3.6 python3.7 ruby2.5]"
}

variable "s3_bucket" {
  description = "Used when you upload the deployment package to s3"
}

variable "s3_key" {
  description = "When you want to use s3 as the source of you deployment packages"
}

variable "subnet_ids" {
  default     = []
  description = "The ID of the subnets you want to place your lambda in"
}

variable "security_group_ids" {
  default     = []
  description = "If inside a VPC, you'll have to choose Security group(s) to your lambda"
}

variable "env_variables" {
  type        = "map"
  default     = {}
  description = "The key value variables to use in your lambda"
}

variable "package_type" {
  default     = "S3"
  description = "Kind of updload you want to do. Supports 'File' OR 'S3'"
}

variable "memory_size" {
  default     = 128
  description = "Your function is allocated CPU proportional to the memory configured"
}

variable "attach_dl" {
  default     = false
  description = "Variable to attach to DL queue or not"
}

variable "dead_letter_queue_arn" {
  description = "If attach_dl is true you will need the ARN of you Queue OR SNS"
}

variable "reserved_concurrent_executions" {
  description = "If you want to set the maximum of concurrency executions to Lambda"
}

variable "application" {}

variable "package" {}

variable "environment" {}