terraform {
    backend "s3" {
        bucket         = "teamcity-iris-ssm-demo"
        key            = "teamcity-iris-ssm-demo-state.tfstate"
        region         = "eu-central-1"
        dynamodb_table = "teamcity-iris-ssm-demo"
    }
}