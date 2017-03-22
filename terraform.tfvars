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

# Probably easiest to create a ~/.aws, as for use with the aws cli. However you
# can also hardcode credentials here (for testing; don't commit them!).
access_key = ""
secret_key = ""
key_name = "donkey"
region = "us-east-1"
ami = "ami-13be557e"
instance_type = "t2.micro"
