FROM golang

#Install Deps
RUN apt update
RUN apt install -y jq unzip

#Install Terraform
RUN wget https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip 
RUN unzip terraform_0.13.4_linux_amd64.zip -d /usr/local/bin/
RUN chmod +x /usr/local/bin/terraform

#Install Terragrunt
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.25.4/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt

# Proxmox Module Install
RUN GO111MODULE=on go get -v github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provider-proxmox
RUN GO111MODULE=on go get -v github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provisioner-proxmox
RUN GO111MODULE=on go install -v github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provider-proxmox
RUN GO111MODULE=on go install -v github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provisioner-proxmox
RUN cp $GOPATH/bin/terraform-provider-proxmox /usr/local/bin/
RUN cp $GOPATH/bin/terraform-provisioner-proxmox /usr/local/bin/