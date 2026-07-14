# Create an S3 bucket to store the Terraform state
resource "aws_s3_bucket" "tf_state" {
  bucket = "${var.cluster_name}-tf-state" # Ensure this name is globally unique

  lifecycle {
    prevent_destroy = true # Prevent the bucket from being destroyed
  }

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "tf_state_bucket" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Create a DynamoDB table for state locking
resource "aws_dynamodb_table" "tf_lock" {
  name         = "${var.cluster_name}-terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true # Prevent accidental deletion of the DynamoDB table
  }

  tags = var.tags
}
