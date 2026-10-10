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

---

## Deployment Audit Trail (Command History)

Below is the complete terminal history documenting the Azure CLI authentication, Terraform initialization, provider troubleshooting, and Git repository management steps used during this deployment.

```bash
Bobby@HENRYDESKTOP MINGW64 ~/Desktop/Gimbus-infra/terraform (main)
$ history
    1  az login
    2  az login
    3  az login
    4  az login --tenant 45d8257f-8ed3-4a5e-ba32-ebb5efbadf9f
    5  az account show
    6  az --verison
    7  az --version
    8  cd terraform/
    9  terraform init
   10  terraform validate
   11  terraform plan
   12  terraform apply
   13  terraform destory
   14  terraform destroy
   15  touch AKS.tf ACR.tf
   16  touch storage.tf Keyvault.tf
   17  touch backend.tf
   18  az storage account list --resource-group terraform-backend-dev --query "[].name" --output tsv
   19  touch rbac.tf
   20  touch variables.tf
   21  terraform init -upgrade
   22  touch output.tf
   23  az login
   24  terraform init
   25  terraform init
   26  terraform validate
   27  touch local.tf
   28  terraform fmt
   29  terraform init -upgrade
   30  terraform init -upgrade
   31  az vm list-skus --location northcentralus --size Standard_B2 --output table
   32  az account show
   33  terraform fmt
   34  terraform validate
   35  terraform init -reconfigure
   36  terraform validate
   37  terraform validate
   38  terraform validate
   39  terraform plan
   40  terraform validate
   41  terraform plan
   42  terraform validate
   43* 
   44  terraform apply
   45  terraform validate
   46  terraform apply
   47  az provider register --namespace Microsoft.ContainerRegistry
   48  az provider show -n Microsoft.ContainerRegistry
   49  az provider register --namespace Microsoft.ContainerService
   50  az provider show -n Microsoft.ContainerService
   51  terraform apply
   52  terraform init
   53  terraform init
   54  terraform init
   55  terraform apply
   56  terraform destroy
   57  terraform state push errored.tfstate
   58  az group delete --name gimbus-rg --yes --no-wait
   59  git init
   60  git add .
   61  git commit -m "Initial Azure Terraform deployment"
   62  git branch -M main
   63  git remote add origin [https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git](https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git)
   64  git push -u origin main
   65  git rm -r --cached .
   66  git add .
   67  git commit -m "Apply gitignore to remove large provider files"
   68  rm -rf .git
   69  git init
   70  git add .
   71  git commit -m "Initial Azure Terraform deployment"
   72  git branch -M main
   73  git remote add origin [https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git](https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git)
   74  git push -u origin main
   75  rm -rf .git
   76  git init
   77  git add .
   78  git commit -m "Initial Azure Terraform deployment"
   79  git branch -M main
   80  git remote add origin [https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git](https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git)
   81  git push -u origin main
   82  rm -rf .git
   83  git init
   84  git add .
   85  git status
   86  git commit -m "Initial Azure Terraform deployment"
   87  git branch -M main
   88  git remote add origin [https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git](https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git)
   89  git push -u origin main
   90  echo ".terraform/" > .gitignore
   91  echo "*.tfstate" >> .gitignore
   92  echo "*.tfstate.backup" >> .gitignore
   93  echo "errored.tfstate" >> .gitignore
   94  rm -rf .git
   95  git init
   96  git add .
   97  git commit -m "Initial Azure Terraform deployment"
   98  git branch -M main
   99  git remote add origin [https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git](https://github.com/cool129/Terraform-Infrastructure-as-Code-IaC-.git)
  100  git push -u origin main
  101  git add README.md
  102  git commit -m "Add README file"
  103  git push
  104  git add screenshots/
  105  git commit -m "Add presentation screenshots"
  106  git push
  107  git add .
  108  git commit -m "Add README and screenshots"
  109  git push
  110  mv ../read.md ./README.md
  111  mv ../screenshots ./
  112  git add .
  113  git commit -m "Add README and screenshots"
  114  git push
