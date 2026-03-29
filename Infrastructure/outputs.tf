output "app_url" {
  value = "http://${aws_instance.app_server.public_ip}:3000"
  description = "Click this link to see your Frontend"
}