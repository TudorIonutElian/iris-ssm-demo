resource "aws_resourcegroups_group" "development_ec2_resources" {
  name = "Development-EC2-Resources"

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
  count            = 3
  name             = aws_ssm_document.apache_document.name
  instance_id      = [
    aws_instances.ssm_instances[0].id, 
    aws_instances.ssm_instances[1].id, 
    aws_instances.ssm_instances[2].id]
  schedule_expression = "rate(30 minutes)"
}