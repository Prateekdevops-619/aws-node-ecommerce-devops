# AWS Microservices E-Commerce Deployment 🚀

This project demonstrates a full DevOps workflow: containerizing a 5-service Node.js application using **Docker**, provisioning cloud infrastructure with **Terraform**, and deploying everything to **AWS EC2**.

## Architecture
The application consists of 5 decoupled services, each running in its own Docker container:
* **Frontend**: Public-facing UI (Port 3000)
* **User Service**: User management (Port 3001)
* **Product Service**: Catalog management (Port 3002)
* **Order Service**: Transaction logic (Port 3003)
* **Cart Service**: Shopping cart state (Port 3004)

##  Tech Stack
* **Runtime**: Node.js (Express.js)
* **Containerization**: Docker
* **Registry**: Docker Hub
* **Infrastructure as Code**: Terraform
* **Cloud Provider**: AWS (VPC, Subnets, Security Groups, EC2)

##  How to Deploy

### 1. Prerequisites
* AWS CLI configured with Access Keys.
* Terraform installed locally.
* Docker Hub account.

### 2. Dockerization
Each service is built and pushed to Docker Hub:



## 🛠️ Terraform Infrastructure Code

To keep the project modular, the following files are created inside the `infrastructure/` directory. These files automate the creation of the VPC, Security Groups, and the EC2 instance.

### 1. Project Files Structure
| File | Purpose |
| :--- | :--- |
| `provider.tf` | Defines AWS as the cloud provider (Region: eu-west-2). |
| `vpc.tf` | Creates the Network, Subnet, and Internet Gateway. |
| `security.tf` | Opens Ports 22 (SSH) and 3000-3004 (App Services). |
| `main.tf` | Provisions the EC2 and runs the Docker User Data script. |
| `outputs.tf` | Displays the Public IP and Website URL. |

---

##  Step-by-Step Deployment Guide

Follow these steps to deploy the 5-service e-commerce application from scratch.

### Containerize the Services and then use teeraform to provision the infrastructure and deploy the app
Navigate into each service folder, build the image, and push it to Docker Hub:
```bash
# Repeat for: frontend, user-service, product-service, order-service, cart-service
cd <service-folder>
docker build -t prateek61913/<service-name>:latest .
docker push prateek61913/<service-name>:latest
cd ..

### 3. Infrastructure Provisioning

cd infrastructure
terraform init
terraform plan
terraform apply -auto-approve




docker push prateek61913/frontend:latest
# (Repeat for all 5 services)
