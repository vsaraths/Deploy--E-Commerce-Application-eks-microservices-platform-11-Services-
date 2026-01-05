resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.public-subnet1.id

  vpc_security_group_ids = [
    aws_security_group.security-group.id
  ]

  iam_instance_profile = aws_iam_instance_profile.instance-profile.name

  user_data = file("${path.module}/install-tools.sh")

  tags = {
    Name = var.instance_name
  }
}
