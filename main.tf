provider "aws" {
}

data "template_file" "init" {
  template = "${file("init.tpl")}"
  vars = {
    thumbprint  = "${var.thumbprint}"
    server_url  = "${var.server_url}"
    api_key     = "${var.api_key}"
    role        = "${var.role}"
    environment = "${var.environment}"
  }
}

resource "aws_instance" "web" {
  ami             = "ami-06a4e829b8bbad61e"
  instance_type   = "t2.medium"
  user_data       = "${data.template_file.init.rendered}"
  key_name        = "AnishKeyPairRDP"
  security_groups = ["rdp"]
}
