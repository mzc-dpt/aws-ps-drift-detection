resource "aws_security_group" "drift-detection" {
  # vpc_id = aws_vpc.vpc-test-stn.id
  name   = "drift-detection-sg"
  description = "Example security group for EC2 instances"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    
    ## 보안 취약점: 인터넷에 대한 액세스를 제어하지 않음
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all inbound traffic"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}
