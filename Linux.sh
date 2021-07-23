# Download and Insatall packer
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install packer

# Checnk if Packer is installed
packer --version

# Create a directory
mkdir packer

# Go into the directory
cd packer

# Create a packer file
vim ubuntu.pkr.hcl

# Add your credential
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=

# Initialize Packer 
packer init .

# Format Packer file
packer fmt .

# Check for errors
packer validate .

# Build the image
packer build ubuntu.pkr.hcl


# Download and install Terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# Check if Terraform is installed
terraform version

# Make a directory
mkdir terraform-project

# Create Terraform file
vim main.tf
