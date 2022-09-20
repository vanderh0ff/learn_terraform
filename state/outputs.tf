output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the web server"
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the web server"
}

output "security_group" {
  value = aws_security_group.sg_8080.id
}