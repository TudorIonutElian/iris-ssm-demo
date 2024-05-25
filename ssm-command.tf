resource "null_resource" "command_execution" {
  depends_on = [
    aws_instance.ssm_instances, aws_resourcegroups_group.development_ec2_resources
  ]

  provisioner "local-exec" {
    command = "aws resource-groups list-group-resources --group-name Development-EC2-Resources --query 'ResourceIdentifiers[].ResourceArn' --output text | tr '\t' '\n' | cut -d'/' -f2 | xargs -I {} aws ssm send-command --document-name apache_document --instance-ids {} --region eu-central-1"
  }
}