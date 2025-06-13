# Terraform 101
## Topics
### What is IaC?
### What is terraform and what it is used for?
### what is HCL ?
### Creating first terraform script. 
### basic commands
- terraform init
    It dowloads plugins and providers used by your code
    backend initialization (tfstate)
    aquiring locks
- terraform plan.  
    It creates differencial json file for the existing infra and infra in your code
    terraform plan -out=plan.json
- terraform apply
- terraform destroy



tf 
tfvars
.tmpl



tf. -- scripts (main.tf, ec2.tf providers.tf, variabls.tf)
tfvars --- variables values are stored in tfvars file

Stadard folder structure
How to declare variables? How to speficy variable values?
TF_VAR_<name of variable> and tfvars file


modules
ec2 instance creation using module














# Ansible 101

## What is ansible?  
automation tool and configuration management framework
## Inventory - 
The inventory specifies the list of remote servers, their IP addresses or hostnames, and any associated variables or groupings.
## Ansible Modules - 
fundamental building block for automation in Ansible. Modules are used within Ansible playbooks and ad-hoc commands to carry out actions such as configuring system settings, installing software packages, managing files, and more.
## Ad-Hoc Commands - 
Ad-hoc commands are useful for performing quick tasks, gathering information from remote hosts, or making small changes without creating and managing a playbook.
## Playbook - 
## handlers
## variables, templates and jinja2
## conditional tasks, loops, and tags
## roles and ansible-galaxy



