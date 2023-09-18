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

resource "aws_s3_bucket" "default" {
  bucket = "tftest.applicationversion.bucket"
}

resource "aws_s3_object" "default" {
  bucket = aws_s3_bucket.default.id
  key    = "2048/Dockerfile"
  source = "Dockerfile"
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = "2048-game-terraform"
  description = "2048-game-terraform-daria-shani"
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "tf-test-version-label"
  application = "tf-test-name"
  description = "application version created by terraform"
  bucket      = aws_s3_bucket.default.id
  key         = master.zip
}