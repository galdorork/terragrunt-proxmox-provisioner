FROM alpine

#Install Deps
RUN apk add --no-cache jq terraform unzip wget

#Install Terragrunt
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.37.1/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt
