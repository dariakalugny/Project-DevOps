terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.16"
    }
  }

  required_version = ">= 1.0.0"
}



provider "aws" {
  region = "us-west-1"
}


resource "aws_elastic_beanstalk_application" "my_app" {
  name = "2048"
}

resource "aws_elastic_beanstalk_environment" "my_env" {
  name                = "2048-game-terraform"
  application         = aws_elastic_beanstalk_application.my_app.name
  solution_stack_name = "64bit Amazon Linux 2 v4.5.2 running Python 3.8"
  // Add other environment settings as needed
}

resource "aws_elastic_beanstalk_source_bundle" "my_app_source" {
  application_name = aws_elastic_beanstalk_application.my_app.name
  source_bundle {
    s3_bucket = "project-daria-shani"
    s3_key    = "s3://project-daria-shani/2048/Dockerfile"
  }
}