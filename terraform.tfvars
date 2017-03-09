terragrunt = {
  # Configure Terragrunt to use DynamoDB for locking
  lock {
    backend = "dynamodb"
    config {
      state_file_id = "dev-troscoe"
    }
  }

  # Configure Terragrunt to automatically store tfstate files in an S3 bucket
  remote_state {
    backend = "s3"
    config {
      encrypt = "true"
      bucket = "dev-troscoe"
      key = "terraform.tfstate"
      region = "us-west-2"
    }
  }
}

access_key = "ACCESS_KEYYYYYYYYYYY"
secret_key = "SECRET_KEYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
key_name = "donkey"
region = "us-east-1"
ami = "ami-13be557e"
instance_type = "t2.micro"
