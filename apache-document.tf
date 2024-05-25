resource "aws_ssm_document" "apache_document" {
  name            = "apache_document"
  document_format = "YAML"
  document_type   = "Command"

  content = file("documents/apache-server.yaml")
}
