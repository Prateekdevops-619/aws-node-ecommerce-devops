
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id  # This uses the search result above
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker

              docker run -d --name frontend -p 3000:3000 prateek61913/frontend:latest
              docker run -d --name user-service -p 3001:3001 prateek61913/user-service:latest
              docker run -d --name product-service -p 3002:3002 prateek61913/product-service:latest
              docker run -d --name order-service -p 3003:3003 prateek61913/order-service:latest
              docker run -d --name cart-service -p 3004:3004 prateek61913/cart-service:latest
              EOF

  tags = { Name = "Ecommerce-FullStack-Server" }
}