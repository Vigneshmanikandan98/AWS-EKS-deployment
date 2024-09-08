# Kubernetes Deployment using Terraform, Jenkins and AWS EKS.

## Build the infrastructure on AWS.

1. Get the AWS account access keys and setup terraform to build on AWS.
2. Run Terraform plan, init and apply to build the infrastructure.

## Containerize the application.

1. Use Docker to containerize the application,
2. Build docker image and store it in docker registry or push it to AWS ECR.

example to push on AWS ECR

aws ecr create-repository --repository-name java-backend

aws ecr get-login-password | docker login --username AWS --password-stdin <ECR-URL>

docker tag java-backend-app <ECR-URL>:latest

docker push <ECR-URL>:latest

## Jenkins and Kubernetes

1. Apply the K8s files to jenkins
2. Access the jenkins UI using the load balancer GUI name.
