/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "ssm_instances" {
  ami           = data.aws_ami.iris_ssm_ami_filter.id
  instance_type = var.ssm_instance_type
  key_name      = aws_key_pair.ssm_key.key_name
  count         = var.ssm_instance_count
  aws_iam_role  = aws_iam_role.ec2_ssm_role.name

  tags = {
    Name        = "SSM Instance"
    Environment = "Development-${var.BUILD_NUMBER}"
  }
}