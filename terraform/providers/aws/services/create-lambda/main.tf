provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "my-tf-states"
    key     = "LAMBDA/__APP_NAME__.tfstate"
    encrypt = true
  }
}

module "aws_lambda" {
  source                         = "../../../../modules/lambda"
  function_name                  = "${var.function_name}"
  filename                       = "${var.filename}"
  role                           = "${var.role_arn}"
  lambda_handler                 = "${var.lambda_handler}"
  timeout                        = "${var.timeout}"
  runtime                        = "${var.runtime}"
  memory_size                    = "${var.memory_size}"
  reserved_concurrent_executions = "${var.reserved_concurrent_executions}"
  package                        = "${var.package_type}"
  env_variables                  = "${var.env_variables}"
  subnet_ids                     = "${var.subnet_ids}"
  security_group_ids             = "${var.security_group_ids}"
  attach_dl                      = "${var.attach_dl}"
  dead_letter_queue_arn          = "${var.dead_letter_queue_arn}"
  s3_bucket                      = "${var.s3_bucket}"
  s3_key                         = "${var.s3_key}"
  
  tags = {
    Name        = "${var.function_name}",
    application = "${var.application}"
    package     = "${var.package}"
    environment = "${var.environment}"
  }  
} 