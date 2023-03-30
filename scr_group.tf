resource "aws_security_group" "infra_sg" {
  name        = "devops_sg"
  description = "sec grp for devops_ec2 SSH"
  vpc_id      = aws_vpc.infra_vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.MY_IP]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_SSH"
  }
}