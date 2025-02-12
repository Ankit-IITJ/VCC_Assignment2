# Google Cloud Platform (GCP) - Virtual Machine Setup, Auto-Scaling, and Security Configuration

## Introduction
This repository provides an automated approach to deploying a scalable and secure infrastructure on **Google Cloud Platform (GCP)**. The solution includes:
- **Automated deployment** of virtual machines (VMs) using a Bash script.
- **Auto-scaling policies** to dynamically adjust instances based on CPU utilization.
- **Security configurations** including **firewall rules** and **IAM roles**.
- **Load balancer setup** for efficient traffic distribution.
- **Testing procedures** for auto-scaling and security verification.
- **Cleanup script** to optimize cost management.

---

## Features
✅ Automates **GCP SDK installation** and authentication.
✅ Deploys **Managed Instance Group** with auto-scaling policies.
✅ Configures **firewall rules** and **IAM roles** for security.
✅ Sets up an **HTTP Load Balancer** for traffic distribution.
✅ Provides testing scripts for **auto-scaling, security, and IAM role verification**.
✅ Includes a cleanup script to **delete resources** after testing.

---

## Prerequisites
Ensure you have the following:
- **Google Cloud SDK** installed [(Installation Guide)](https://cloud.google.com/sdk/docs/install)
- A **GCP account** with billing enabled
- Permissions to create and manage resources on GCP

---

## Deployment Steps

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```
2. **Make the script executable**
   ```bash
   chmod +x assignment2_gcp-auto-scaling.sh
   ```
3. **Run the deployment script**
   ```bash
   ./assignment2_gcp-auto-scaling.sh
   ```

### What the Script Does:
- **Creates an Instance Template** with required startup configurations.
- **Deploys a Managed Instance Group** with auto-scaling policies.
- **Sets up firewall rules** to allow only necessary traffic.
- **Configures a Load Balancer** for efficient traffic routing.
- **Assigns IAM roles** to different users for controlled access.

---

## Configuration Details
### Auto-Scaling Policies:
- **Minimum Instances:** `1`
- **Maximum Instances:** `5`
- **Target CPU Utilization:** `60%`
- **Cooldown Period:** `120s`

### Firewall Rules:
- Allows **HTTP traffic (tcp:80)** from all sources.
- Restricts **SSH access (tcp:22)** to a specific IP.
- Allows **health check traffic** from Google IP ranges.

### IAM Role Assignments:
- `Compute Viewer` role for read-only access.
- `Compute Instance Admin` role for VM management.

---

## Testing the Setup
### 1️⃣ Testing Auto-Scaling
1. **SSH into a VM instance**
   ```bash
   gcloud compute ssh my-instance --zone=us-central1-a
   ```
2. **Install the stress utility**
   ```bash
   sudo apt update && sudo apt install stress
   ```
3. **Simulate high CPU usage**
   ```bash
   stress --cpu 2 --timeout 120
   ```
4. **Check the number of instances** to confirm auto-scaling.

### 2️⃣ Testing Load Balancer
- Verify that **incoming traffic** is distributed among different VMs.

### 3️⃣ Testing Firewall Rules
- Ensure **SSH access is restricted** to specific IPs.
- Confirm **traffic is allowed only on port 80** for HTTP.

### 4️⃣ Testing IAM Roles
- Use `gcloud auth login` to switch users.
- Attempt **permitted** and **restricted** actions to verify role-based access control.

---

## Cleanup (Cost Optimization)
After testing, **delete all resources** to avoid unnecessary charges:
1. **Make the cleanup script executable**
   ```bash
   chmod +x assignment2_gcp_delete.sh
   ```
2. **Run the cleanup script**
   ```bash
   ./assignment2_gcp_delete.sh
   ```

---

## Architecture Diagram
Below is the high-level architecture of the deployed infrastructure:
- **Managed Instance Group** dynamically scaling VMs.
- **Application Load Balancer** distributing incoming requests.
- **Firewall Rules** enforcing security policies.
- **IAM Roles** managing access control.

🖼️ *Refer to the architecture diagram.*

---

## 🎥 Video Demonstration
A recorded demonstration of the setup process: [Watch Here](#)

## 📚 References
- [GCP SDK](https://cloud.google.com/sdk?hl=en)
- [GCP CLI](https://cloud.google.com/cli?hl=en)
- [Auto-scaling in GCP](https://cloud.google.com/compute/docs/autoscaler)
- [Firewall Rules](https://cloud.google.com/firewall/docs/firewalls)
- [IAM Overview](https://cloud.google.com/iam/docs/overview)

---

## Authors



🚀 **Happy Cloud Computing!**
