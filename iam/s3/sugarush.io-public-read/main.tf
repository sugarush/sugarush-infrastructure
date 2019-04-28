provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" { }
}

data "aws_s3_bucket" "this" {
  bucket = "${var.identifier}-${var.environment}-sugarush.io"
}

resource "aws_s3_bucket_policy" "this" {
  bucket = "${data.aws_s3_bucket.this.bucket}"
  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
	   "Sid":"PublicReadGetObject",
      "Effect":"Allow",
	    "Principal": "*",
      "Action":[
        "s3:GetObject"
      ],
      "Resource":[
        "${data.aws_s3_bucket.this.arn}",
        "${data.aws_s3_bucket.this.arn}/*"
      ]
    }
  ]
}
POLICY
}
