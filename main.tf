resource "aws_instance" "testing" {
  count = "${var.instance_count}"

  ami = "${var.ami}"

  instance_type = "${var.instance_type}"

  key_name = "anktiCentos"

  provisioner "file" {
    source      = "project-demo/"
    destination = "/home/centos/"

    connection {
      user     = "centos"
      private_key = "${file("anktiCentos.pem")}"
    }
  }

  user_data = "${file("stack.sh")}"

  tags {
    Name = "Terraform-${count.index + 1}"
  }
}

output "ip" {
  value = "${aws_instance.testing.*.public_ip}"
}
