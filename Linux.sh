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


packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "packer-image"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}
