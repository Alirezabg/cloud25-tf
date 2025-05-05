provider "aws"{
    region = var.region
}

resource "aws_s3_bucket" "this"{
    bucker = var.bucket_name
    acl = "public-read"
    website {
        index_document = "index.html"
        error_document = "index.html"

    }
    tag = {
        Name = var.bucket_name
    }
}

resource "aws_s3_bucket_public_access_block" "this"{
    bucket = aws_s3_bucket.this.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

data "aws_iam_policy_document" "public_read" {
    statement {
        sid = "PublicReadGetObject"
        effect ="Allow"
        principals {
            type = "AWS"
            indetifiers =["*"]
        }
        action = ["s3:GetObject"]
        resources = ["${aws_s3_bucket.this.arn}/*"]
    }
}

resource "aws_s3_bucket_policy" "this" {
    bucket = aws_s3_bucket.this.id
    policy = data.aws_iam_policy_document.public_read.json
}