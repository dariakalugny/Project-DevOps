terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.16"
    }
  }

  required_version = ">= 1.0.0"
}

resource "aws_elastic_beanstalk_application" "my_app" {
  name = "2048-application-terraform"
}

resource "aws_elastic_beanstalk_environment" "my_env" {
  name                = "project-2048"
  application         = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = "64bit Amazon Linux 2 v4.5.2 running Python 3.8"

  setting {
    namespace = "arn:aws:s3:::project-daria-shani/2048/Dockerfile"
    name      = "project-daria-shani"  # Environment variable used by Elastic Beanstalk
    value     = "2048/Dockerfile"  # Reference to the S3 bucket
  }

  // Add other environment settings and resources as needed
}