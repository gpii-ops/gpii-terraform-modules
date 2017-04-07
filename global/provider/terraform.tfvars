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
# can also hardcode credentials here (for testing only -- don't commit them!).
access_key = ""
secret_key = ""
key_name = "donkey"
region = "us-east-1"
# CentOS 7.2 1602 from
# https://aws.amazon.com/marketplace/fulfillment?productId=b7ee8a69-ee97-4a49-9e68-afaee216db2e&ref_=dtl_psb_continue&region=us-east-1
# (CentOS doesn't currently publish an AWS 7.3 image. https://bugs.centos.org/view.php?id=12448)
amis = {
  us-east-1 = "ami-6d1c2007"
  us-east-2 = "ami-6a2d760f"
  us-west-1 = "ami-af4333cf"
  us-west-2 = "ami-d2c924b2"
}
instance_type = "t2.micro"
