resource "aws_lambda_function" "default_file_dl" {
  count                          = "${var.package == "File" && var.attach_dl ? 1 : 0}"
  function_name                  = "${var.function_name}"
  filename                       = "${var.filename}"
  role                           = "${var.role}"
  handler                        = "${var.lambda_handler}"
  timeout                        = "${var.timeout}"
  runtime                        = "${var.runtime}"
  memory_size                    = "${var.memory_size}"
  reserved_concurrent_executions = "${var.reserved_concurrent_executions}"

  dead_letter_config {
    target_arn = "${var.dead_letter_queue_arn}"
  }

  #When you wnat to place your lambda inside the VPC
  vpc_config {
    subnet_ids         = "${var.subnet_ids}"
    security_group_ids = "${var.security_group_ids}"
  }

  environment {
    variables = "${var.env_variables}"
  }

  tags = "${var.tags}"
}

resource "aws_lambda_function" "default_s3_dl" {
  count = "${var.package == "S3"  && var.attach_dl ? 1 : 0}"

  #S3 packages
  function_name = "${var.function_name}"
  s3_bucket     = "${var.s3_bucket}"
  s3_key        = "${var.s3_key}"

  role                           = "${var.role}"
  handler                        = "${var.lambda_handler}"
  timeout                        = "${var.timeout}"
  runtime                        = "${var.runtime}"
  memory_size                    = "${var.memory_size}"
  reserved_concurrent_executions = "${var.reserved_concurrent_executions}"

  dead_letter_config {
    target_arn = "${var.dead_letter_queue_arn}"
  }

  #When you wnat to place your lambda inside the VPC
  vpc_config {
    subnet_ids         = "${var.subnet_ids}"
    security_group_ids = "${var.security_group_ids}"
  }

  environment {
    variables = "${var.env_variables}"
  }

  tags = "${var.tags}"
}

resource "aws_lambda_function" "default_s3" {
  count = "${var.package == "S3" && ! var.attach_dl ? 1 : 0}"

  #S3 packages
  function_name = "${var.function_name}"
  s3_bucket     = "${var.s3_bucket}"
  s3_key        = "${var.s3_key}"

  role                           = "${var.role}"
  handler                        = "${var.lambda_handler}"
  timeout                        = "${var.timeout}"
  runtime                        = "${var.runtime}"
  memory_size                    = "${var.memory_size}"
  reserved_concurrent_executions = "${var.reserved_concurrent_executions}"

  #When you wnat to place your lambda inside the VPC
  vpc_config {
    subnet_ids         = "${var.subnet_ids}"
    security_group_ids = "${var.security_group_ids}"
  }

  environment {
    variables = "${var.env_variables}"
  }

  tags = "${var.tags}"
}

resource "aws_lambda_function" "default_file" {
  count                          = "${var.package == "File" && ! var.attach_dl ? 1 : 0}"
  function_name                  = "${var.function_name}"
  filename                       = "${var.filename}"
  role                           = "${var.role}"
  handler                        = "${var.lambda_handler}"
  timeout                        = "${var.timeout}"
  runtime                        = "${var.runtime}"
  memory_size                    = "${var.memory_size}"
  reserved_concurrent_executions = "${var.reserved_concurrent_executions}"

  #When you wnat to place your lambda inside the VPC
  vpc_config {
    subnet_ids         = "${var.subnet_ids}"
    security_group_ids = "${var.security_group_ids}"
  }

  environment {
    variables = "${var.env_variables}"
  }
  
  tags = "${var.tags}"
}
