variable "namespace" {
  description = "Project namespace to be used for unique resource naming"
  type        = string
}

variable "ssh_keypair" {
  description = "SSH keypair to use for em2 instnces"
  type        = string
  default     = null
}

variable "region" {
  type        = string
  description = "region where the resource will be provisioned"
  default     = "us-east-1"
}