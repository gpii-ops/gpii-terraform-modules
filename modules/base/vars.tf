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

# ssh keypair name must be unique across environments, so we'll construct it as
# `prefix-environment` (e.g. `gpii-key-dev-tyler`). We can't interpolate in
# variable stanzas, so consumers will have to do the keypair name construction
# themselves.
variable "ssh_key_name_prefix" {
  default = "gpii-key"
}

variable "environment" {}
