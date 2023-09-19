# Create a S3 bucket to hosts the Dockerfile
resource "aws_s3_bucket" "game-2048" {
  bucket = "game-2048"
}

# Upload the Dockerfile to the S3 bucket
resource "aws_s3_object" "game-2048" {
  bucket = game-2048
  key    = game-2048
  source = Dockerfile
}