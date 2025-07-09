resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "jenkins-vpc"
  }
}
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "jenkins-subnet"
  }
}
resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "jenkins-igw"
  }
}
resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    gateway_id = aws_internet_gateway.aws_internet_gateway.id
    cidr_block = "0.0.0.0/0"
  }
}
resource "aws_route_table_association" "rt-association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my-rt.id
}
