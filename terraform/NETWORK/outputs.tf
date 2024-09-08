output "public-subnet1" {
  value = aws_subnet.main-vpc-subnets[0].id
}
output "public-subnet2" {
  value = aws_subnet.main-vpc-subnets[1].id
}
output "private-subnet3" {
  value = aws_subnet.main-vpc-subnets[2].id
}
output "private-subnet4" {
  value = aws_subnet.main-vpc-subnets[3].id
}

output "vpc-id" {
  value = aws_vpc.main-vpc.id
}
output "sg-id" {
  value = aws_security_group.eks_control_plane_sg.id
}
