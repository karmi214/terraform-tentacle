provider "aws" {
}
terraform {
  backend "s3" {
    bucket = "auden-octopus-terraform-releasetour"
    key    = "releasetour.tfstate"
    region = "us-east-1"
  }
}
variable "bucket_name" {

}

resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket_name}"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "${var.environment}"
  }
}

# data "template_file" "init" {
#   template = "${file("init.tpl")}"
#   vars = {
#     thumbprint  = "${var.thumbprint}"
#     server_url  = "${var.server_url}"
#     api_key     = "${var.api_key}"
#     role        = "${var.role}"
#     environment = "${var.environment}"
#   }
# }

# resource "aws_instance" "web" {
#   ami             = "${var.ami}"
#   instance_type   = "t2.medium"
#   user_data       = "${data.template_file.init.rendered}"
#   key_name        = "${var.keypair}"
#   security_groups = ["${aws_security_group.rdp.name}"]
#   tags = {
#     Name        = "Octopus Instance"
#     Environment = "Test"
#   }
# }
# resource "aws_security_group" "rdp" {
#   name        = "Octopusgroup"
#   description = "security group for Octopus"

#   ingress {
#     from_port   = 10933
#     to_port     = 10933
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 3389
#     to_port     = 3389
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
