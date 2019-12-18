resource "aws_key_pair" "sarayu" {
    key_name = "sarayu"
    public_key = file(var.public)

}

resource "aws_instance" "terraform_practice" {
    ami = var.ami[var.region]
    instance_type = "t2.micro"
    key_name = aws_key_pair.sarayu.key_name
  
    tags = {
        Name = "Harish_Terraform"
    }


    provisioner "file" {
        source = "terraform.sh"
        destination = "/tmp/terraform.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod 755 /tmp/terraform.sh",
            "sudo /tmp/terraform.sh",
        ]   
    }

    connection {
        type = "ssh"
        user = var.user
        private_key = file(var.private)
        host = coalesce(self.public_ip, self.private_ip)
    }

    provisioner "local-exec" {
        command = "echo ${aws_instance.terraform_practice.private_ip} >> privateip.txt"
    }
}



output "public_ip" {
  value = aws_instance.terraform_practice.public_ip
}

output "private_ip" {
  value = aws_instance.terraform_practice.private_ip
}

