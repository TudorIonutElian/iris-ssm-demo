resource "aws_resourcegroups_group" "development_ec2_resources" {
  name = "test-group"

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