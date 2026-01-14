##🛒 E-Commerce Application on AWS EKS – Microservices Platform (11 Services)

This project showcases a production-style E-Commerce microservices platform deployed on AWS EKS using modern DevOps practices. It covers complete automation from infrastructure provisioning to application deployment using Terraform, Jenkins, Docker, ECR, Kubernetes, Helm, and Argo CD.

##Inspired by:
📖 Medium Blog:
https://medium.com/@yaswanth.arumulla/how-to-deploy-a-full-microservices-e-commerce-application-11-services-on-aws-eks-af1ba4c87ccf

##🔥 Project Highlights

#11 Microservices based E-Commerce application

AWS EKS cluster provisioned using Terraform
Jenkins for CI/CD pipeline automation
Docker for containerization
AWS ECR for container image storage
Kubernetes for orchestration
Helm for versioning and rollback
Argo CD for GitOps-style deployment
S3 for Terraform remote state & artifacts
Jump Host EC2 for Jenkins + kubectl + Terraform execution

Fully modular infrastructure design

##🏗 Repository Structure
.
├── ecr-terraform/           # Terraform to create ECR repositories
├── eks-terraform/           # Terraform to create EKS cluster
├── terraform_main_ec2/      # Terraform for Jenkins / Bastion EC2
├── s3-buckets/              # Terraform for S3 state buckets
├── jenkinsfiles/            # CI/CD pipelines
├── kubernetes-files/        # Kubernetes deployment manifests
├── src/                     # Microservices source code
├── README.md

##🚀 Architecture Flow

Code is pushed to GitHub
Jenkins Pipeline:
Builds Docker images
Tags images with versions
Pushes images to AWS ECR
Kubernetes deployment files are updated
Argo CD syncs changes to EKS automatically
Helm manages releases and rollback
Services become available via Kubernetes LoadBalancer / Ingress

##⚙️ Prerequisites

AWS Account
Terraform
Docker
kubectl
Jenkins
AWS CLI configured
IAM permissions for EKS, EC2, ECR, S3

##🛠 Deployment Steps
1. Create S3 Buckets (Terraform State Storage)
cd s3-buckets
terraform init
terraform apply -auto-approve

2. Create ECR Repositories
cd ecr-terraform
terraform init
terraform apply -auto-approve

3. Create Jenkins / Jump Host EC2
cd terraform_main_ec2
terraform init
terraform apply -auto-approve

#This EC2 will:

Run Jenkins
Execute Terraform
Control kubectl access to EKS

4. Create EKS Cluster
cd eks-terraform
terraform init
terraform apply -auto-approve


##Configure kubeconfig:

aws eks --region <region> update-kubeconfig --name <cluster-name>

5. Setup Jenkins Pipelines

Configure AWS credentials in Jenkins
Configure Docker
Create pipelines using Jenkinsfiles from jenkinsfiles/

Pipelines will:

Build Docker images
Push to ECR
Trigger deployment

6. Deploy Microservices
kubectl apply -f kubernetes-files/
or let Argo CD sync automatically.

🔁 Rollback Strategy

Using Kubernetes:
kubectl rollout undo deployment <deployment-name>
Using Helm:
helm rollback <release-name> <revision-number>

##🧹 Destroy Infrastructure (Cost Saving)

Normal destroy:
terraform destroy -auto-approve

Force destroy:

terraform destroy -auto-approve --force
Run destroy in all Terraform directories:

s3-buckets
ecr-terraform
terraform_main_ec2
eks-terraform

##🎯 What This Project Proves

This single project demonstrates:
End-to-end DevOps workflow
AWS EKS production setup
Infrastructure as Code
CI/CD design and automation
GitOps with Argo CD
Microservices deployment at scale
Real-world troubleshooting capability

Perfect for:
DevOps portfolios
EKS hands-on practice
Interview discussions
Cloud architecture demonstrations

👨‍💻 Author

Sarath V
DevOps Engineer | AWS | Kubernetes | Terraform | CI/CD

GitHub: https://github.com/vsaraths
