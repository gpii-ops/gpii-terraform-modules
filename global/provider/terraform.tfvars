terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }
}

# Probably easiest to create a ~/.aws, as for use with the aws cli. However you
# can also hardcode credentials here (for testing only -- don't commit them!).
access_key = ""
secret_key = ""
region = "us-east-1"
