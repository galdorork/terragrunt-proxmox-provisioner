FROM ubuntu

#Install Deps
RUN apt update
RUN apt install -y jq unzip wget

#Install Terraform
RUN wget https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
RUN unzip terraform_1.0.0_linux_amd64.zip -d /usr/local/bin/
RUN chmod +x /usr/local/bin/terraform

#Install Terragrunt
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.30.3/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt
