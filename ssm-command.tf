resource "null_resource" "command_execution" {
  depends_on = [
    aws_instance.ssm_instances, aws_resourcegroups_group.development_ec2_resources
  ]

  provisioner "local-exec" {
    command = "aws ssm send-command --document-name apache-server --targets Key=resource-groups:Name,Values=Development-EC2-Resources --region eu-central-1"
  }
}