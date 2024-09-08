resource "aws_iam_instance_profile" "ec2_prof" {
  name = "prof"
  role = "eks-group-nodes"
}

resource "aws_instance" "public-instance" {

  ami                         = var.ami
  instance_type               = var.instance-type
  subnet_id                   = var.subnet-id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.sg-id]
  key_name                    = var.my-key-name
  iam_instance_profile        = aws_iam_instance_profile.ec2_prof.name


  provisioner "remote-exec" {
    inline = ["sudo apt-get update"]
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("./${var.my-key-name}.pem")
    }
  }

  tags = {
    Name = "${var.instance_name}"
  }

}
