resource "aws_instance" "Rancher" {
  count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type
  security_groups = ["bots4you"]
  key_name = "aws-keybots4you"

  provisioner "file" {
    source      = "/home/ankit/projects/master.sh"
    destination = "/home/ubuntu/master.sh"

    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("/home/ankit/aws-keybots4you.pem")
      host = ""
    #}
  }

  user_data = file("master.sh")

  tags = {
    #Name = "Terraform-${count.index + 1}"
    Name= "Rancher"
  }
}

output "ip" {
  value = aws_instance.Rancher.*.public_ip
}