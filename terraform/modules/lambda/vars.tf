variable "function_name" {
  description = "The name of your Lambda Function"
}

variable "filename" {
  default     = "Filename"
  description = "The name of the deployment package of your lambda"
}

variable "role" {
  description = "IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function"
}

variable "lambda_handler" {
  default     = "index.handler"
  description = "The function entrypoint in your code."
}

variable "timeout" {
  default     = 60
  description = "The amout of time that lambda has to run"
}

variable "runtime" {
  description = "The language of your Lamba Function"
}

variable "s3_bucket" {
  default     = "MyBucket"
  description = "When you upload the deployment package to s3"
}

variable "s3_key" {
  default     = "MyValue"
  description = "When you want to use s3 as the source of you deployment packages"
}

variable "subnet_ids" {
  default     = []
  description = "The ID of the subnets you want to place your lambda in"
}

variable "security_group_ids" {
  default     = []
  description = "The Security group of your lambda"
}

variable "env_variables" {
  type        = "map"
  default     = {}
  description = "The key value variables to use in your lambda"
}

variable "package" {
  description = "Kind of updload you want to do. Supports 'File' OR 'S3'"
}

variable "memory_size" {
  default = 128
}

variable "dead_letter_queue_arn" {
  default     = ""
  description = "If attach_dl is true you will need the ARN of you Quee"
}

variable "reserved_concurrent_executions" {
  default     = 0
  description = "If you want to set the maximum of concurrency executions to Lambda"
}

variable "attach_dl" {
  default     = false
  description = "Variable to attach to DL queue or not"
}

variable "tags" {
  type = "map"
}