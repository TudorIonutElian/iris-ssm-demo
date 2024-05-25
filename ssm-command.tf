resource "null_resource" "command_execution" {
  depends_on = [
    aws_instance.ssm_instances, aws_resourcegroups_group.development_ec2_resources
  ]


    provisioner "local-exec" {
        command = "bash ./scripts/.sh"
    }

}