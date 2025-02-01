bucket_name = "dev-proj-1-remote-state-bucket12345666666"
name        = "environment"
environment = "dev-1"

vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev-proj-eu-central-vpc-1"
cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
cidr_private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
eu_availability_zone = ["eu-central-1a", "eu-central-1b"]

public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMFvJeqTDn0IXm73dVq9BbnhlVo9vspw+nBilKt3WZU naveen@Dell"
ec2_ami_id     = "ami-03fd334507439f4d1"

ec2_user_data_install_apache = ""

domain_name = "cloudnet.click"
