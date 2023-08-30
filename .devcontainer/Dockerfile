FROM mcr.microsoft.com/dotnet/sdk:7.0-jammy AS build

LABEL Author="Josh Byrnes"
LABEL Email="j.byrnes.github@gmail.com"
LABEL GitHub="https://github.com/j-byrnes/devcontainer-dotnetsdk-tf"
LABEL BaseImage="mcr.microsoft.com/dotnet/sdk:7.0-jammy"


RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && useradd -m agentuser

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    git \
    iputils-ping \
    jq \
    lsb-release \
    software-properties-common \
    nano \
    gnupg

RUN DEBIAN_FRONTEND=noninteractive wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

RUN DEBIAN_FRONTEND=noninteractive echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list


RUN DEBIAN_FRONTEND=noninteractive apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    terraform

RUN	curl -sL https://aka.ms/InstallAzureCLIDeb | bash

SHELL ["pwsh", "-command"]

RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
RUN Install-Module -Name Az -AllowClobber -Force -Scope AllUsers
RUN Install-Module -Name Microsoft.Graph -AllowClobber -Force -Scope AllUsers

RUN mkdir -p /home/.config/powershell

COPY ./extras/profile.ps1 /home/agentuser/.config/powershell/profile.ps1

USER agentuser
WORKDIR /home/agentuser

ENTRYPOINT [ "pwsh", "-nologo"]