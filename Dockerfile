FROM alpine

#Install Deps
RUN apk update && \
    apk add jq unzip wget

#Install Terraform
RUN wget https://releases.hashicorp.com/terraform/1.2.0/terraform_1.2.0_linux_amd64.zip
RUN unzip terraform_1.2.0_linux_amd64.zip -d /usr/local/bin/
RUN chmod +x /usr/local/bin/terraform

#Install Terragrunt
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.37.1/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt
