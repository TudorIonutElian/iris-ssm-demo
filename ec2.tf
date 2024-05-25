/**********************************************************
  # Create Ec2 Instance called iris_tf_demo_ec2_instance
**********************************************************/
resource "aws_instance" "ssm_instances" {
  ami           = data.aws_ami.iris_ssm_ami_filter.id
  instance_type = var.ssm_instance_type
  key_name      = aws_key_pair.ssm_key.key_name
  count         = var.ssm_instance_count

  tags = {
    Name        = "SSM Instance"
    Environment = "Development"
  }

  provisioner "local-exec" {
   # the below command replaces the existing instance id in the file, if any 
   # and replaces it with the new instance id
    command = <<EOF
      rm -f ec2_instance_ids.txt
      touch ec2_instance_ids.txt
      echo ${aws_instance.automation.id} >> ec2_instance_ids.txt
    EOF
  }
}