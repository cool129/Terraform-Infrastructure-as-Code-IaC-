# Azure Infrastructure Deployment with Terraform

## Project Overview

This project uses Terraform to automatically build and manage a secure cloud environment in Microsoft Azure. The code provisions a foundational setup for hosting and managing containerized applications.

## What I Did

* **Created Modular Terraform Files:** Wrote and organized configuration files (like `AKS.tf`, `ACR.tf`, and `Keyvault.tf`) to separate the build instructions for each piece of cloud equipment.

* **Deployed Core Resources:** Ran `terraform apply` to successfully build the following resources inside the `gimbus-rg` resource group in the `northcentralus` region.
  
  ![Resource Group Overview](screenshots/Screenshot%202026-10-10%20030921.png)

  * **Azure Kubernetes Cluster (AKS):** The engine to run the applications (`gimbus-aks`).
    ![AKS Cluster Overview](screenshots/Screenshot%202026-10-10%20030949.png)
    
    *(Also generated the managed resource group for the AKS cluster nodes shown below)*
    ![AKS Managed Resource Group](screenshots/Screenshot%202026-10-10%20025641.png)

  * **Azure Container Registry (ACR):** A private app store for container images (`gimbusacr`).
    ![ACR Overview](screenshots/Screenshot%202026-10-10%20031326.png)

  * **Azure Key Vault:** A secure safe for managing system secrets and passwords (`gimbus-kv`).
    ![Key Vault List](screenshots/Screenshot%202026-10-10%20030728.png)
    ![Key Vault Overview](screenshots/Screenshot%202026-10-10%20030742.png)
    ![Key Vault Detail](screenshots/Screenshot%202026-10-10%20031518.png)

  * **Azure Storage Account:** A cloud drive to hold the system's memory file (`gimbussae3lsu`).
    ![Storage Account Overview](screenshots/Screenshot%202026-10-10%20031429.png)

* **Applied Tags:** Ensured all resources were properly tagged for tracking and billing purposes.
  ![Resource Tags](screenshots/Screenshot%202026-10-10%20030356.png)

* **Configured Remote State:** Moved Terraform's memory tracking (`.tfstate`) from my local computer to an Azure Storage container to keep the tracking data secure and centralized.

* **Cleaned Up Infrastructure:** Executed `terraform destroy` at the end of the project to delete the cloud resources and ensure no unnecessary Azure costs were incurred, leaving only an empty resource group.
  ![Cleaned Up Resources](screenshots/Screenshot%202026-10-10%20032605.png)

---

## Errors Encountered & How I Fixed Them

### Error 1: Multi-Factor Authentication (MFA) Login Failure

* **The Issue:** The Azure CLI could not log into my account due to an MFA conflict with my specific tenant and subscription ID.
* **The Fix:** I re-authenticated the Azure command-line tool explicitly targeting my correct Azure tenant ID to establish a secure session.

### Error 2: Backend Storage "404 ResourceGroupNotFound"

* **The Issue:** Terraform tried to save its memory file to the cloud, but the storage folder it was looking for didn't exist yet, causing a 404 error during initialization.
* **The Fix:** I manually created the backend resource group (`terraform-backend-dev`), the storage account, and the `tfstate` container using the Azure CLI first. Then, I ran `terraform init` to successfully connect and migrate the local state to the remote cloud drive.

### Error 3: Code Syntax & Provider Version Conflicts

* **The Issue:** The Terraform code I used was from an older tutorial and conflicted with the newer Azure builder tool (AzureRM provider version 5.8.0). It threw errors about missing quotes and missing required settings like `node_provisioning_profile` in the AKS file.
* **The Fix:** I updated the `AKS.tf` code by adding the missing quotes around the `identity` block and adding the required `node_provisioning_profile = "Manual"` setting. To clean up the old tool versions, I deleted the hidden `.terraform.lock.hcl` file and ran `terraform init -upgrade` to sync my environment with the correct, updated tools.

### Error 4: State File Errors During Teardown

* **The Issue:** When trying to delete the environment, Terraform got confused because the storage account holding its memory file was being deleted at the wrong time, causing state tracking errors.
* **The Fix:** I resolved the state file dependency errors to allow `terraform destroy` to proceed, successfully wiping the cloud resources and ensuring the empty `gimbus-rg` incurred zero costs.
```eof

The image codes (like `![alt text](link)`) are now perfectly embedded right under each section they belong to! Since I swapped the spaces for `%20`, they should instantly display the pictures on your GitHub or code viewer.
