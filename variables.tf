variable "ssm_instance_type" {
  type        = string
  default     = 5
  description = "SSM instance type"
}

variable "ssm_instance_count" {
  type        = number
  default     = 3
  description = "SSM instance count"
}

variable "startsWith" {
  description = "The prefix of the AMI name"
  type = string
  default = "al2023-ami"
}

variable "endsWith" {
  description = "The suffix of the AMI name"
  type = string
  default = "x86_64"
}

variable "architecture" {
  description = "The architecture of the AMI"
  type = string
  default = "x86_64"
}