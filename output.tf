# I will like to output some properties of my Bastion host.

output "publicip" {
  value = aws_instance.Bastiontf.public_ip
}

output "publicdns" {
  value = aws_instance.Bastiontf.public_dns
}

output "privateip" {
  value = aws_instance.Bastiontf.private_ip
}

output "privatedns" {
  value = aws_instance.Bastiontf.private_dns
}