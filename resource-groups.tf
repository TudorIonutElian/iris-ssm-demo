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
                "Key": "BuildNumber",
                "Values": ["BuildNumber-${var.BUILD_NUMBER}"]
            }
        ]
    }
    JSON
  }
}