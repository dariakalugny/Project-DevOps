
provider "aws" {
  region = var.aws_region
}

resource "aws_elastic_beanstalk_application" "my_app" {
  name        = var.eb_application_name
  description = "My Elastic Beanstalk Application"
}

resource "aws_elastic_beanstalk_environment" "my_env" {
  name                = var.eb_environment_name
  application         = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = var.eb_solution_stack
  # Add other environment settings as needed
}

resource "aws_s3_bucket" "my_app_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

# Deploy the application to Elastic Beanstalk environment
resource "aws_elastic_beanstalk_application_version" "app_version" {
  name        = "my-app-version"
  description = "My Application Version"
  application = aws_elastic_beanstalk_application.my_app.name

  s3_bucket = aws_s3_bucket.my_app_bucket.id
  s3_key    = "path/to/your/application.zip"
}