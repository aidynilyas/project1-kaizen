module "ansiblejenkins" {
  source  = "aidynilyas/ansiblejenkins/aws"
  version = "1.0.4"
  region        = "us-east-1"
  vpc_cidr      = "172.16.0.0/16"
  subnet1_cidr  = "172.16.1.0/24"
}

output "web_instance_public_ip" {
  value = module.ansiblejenkins.ec2
}
