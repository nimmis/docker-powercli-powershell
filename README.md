# Microsoft powershell core with Azure extension on Centos 7

This repository contains a set of PowerShell cmdlets for developers and administrators to develop, deploy and manage Microsoft Azure applications.

## Running powershell interactively

The docker container can be run interactively as a pwsh command

    $docker run -ti nimmis/powershell
    PowerShell 6.1.0
    Copyright (c) Microsoft Corporation. All rights reserved.

    https://aka.ms/pscore6-docs
    Type 'help' to get help.

    Custom PowerShell Environment Loaded
    PS /data/scripts> $PSVersionTable.PSVersion

    Major  Minor  Patch  PreReleaseLabel BuildLabel
    -----  -----  -----  --------------- ----------
    6      1      0                      


    PS /data/scripts>

Exit this container leaves a stopped container on the machine

    $ docker ps -a
    CONTAINER ID        IMAGE               COMMAND                   CREATED             STATUS                          PORTS               NAMES
    55a5362b7658        nimmis/powershell   "/bin/sh -c \"/usr/bi…"   2 minutes ago       Exited (0) About a minute ago                       admiring_kirch

so add the parameter **--rm** to the command to remove the container when it is stoped

    $docker run -ti --rm nimmis/powershell

## accessing local storage inside the container

The default path when starting powershell is /data/scripts and this can be rerouted to a local directory by adding the
command **-v &lt;local path>:/data/scripts**

Like

    $ls 
    deploy_stack.ps1	get-usage.ps1
    
    $docker run --rm -it -v /home/nimmis:/data/scripts
    PowerShell 6.1.0
    Copyright (c) Microsoft Corporation. All rights reserved.

    https://aka.ms/pscore6-docs
    Type 'help' to get help.

    Custom PowerShell Environment Loaded
    PS /data/scripts> ls
    deploy_stack.ps1  get-usage.ps1
    PS /data/scripts> 

## adding autoloadable libraries

The container path /data/modules is scanned for *.ps1 and loaded at startup

To map a local library directory add the parameter **-v &lt;local path>:/data/modules**

## Information about azure commands

- Get-Help Azure to get all of the Azure PowerShell cmdlets.
- Get-Help AzureRM to get all of the Azure Resource Manager (ARM) cmdlets.
- Get-Help &lt;cmdlet name> to get the details of a specific cmdlet.