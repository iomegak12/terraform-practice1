variable "server_port" {
  default     = 8080
  description = "EC2 Instance Hoste Busybox Listener Port"
}

variable "region" {
  default = "ap-south-1"
}

variable "ami" {
    default = "ami-0567e0d2b4b2169ae"
}

variable "key_name" {
    default = "iomega-azure-keypair"
}