output "vpc" {
  value = aws_vpc.app_vpc.id
}

output "app_public_subnets_0" {
  value = aws_subnet.app_public_subnets[0].id
}

output "app_public_subnets_1" {
  value = aws_subnet.app_public_subnets[1].id
}

output "app_private_subnets_0" {
  value = aws_subnet.app_private_subnets[0].id
}

output "app_private_subnets_1" {
  value = aws_subnet.app_private_subnets[1].id
}

output "alb" {
  value = aws_security_group.alb.id
}

output "service" {
  value = aws_security_group.service.id 
}
