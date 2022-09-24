output "public_ip" {
  description = "The public ip address used to access the instance"
  value       = aws_instance.example.public_ip
}