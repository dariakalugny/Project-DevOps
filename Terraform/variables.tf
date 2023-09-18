# Variable for aws_elastic_beanstalk_application
variable "eb_app_name" {
  description = "2048-application"
  default     = "NULL"
}

# Variables for aws_elastic_beanstalk_application_version
variable "eb_app_version_name" {
  description = "2048-application-1.0"
  default     = "NULL"
}
variable "application" {
  description = "Application argument value"
  default     = "NULL"
}

# Variables for aws_elastic_beanstalk_environment
variable "eb_env_name" {
  description = "project-daria-shani"
  default     = "NULL"
}
variable "platform" {
  description = "Defines the platform to be used to deploy the application"
  default     = "NULL"
}

# Variable for aws_S3_bucket
variable "bucket_prefix" {
  description = "project-daria-shani"
  default     = "NULL"
}

# Variables for aws_s3_object
variable "key_file" {
  description = "2048/Dockerfile"
  default     = "NULL"
}
variable "source_file" {
  description = "https://project-daria-shani.s3.us-west-1.amazonaws.com/2048/Dockerfile"
  default     = "NULL"
}

# Variable for aws_iam_role
variable "role_name" {
  description = "ElasticBeanstalkApp"
  default     = "NULL"
}

# Variable for aws_iam_role_policy_attachment
variable "policy" {
  description = "Attach policy to the IAM role"
  default     = "NULL"
}

# Variable for aws_iam_instance_profile
variable "profile_name" {
  description = "Name of the IAM instance profile"
  default     = "NULL"
}