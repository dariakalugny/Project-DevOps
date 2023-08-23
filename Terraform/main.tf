provider "aws" {
  region = var.region
}

module "elastic_beanstalk_application" {
  source    = "git::https://github.com/cloudposse/terraform-aws-elastic-beanstalk-application.git?ref=master"
  namespace = "${var.namespace}"
  stage     = "${var.environment}"
  name      = "${var.app}"
}
module "elastic_beanstalk_environment" {
  source                       = "git::https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment.git?ref=master"
}
resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "${var.namespace}-${var.environment}-${uuid()}"
  application = "${module.elastic_beanstalk_application.app_name}"
  description = "application version created by terraform"
  bucket      = "${aws_s3_bucket.dist_bucket.id}"
  key         = "${aws_s3_bucket_object.dist_item.id}"
}