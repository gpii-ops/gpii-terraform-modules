terragrunt = {
  # Configure Terragrunt to use DynamoDB for locking
  lock {
    backend = "dynamodb"
    config {
      state_file_id = "dev-${get_env("USER", "unknown_user")}"
    }
  }

  # Configure Terragrunt to automatically store tfstate files in an S3 bucket
  remote_state {
    backend = "s3"
    config {
      encrypt = "true"
      bucket = "dev-${get_env("USER", "unknown_user")}"
      key = "terraform.tfstate"
      region = "us-east-1"
    }
  }
}
