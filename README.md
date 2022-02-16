# Prepare environment 

## Script to automate the installation of features on the machine.  

Table of contents
=================
<!--ts-->
   * [Resources](#Resources)
   * [How-To](#How-To)
   * [Manual-Settings](#Manual-Settings)
<!--te-->  

### Resources
- Docker

- Python 3.8

- Java

- Maven

- Jetbrains (java editor)

- Intellij editor

- Pip3

- Git

- Vscode

- Mongodb Compass

- Databricks-cli

- Terraform

- Homebrew

- Terragrunt

- GoLang

- Zoom

- Slack

- Azure Storage Explorer

### How-To

#### Permission to run script:
```
chmod +x prepare-environment.sh
```

#### [Optional] Configure download location in "DOWNLOAD LOCATION"
Example:
```
cd /home/vagrant
mkdir tmp
cd tmp/ 
```

#### In INSTALL HOMEBREW
It's necessary to press 'enter' for the installation to continue.  


### Manual-Settings

#### Configure Git

```
git config --global user.name '<your name>'
git config --global user.email '<your@email>'
git config --global core.editor 'code --wait'
git config --global pull.rebase true
```

#### Install Slack

Download image .deb - https://slack.com/intl/pt-br/downloads/linux  
Example download name - slack-desktop-4.23.0-amd64.deb
```
sudo apt install ./slack-desktop-4.23.0-amd64.deb
```

#### Install Visual Code

How to - https://code.visualstudio.com/docs/setup/linux  
Download image .deb - https://code.visualstudio.com/download  
Example download name - code_1.63.2-1639562499_amd64.deb
```
sudo apt install ./code_1.63.2-1639562499_amd64.deb
```
