variable "aws_region" {
   # AWS Region
   aws_region = "us-west-1"
}


variable "eb_environment_name" {
   # Elastic Beanstalk Environment Name
   eb_environment_name = "2048-project-daria-shani"
}


variable "eb_solution_stack" {
  # Elastic Beanstalk Solution Stack Name
    eb_solution_stack = "docker"
}


variable "s3_bucket_name" {
  # S3 Bucket Name for Application Deployment
    s3_bucket_name = "project-daria-shani"
}












