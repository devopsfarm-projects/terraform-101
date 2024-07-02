Check if terraform is installed

`terraform --version`

> if not checkout https://developer.hashicorp.com/terraform/install?product_intent=terraform

to know which os distro of linux you are running  `cat /etc/os-release`

```bash
 terraform --version
Terraform v1.9.0
on linux_amd64
```


install on ubunut
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

install aws cli
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```



init   -- initialized the workspace  
    download the required providers
    download modules which is being used in code
    define the backend
    ...
validate:
    checks if the configuration is valid or not.

plan
    shows the state of infrastructre and the code
    shows what already is created, what will be created , what will update, what will delete.

apply 
    Syncs code with the infrastructre
        e.g if you update name of SG in code, apply will change the name of SG in AWS.

destroy
    this will destroy the infrastructure


Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  metadata      Metadata related commands
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Execute integration tests for Terraform modules
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management






Files extension Terraform looks for in current directory

.tf
.tfvars