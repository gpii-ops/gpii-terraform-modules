# Probably easiest to create a ~/.aws, as for use with the aws cli. However you
# can also hardcode credentials here (for testing only -- don't commit them!).
# See https://www.terraform.io/docs/providers/aws/#authentication.
variable "access_key" {
  default = ""
}
variable "secret_key" {
  default = ""
}

variable "region" {
  default = "us-east-1"
}

variable "ssh_key_name" {
  default = "gpii-key"
}
