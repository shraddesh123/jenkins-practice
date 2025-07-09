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
