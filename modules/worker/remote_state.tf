# I really wish I could re-use these variables from the terragrunt{} stanza in
# terraform.tfvars, but I couldn't figure out how to do that.
data "terraform_remote_state" "base" {
  backend = "s3"
  config {
    bucket = "gpii-terraform-state"
    key = "${var.environment}/base/terraform.tfstate"
    region = "us-east-1"
  }
}
