data "aws_instances" "ec2_development_instances" {
  instance_tags = {
    ResourceGroup = aws_resourcegroups_group.development_ec2_resources.name
  }
}