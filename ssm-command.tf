resource "null_resource" "command_execution" {
  depends_on = [
    aws_instance.ssm_instances, aws_resourcegroups_group.development_ec2_resources
  ]


    provisioner "local-exec" {
        command = <<EOT
                touch instance_ids_${BUILD_NUMBER}.txt

                aws resource-groups list-group-resources \
                    --group-name "Development-EC2-Resources" \
                    --query 'ResourceIdentifiers[?ResourceType==`AWS::EC2::Instance`].ResourceArn' \
                    --output json | jq -r '.[] | split("/") | .[-1]' > instance_ids_${BUILD_NUMBER}.txt
                
                mapfile -t instance_ids < instance_ids_${BUILD_NUMBER}.txt
                
                INSTANCE_IDS=$(IFS=','; echo "${instance_ids[*]}")

                cat instance_ids_${BUILD_NUMBER}.txt
        EOT
    }

}