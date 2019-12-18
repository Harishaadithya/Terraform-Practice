data "aws_ip_ranges" "ohio_ec2" {
    regions = ["${var.region}"]
    services = ["ec2"]
  
}

resource "aws_security_group" "Aadithya" {
    name = "Aadithya"

        ingress {
            from_port = "22"
            to_port = "22"
            protocol = "tcp"
            cidr_blocks = data.aws_ip_ranges.ohio_ec2.cidr_blocks
        }

        tags = {
            CreateDate = data.aws_ip_ranges.ohio_ec2.create_date
            SyncToken = data.aws_ip_ranges.ohio_ec2.sync_token

        }
}

