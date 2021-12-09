provider "aws" {
  region = var.region
}

resource "aws_instance" "LearningTerraform" {
  ami           = var.ami
  instance_type = "t3.micro"
  key_name      = var.key_name
  user_data     = <<-EOF
                #!/bin/bash
                echo "Hello World from Terraform" > index.html
                nohup busybox httpd -f -p "${var.server_port}" &
                EOF

  vpc_security_group_ids = ["${aws_security_group.LearningTerraformSG.id}"]
  tags = {
    Name     = "Learning Terraform"
    Business = "IT"
    Purpose  = "Staging"
  }
}

resource "aws_security_group" "LearningTerraformSG" {
  description = "Understanding Security Groups for a VPC"

  tags = {
    Name     = "Terraform SG"
    Business = "IT"
    Purpose  = "Staging"
  }

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    description = "HTTP Transport Port"
  }
}

