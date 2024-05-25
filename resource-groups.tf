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
            },
            {
                "Key": "State.Name",
                "Values": ["running"]
            }
        ]
    }
    JSON
  }
}