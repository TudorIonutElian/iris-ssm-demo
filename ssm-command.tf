resource "null_resource" "run_ssm_command" {
    # ... other instance configuration ...

    provisioner "local-exec" {
        command = <<EOF
            aws ssm send-command --document-name "apache_document" \
                --document-version "1" \
                --targets '[{"Key":"InstanceIds","Values":[]}]' \
                --parameters '{"Message":["Welcome to the Apache Server for IRIS Demo!"]}' \
                --timeout-seconds 600 --max-concurrency "50" \
                --max-errors "0" --region eu-central-1
        EOF
    }
}