
output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_id" {
  value = aws_subnet.privatesubnet[1].id
}

output "public_subnet_id" {
  value = aws_subnet.publicsubnet[1].id
}

output "private_subnet_id2" {
  value = aws_subnet.privatesubnet[2].id
}

output "public_subnet_id2" {
  value = aws_subnet.publicsubnet[2].id
}

