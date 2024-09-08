provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["$HOME/.aws/config"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
}
module "network" {
  source = "./NETWORK"
}
module "iam_role" {
  source = "./IAM"
}
module "eks" {
  source                  = "./EKS"
  depends_on              = [module.iam_role, module.network]
  eks-service-role____arn = module.iam_role.service-role-cluster__arn
  eks-node-role____arn    = module.iam_role.eks-node-role____arn
  subnet_list____ids      = [module.network.private-subnet3, module.network.private-subnet4]
  ssh_key                 = "K8sKey"
  security-group-id       = module.network.sg-id
  vpc-id                  = module.network.vpc-id

}
module "backend-service" {
  source        = "./EC2"
  ami           = "ami-053b0d53c279acc90"
  instance-type = "t2.micro"
  subnet-id     = module.network.public-subnet1
  sg-id         = module.network.sg-id
  instance_name = "backend-service"

}
