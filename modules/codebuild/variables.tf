variable "aws_region" {
  description = "AWS region"
}

variable "aws_profile" {
  description = "AWS profile"
}

variable "remote_state_bucket" {}

variable "repo_url" {
  description = "URL to Github repository to fetch source from"
}

variable "environment" {
  type        = string
}

variable "app_name" {
  type        = string
}

variable "build_spec_file" {
  default = "buildspec.yml"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "The VPC ID that CodeBuild uses"
}

variable "github_token" {
  description = "GitHub token"
  type        = string
  default     = ""
}

# variable "public_subnet_ids" {
#   type        = list(string)
#   default     = null
#   description = "The subnet IDs that include resources used by CodeBuild"
# }

variable "private_subnet_ids" {
  type        = list(string)
  default     = null
  description = "The subnet IDs that include resources used by CodeBuild"
}

variable "security_groups" {
  type        = list(string)
  default     = null
  description = "The security group IDs used by CodeBuild to allow access to resources in the VPC"
}

variable "env_vars" {
  description = <<EOF
Pass env vars for codebuild project(in native for codebuild project format)
Example:
env_vars = [
      {
        "name"  = "SOME_KEY1"
        "value" = "SOME_VALUE1"
      },
      {
        "name"  = "SOME_KEY2"
        "value" = "SOME_VALUE2"
      },
    ]
EOF

  default = []
}

locals {
  codebuild_project_name = "${var.app_name}-${var.environment}"
  description = "Codebuild for ${var.app_name} environment ${var.environment}"
}

variable "branch_pattern" {}

variable "git_trigger_event" {}
