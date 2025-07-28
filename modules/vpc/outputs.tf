output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "nat_eip_id" {
  value = aws_eip.nat_eip.id
}

output "private_subnets_ids" {
  value = aws_subnet.private_subnet[*].id
}


