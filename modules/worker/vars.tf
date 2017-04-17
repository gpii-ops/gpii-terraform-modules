# CentOS 7.2 1602 from
# https://aws.amazon.com/marketplace/fulfillment?productId=b7ee8a69-ee97-4a49-9e68-afaee216db2e&ref_=dtl_psb_continue&region=us-east-1
# (CentOS doesn't currently publish an AWS 7.3 image. https://bugs.centos.org/view.php?id=12448)
variable "amis" {
  default = {
    us-east-1 = "ami-6d1c2007"
    us-east-2 = "ami-6a2d760f"
    us-west-1 = "ami-af4333cf"
    us-west-2 = "ami-d2c924b2"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "environment" {
  description = "Used for finding the correct remote state for modules we depend on"
}
