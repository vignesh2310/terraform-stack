resource "aws_key_pair" "terraform_key" {
  key_name   = "devops-key"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "infra_instance" {
    ami = var.AMI[var.REGION]
    instance_type = "t2.micro"
    subnet_id = aws_subnet.infra_pub1.id
    availability_zone = var.ZONE1
    key_name = aws_key_pair.terraform_key.key_name
    vpc_security_group_ids = [aws_security_group.infra_sg.id]
    tags = {
        name = "infra-devops-project"
    }
}

resource "aws_ebs_volume" "infra_volume" {
  availability_zone = var.ZONE1
  size              = 3

  tags = {
    Name = "devops_volume"
  }
}    

resource "aws_volume_attachment" "infra_attach_vol" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.infra_volume.id
  instance_id = aws_instance.infra_instance.id
}

output "PublicIP" {
  value = aws_instance.infra_instance.public_ip
}

output "PrivateIP" {
  value = aws_instance.infra_instance.private_ip
}

