# Deploy a Multi-Service Node.js E-commerce Application Using Terraform and Docker

## 1. Application Setup (Manual - Not Terraform)

This section covers the manual setup of the application services before infrastructure provisioning.

### Objective

Create, containerize, and publish five independent services using Docker.

### Services

| Service Name | Port |
|-------------|------|
| Frontend | 3000 |
| User Service | 3001 |
| Product Service | 3002 |
| Order Service | 3003 |
| Cart Service | 3004 |

### Tasks Performed

#### Step 1: Create Dockerfiles

Created separate Dockerfiles for all five services.

Each service:

- Exposes a dedicated port.
- Returns a sample response confirming the service status.

```
E-CommerceStore/
├── backend/
│   ├── cart-service/
│   │   └── Dockerfile
│   ├── order-service/
│   │   └── Dockerfile
│   ├── product-service/
│   │   └── Dockerfile
│   └── user-service/
│       └── Dockerfile
└── frontend/
│   └── Dockerfile
├── docker-compose.yml
```

Example Response:

```text
Frontend Running
User Service Running
Product Service Running
Order Service Running
Cart Service Running
```

#### Step 2: Build Docker Images

Commands used:

```bash
docker build -t ecomm-frontend .
docker build -t ecomm-user-service .
docker build -t ecomm-product-service .
docker build -t ecomm-order-service .
docker build -t ecomm-cart-service .
```

#### Step 3: Test Docker Images Locally

Example:

```bash
docker run -d -p 3000:3000 ecomm-frontend
docker run -d -p 3001:3001 ecomm-user-service
docker run -d -p 3002:3002 ecomm-product-service
docker run -d -p 3003:3003 ecomm-order-service
docker run -d -p 3004:3004 ecomm-cart-service
```

> <img width="1269" height="457" alt="image" src="https://github.com/user-attachments/assets/80428202-8cc7-453a-82a6-32ff8947382a" />

Validation:

```bash
curl http://localhost:3000
curl http://localhost:3001
curl http://localhost:3002
curl http://localhost:3003
curl http://localhost:3004
```

#### Step 4: Tag Docker Images

```bash
docker tag ecomm-frontend <dockerhub-username>/ecomm-frontend:latest
docker tag ecomm-user-service <dockerhub-username>/ecomm-user-service:latest
docker tag ecomm-product-service <dockerhub-username>/ecomm-product-service:latest
docker tag ecomm-order-service <dockerhub-username>/ecomm-order-service:latest
docker tag ecomm-cart-service <dockerhub-username>/ecomm-cart-service:latest
```

> <img width="1305" height="191" alt="image" src="https://github.com/user-attachments/assets/eaf4f832-abf4-4355-8e24-910f8c16ef1b" />


#### Step 5: Push Images to Docker Hub

```bash
docker push <dockerhub-username>/ecomm-frontend:latest
docker push <dockerhub-username>/ecomm-user-service:latest
docker push <dockerhub-username>/ecomm-product-service:latest
docker push <dockerhub-username>/ecomm-order-service:latest
docker push <dockerhub-username>/ecomm-cart-service:latest
```

### Reference link with detailed steps

https://github.com/Harika130822/HV_SkillTest3_Terraform/blob/main/LocalDockerSetup/Readme.md

---

## 2. Infrastructure Provisioning with Terraform (25 Marks)

### Objective

Provision AWS infrastructure using Terraform to host and run the containerized services.

### Resources Created

#### VPC

- Custom VPC created using Terraform.
- CIDR Block: `10.0.0.0/16`

#### Public Subnet

- Public subnet created within the VPC.
- Auto-assigned public IP enabled.

#### Internet Gateway

- Attached to the VPC for internet access.

#### Route Table

- Configured routes for public internet connectivity.

#### EC2 Instance

- Amazon Linux 2 EC2 instance provisioned.
- Used as the Docker host for all application containers.

#### Security Group Configuration

Allowed inbound traffic:

| Port | Purpose |
|--------|----------|
| 22 | SSH Access |
| 3000 | Frontend Service |
| 3001 | User Service |
| 3002 | Product Service |
| 3003 | Order Service |
| 3004 | Payment Service |

Internal container-to-container communication was enabled through the security group configuration.

### Terraform User Data Script

The EC2 instance uses a User Data script to automate deployment.

Tasks executed during instance launch:

1. Install Docker.
2. Start Docker service.
3. Pull all Docker images from Docker Hub.
4. Create and run all containers.
5. Map service ports correctly.

Example User Data Operations:

```bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker

docker pull <dockerhub-username>/frontend-service:latest
docker pull <dockerhub-username>/user-service:latest
docker pull <dockerhub-username>/product-service:latest
docker pull <dockerhub-username>/order-service:latest
docker pull <dockerhub-username>/payment-service:latest

docker run -d -p 3000:3000 <dockerhub-username>/frontend-service:latest
docker run -d -p 3001:3001 <dockerhub-username>/user-service:latest
docker run -d -p 3002:3002 <dockerhub-username>/product-service:latest
docker run -d -p 3003:3003 <dockerhub-username>/order-service:latest
docker run -d -p 3004:3004 <dockerhub-username>/payment-service:latest
```

#### Reference Link with detailed steps

> https://github.com/Harika130822/HV_SkillTest3_Terraform/blob/main/terraform/Readme.md

```
terraform/
├── .terraform/
│   └── providers/
│       └── registry.terraform.io/
│           └── hashicorp/
│               └── aws/
│                   └── 5.100.0/
│                       └── windows_amd64/
│                           ├── LICENSE.txt
│                           └── terraform-provider-aws_v5.100.0_x5.exe
├── .terraform.lock.hcl
├── data.tf
├── main.tf
├── my-key.pub
├── outputs.tf
├── provider.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── terraform.tfvars
├── user_data.sh copy.tpl
├── user_data.sh.tpl
├── variables.tf
└── versions.tf
```

---

## 3. Deployment and Accessibility (25 Marks)

### Frontend Accessibility

The frontend service is deployed and publicly accessible using the EC2 Public IP.

Frontend URL:

```text
http://<EC2-Public-IP>:3000
```

Expected Response:

```text
Frontend is Live
```

### Backend Service Verification

Backend services were verified by:

- Inspecting running Docker containers.
- Accessing service endpoints.
- Viewing Docker container logs.

Verification Commands:

```bash
docker ps
```

```bash
docker logs <container-id>
```

Example Service Endpoints:

```text
http://<EC2-Public-IP>:3001
http://<EC2-Public-IP>:3002
http://<EC2-Public-IP>:3003
http://<EC2-Public-IP>:3004
```
> <img width="963" height="850" alt="image" src="https://github.com/user-attachments/assets/5a8baf45-87e4-47ea-93a3-1ae052cc47a8" />

### Terraform Outputs

Terraform outputs were configured to display the application access details.

Example:

```hcl
output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}
```

Sample Output:

```text
instance_public_ip = xx.xx.xx.xx
```

Application Access:

```text
http://xx.xx.xx.xx:3000
```

> <img width="881" height="565" alt="image" src="https://github.com/user-attachments/assets/8c155026-bab4-4301-b9ee-f4241bfd9b98" />

---

## Project Deliverables

- ✅ Five containerized Node.js services
- ✅ Dockerfiles for all services
- ✅ Docker images pushed to Docker Hub
- ✅ Terraform code for AWS infrastructure
- ✅ Custom VPC and Public Subnet
- ✅ EC2 Instance with Docker installed automatically
- ✅ Automated container deployment using User Data
- ✅ Frontend service publicly accessible
- ✅ Backend services verified
- ✅ Terraform outputs displaying public IP

---

