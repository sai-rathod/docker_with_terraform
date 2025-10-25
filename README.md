# Task-04:
# Docker with Terraform - React Application Deployment

This project automates the deployment of a React application using Terraform and Docker. It pulls a Docker image from Docker Hub and runs it as a container with automated infrastructure provisioning.

## 🚀 Overview

This Terraform configuration:
- Pulls the `sairathod/new-app` Docker image from Docker Hub
- Creates and runs a Docker container named `react-con`
- Exposes the application on port 3000
- Provides a simple, reproducible deployment process

## 📋 Prerequisites

Before running this project, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads) (v1.0+)
- [Docker](https://docs.docker.com/get-docker/) (Docker Engine running)
- Docker Hub account (if pulling private images)

## 🛠️ Infrastructure Components

### Resources Created

1. **Docker Image** (`docker_image.my-image`)
   - Image: `sairathod/new-app`
   - Pulled from Docker Hub

2. **Docker Container** (`docker_container.my-con`)
   - Container Name: `react-con`
   - Network Mode: Bridge
   - Port Mapping: `3000:3000` (host:container)
   - Restart Policy: No automatic restart
   - Remove Volumes: Yes (cleanup on destroy)

## 🚦 Quick Start

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Review the Execution Plan

```bash
terraform plan
```

### 3. Deploy the Infrastructure

```bash
terraform apply --auto-approve
```

**Expected deployment time:** ~2 minutes (depends on image size and network speed)

### 4. Access the Application

Once deployed, access the React application at:

```
http://localhost:3000
```

## 📊 Deployment Output

After successful deployment, you'll see:

```
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:
app-available = "http://localhost:3000"
```

For a complete deployment example, see [docs/terraform-apply-output.txt](./docs/terraform-apply-output.txt)

## 🧹 Cleanup

To destroy all created resources:

```bash
terraform destroy --auto-approve
```

This will:
- Stop and remove the Docker container
- Remove the Docker image (if no other containers are using it)
- Clean up all Terraform-managed resources

## 🔧 Configuration

### Port Configuration

The application is exposed on port **3000** by default. To change this:

1. Modify the `ports` block in your Terraform configuration
2. Update the external port value
3. Re-apply the configuration

### Network Mode

The container runs in **bridge** network mode, which is Docker's default network driver for standalone containers.

## 🐛 Troubleshooting

### Container Not Starting

```bash
# Check container status
docker ps -a

# View container logs
docker logs react-con
```

### Port Already in Use

If port 3000 is already occupied:
```bash
# Find process using port 3000
sudo lsof -i :3000

# Or modify the Terraform configuration to use a different port
```

### Image Pull Issues

If the image fails to pull:
```bash
# Verify Docker Hub connectivity
docker pull sairathod/new-app

# Check Docker daemon status
sudo systemctl status docker
```

## 📝 Notes

- The Docker image pull may take 1-2 minutes depending on image size and network speed
- Container is set to `must_run = true`, ensuring it stays running
- Volumes are automatically removed when the container is destroyed
- The container does not auto-restart on failure (restart policy: "no")
