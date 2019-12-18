resource "aws_instance" "rakul_preeth_singh" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name

  tags = {
    Name = "rakul_preeth_singh"
  }

  # providing subnet

  subnet_id = aws_subnet.Publicsubnet_1.id

  # Security Group

  vpc_security_group_ids = [aws_security_group.harish.id]


}

resource "aws_ebs_volume" "Extra_volume" {
  size              = 10
  type              = "gp2"
  availability_zone = "us-east-2a"

  tags = {
    Name = "Extra_volume"
  }

}

resource "aws_volume_attachment" "Extra_volume_attachment" {
  volume_id   = aws_ebs_volume.Extra_volume.id
  device_name = "/dev/xvdh"
  instance_id = aws_instance.rakul_preeth_singh.id

}

