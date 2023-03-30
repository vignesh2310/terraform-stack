terraform {
  backend "s3" {
    bucket = "tf-multi-resource"
    key    = "terraform/backend_multi"
    region = "us-east-2"
  }
}