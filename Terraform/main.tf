
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.16"
    }
  }

  required_version = ">= 1.0.0"
}

resource "aws_elastic_beanstalk_application" "test-2048" {
  name        = "test-2048"
  description = "test-2048-daria-shani"

}
# Create a S3 bucket to hosts the Dockerfile
resource "aws_s3_bucket" "test-2048" {
  bucket = "https://project-daria-shani.s3.us-west-1.amazonaws.com/2048/Dockerfile"
}


resource "aws_s3_object" "test-2048" {
  bucket = "project-daria-shani"
  key    = "2048/Dockerfile"
  source = "2048"
}


resource "aws_elastic_beanstalk_application_version" "test-2048" {
  name        = "2048-version"
  application = "test-2048"
  description = "application version"
  bucket      = "project-daria-shani"
  key         = "2048/Dockerfile"
}







resource "aws_elastic_beanstalk_environment" "Application2048-daria-shani" {
  name                = "test-2048"
  application         = aws_elastic_beanstalk_application.test-2048.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.0.1 running Docker"
  version_label       = aws_elastic_beanstalk_application.test-2048.name



  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-0d37ae25adc984356"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-0eb0c47b5d27e872e"
  }

   setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-05deba43835a0d6c9"
  }

    setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     =  "ElasticBeanstalkApp"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     =  "True"
  }


   setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t3.micro"
  }
   setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = 1
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 2
  }
   setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }






}