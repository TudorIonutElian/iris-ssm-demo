resource "null_resource" "command_execution" {
  depends_on = [
    aws_instance.ssm_instances, aws_resourcegroups_group.development_ec2_resources
  ]


    provisioner "local-exec" {
        command = <<EOT
                aws ssm send-command \
                    --targets Key=tag:Environment,Values=Development-${BUILD_NUMBER} \
                    [...]
        EOT
    }

}