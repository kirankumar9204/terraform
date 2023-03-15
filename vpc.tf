resource "aws_vpc" "oregon-vpc-test" {
  cidr_block = "10.12.0.0/16"
  tags = {
    Name = "oregon-vpc-testing"
  }
}


resource "aws_subnet" "oregon-public" {
  vpc_id     = aws_vpc.oregon-vpc-test.id
  cidr_block = "10.12.1.0/24"

  tags = {
    Name = "public-oregon"
  }
}



resource "aws_subnet" "oregon-private" {
  vpc_id     = aws_vpc.oregon-vpc-test.id
  cidr_block = "10.12.2.0/24"

  tags = {
    Name = "private-oregon"
  }
}

resource "aws_internet_gateway" "oregon-igw-test" {
  vpc_id = aws_vpc.oregon-vpc-test.id

  tags = {
    Name = "igw-testing"
  }
}


resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.oregon-vpc-test.id

  # route {
  #   # cidr_block = "10.12.0.0/16"
  #   gateway_id = aws_internet_gateway.oregon-igw-test.id
  # }
  tags = {
    Name = "public-route"
  }
}


resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.oregon-vpc-test.id


  tags = {
    Name = "private-route"
  }
}


resource "aws_route_table_association" "public-route" {
  subnet_id      = aws_subnet.oregon-public.id
  route_table_id = aws_route_table.public-route.id

}
# resource "aws_route_table_association" "pb-route" {
#   gateway_id     = aws_internet_gateway.oregon-igw-test.id
#   route_table_id = aws_route_table.public-route.id
# }


resource "aws_route_table_association" "priate-route" {
  subnet_id      = aws_subnet.oregon-private.id
  route_table_id = aws_route_table.private-route.id
}

resource "aws_route" "public_internet_gateway" {
  route_table_id = aws_route_table.public-route.id
  gateway_id     = aws_internet_gateway.oregon-igw-test.id
  destination_cidr_block = "0.0.0.0/0"
  timeouts {
    create = "5m"
  }
}

