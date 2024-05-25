resource "aws_resourcegroups_group" "development_ec2_resources" {
  name = "Development EC2 Resources"

  resource_query {
    query = <<JSON
    {
        "ResourceTypeFilters": [
            "AWS::EC2::Instance"
        ],
        "TagFilters": [
            {
                "Key": "Environment",
                "Values": ["Development"]
            }
        ]
    }
    JSON
  }
}

resource "aws_ssm_association" "ec2_development_instances_association" {
  depends_on          = [aws_ssm_document.apache_document, data.aws_instances.ec2_development_instances]
  for_each            = toset(data.aws_instances.ec2_development_instances.ids)
  name                = aws_ssm_document.apache_document.name
  instance_id         = each.value
  schedule_expression = "rate(30 minutes)"
}