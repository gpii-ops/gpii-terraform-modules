terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }

  dependencies {
    paths = ["../base"]
  }
}

key_name = "donkey"
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
