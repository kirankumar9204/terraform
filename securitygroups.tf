resource "aws_security_group" "all-traffic" {
  name        = "all-traffic"
  description = "Allow all-traffic inbound"
  vpc_id      = aws_vpc.oregon-vpc-test.id

  ingress {
    description = "allows all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "all traffic"
  }
}


resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "open for ssh 22"
  vpc_id      = aws_vpc.oregon-vpc-test.id

  ingress {
    description = "ssh 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "ssh 22"
  }
}