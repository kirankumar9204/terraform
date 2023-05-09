# resource "aws_instance" "test-ec2" {
#   ami           = "ami-0df24e148fdb9f1d8"
#   instance_type = "t2.micro"

#   count                       = 1
#   key_name                    = "tfkey"
#   vpc_security_group_ids      = [aws_security_group.all-traffic.id]
#   subnet_id                   = aws_subnet.oregon-public.id
#   associate_public_ip_address = true

#   tags = {
#     Name = "ansible"
#   }
# }



# # resource "aws_network_interface" "networkinterface" {
# #   subnet_id = aws_subnet.oregon-public.id



# #   attachment {
# #     instance     = aws_instance.test-ec2.id
# #     device_index = 1
# #   }
# # }

