output "PublicIP" {
  value = aws_instance.LearningTerraform.public_ip
}

output "PublicDNS" {
  value = aws_instance.LearningTerraform.public_dns
}
