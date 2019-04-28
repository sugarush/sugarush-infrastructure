provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.identifier}-${var.environment}-sugarush.io"
  acl = "public-read"
  region = "${var.region}"

  website {
    index_document = "index.html"
  }
}
