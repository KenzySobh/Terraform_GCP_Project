# 🚀 AutoGCP – Simple GCP Project Creation via YAML  

## 🧩 Overview  
*AutoGCP* is a DevOps mini-project designed to simplify the creation of *Google Cloud Platform (GCP)* projects using *Terraform, **YAML, and **Python*.  

Instead of manually editing Terraform files every time you want a new GCP project, you can simply:
1. Define your project details in a YAML file.  
2. Run one command (./run.sh).  
3. AutoGCP handles everything — it reads your YAML, generates Terraform variables, and deploys your project automatically.  

This approach is modular, reusable, and easy to extend for new resources or configurations.  

---

## 🏗 Project Architecture  

```text
auto-gcp/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.json
├── .terraform.lock.hcl
├── .gitignore
│
├── modules/
│   ├── project/
│   ├── vpc/
│   ├── subnets/
│   ├── firewall/
│   ├── gke_cluster/
│   ├── iam_binding/
│   ├── service_account/
│   ├── storage/
│   ├── pubsub/
│   └── cloud_sql/
│
├── scripts/
│   ├── deploy.py
│   └── destroy.py
│
├── configs/
│   └── example-project.yaml
│
└── run.sh


---

## ⚙ Components Explained  

### 🧱 *Terraform Root Files*
| File | Description |
|------|--------------|
| *main.tf* | Connects and calls Terraform modules to create GCP resources. |
| *variables.tf* | Declares all variables needed by main.tf. |
| *outputs.tf* | Displays important resource information after deployment. |
| *terraform.tfvars.json* | Holds actual values (auto-generated from YAML). |
| *.terraform.lock.hcl* | Ensures consistent provider versions. |
| *.gitignore* | Prevents credentials and Terraform state files from being pushed to Git. |

---

### 📦 **Modules Folder (modules/)**
Each subfolder is an independent *Terraform module* that provisions one type of GCP resource.

| Module  ------>  Description |
|------------------------|
| *project/*  ------>  Creates the GCP project, links billing, enables APIs, and adds labels. |
| *vpc/*  ------>  Creates a Virtual Private Cloud (VPC) network. |
| *subnets/*  ------>  Adds one or more subnets to the VPC. |
| *firewall/*  ------>  Configures firewall rules to control network traffic. |
| *gke_cluster/*  ------>  Creates a Google Kubernetes Engine (GKE) cluster. |
| *iam_binding/*  ------> Assigns IAM roles to specific members. |
| *service_account/*  ------>  Creates a service account with a given name and display name. |
| *storage/*  ------>  Creates a Google Cloud Storage bucket. |
| *pubsub/*  ------>  Creates a Pub/Sub topic for messaging. |
| *cloud_sql/* ------> Creates a Cloud SQL database instance. |

Each module contains:
- main.tf → defines the resource  
- variables.tf → declares module inputs  
- outputs.tf → exports module outputs  

---

### 🐍 **Scripts Folder (scripts/)**

| File | Description |
|------|--------------|
| *deploy.py* | Reads a YAML config, converts it into terraform.tfvars.json, and runs terraform init + terraform apply. |
| *destroy.py* | Destroys all deployed infrastructure (uses terraform destroy). |

---

### ⚙ **Configs Folder (configs/)**

| File | Description |
|------|--------------|
| *example-project.yaml* | Example YAML file containing your GCP project configuration. |

#### Example:
yaml
project_id: "terraform-test-project-473708"
organization_id: "123456789012"
billing_account: "01949F-69D66D-E7B8F6"
credentials_file: "keys.json"
labels:
  owner: "intern"
  environment: "test"
apis:
  - compute.googleapis.com
  - iam.googleapis.com

---
### 🧠 *run.sh*
A bash script that automates the entire deployment process — authentication, running the deploy script, and applying Terraform.
#### Example:
bash
#!/bin/bash
set -e

echo "🚀 Starting Auto-GCP Deployment..."
gcloud auth application-default login
cd scripts
python3 deploy.py "../configs/example-project.yaml"
echo "✅ Deployment completed successfully!"


Run it with:
bash
chmod +x run.sh
./run.sh


---

## 🚀 How It Works (Step-by-Step)

1. *Define Configuration*  
   Edit configs/example-project.yaml to match your project details (IDs, billing, APIs, etc.).

2. *Authenticate to GCP*  
   Run:
   bash
   gcloud auth application-default login
   

3. *Deploy Project*  
   Use:
   bash
   ./run.sh
   
   This will:
   - Parse the YAML file  
   - Create terraform.tfvars.json  
   - Initialize Terraform  
   - Apply all modules to deploy your GCP project  

4. *View Outputs*  
   After deployment, Terraform will print outputs such as project ID and resource names.

5. *Destroy Infrastructure (Optional)*  
   To clean up resources:
   bash
   cd scripts
   python3 destroy.py
   

---

## 📚 Technologies Used

| Tool | Purpose |
|------|----------|
| *Google Cloud Platform (GCP)* | Cloud provider for all resources |
| *Terraform* | Infrastructure as Code (IaC) tool to define and manage resources |
| *Python* | Scripting language used to automate Terraform commands |
| *YAML* | Configuration file format for project details |
| *Git* | Version control to track changes |

---

## 🧩 Example Workflow

1. Edit example-project.yaml → put your project details.  
2. Run ./run.sh → deploys everything automatically.  
3. Check GCP Console → your project and resources will be created.  
4. Run python3 destroy.py → deletes everything when done.

---


## ✅ Final Deliverables

- Working *Terraform + Python + YAML* setup.  
- *10 Terraform modules* for modular infrastructure creation.  
- *Automation scripts* (deploy.py, destroy.py, run.sh).  
- *README.md* explaining how it works.  

---

## 🏁 Outcome

By completing AutoGCP, you’ve built a *mini Infrastructure-as-Code system* that:
- Automates GCP project creation.
- Uses YAML configs for flexibility.
- Demonstrates DevOps skills with Terraform, GCP, and automation scripting.  


Footer