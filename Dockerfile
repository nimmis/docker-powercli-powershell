From nimmis/powershell

RUN yum update -y && \
    pwsh -Command "Install-Module VMware.PowerCLI -Force" && \
    yum clean all

