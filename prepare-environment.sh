#!/bin/bash

swapoff -a;
echo "================== DOWNLOAD LOCATION ===================";
# cd /home/vagrant
# mkdir tmp
# cd tmp/ 

echo "================== UPGRADE SYSTEM ===================";
sudo apt-get update -y;

echo "================== INSTALL DEPENDENCIES ===================";
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common;

echo "================== DOWNLOAD AND VERIFICATION KEY ===================";
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88;

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";

echo "================== UPGRADE SYSTEM AND INSTALL DOCKER ===================";
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io;

echo "================== PERMISSION FOR $USER TO EXECUTE DOCKER ===================";
sudo groupadd docker
sudo gpasswd -a $USER docker
#sudo usermod -aG docker $USER;
sudo service docker restart

echo "================== INSTALL PYTHON 3.8 ===================";
sudo apt install python3.8 -y
python3.8 --version

echo "================== INSTALL JAVA ===================";
sudo apt install openjdk-11-jdk -y

echo "================== INSTALL MAVEN ===================";
curl -O "https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz"
sudo tar xzvf apache-maven-3.6.3-bin.tar.gz -C /opt

echo "================== ENVIRONMENT VARIABLES JAVA AND MAVEN ===================";
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
MAVEN_HOME="/opt/apache-maven-3.6.3"
cat <<EOF | >> ~/.profile
if [ -d "$JAVA_HOME/bin" ] ; then
    PATH="$PATH:$JAVA_HOME/bin"
fi
if [ -d "$MAVEN_HOME/bin" ] ; then
    PATH="$PATH:$MAVEN_HOME/bin"
fi
EOF
source ~/.profile

echo "================== TEST JAVA AND MAVEN ===================";
echo $JAVA_HOME
mvn -v

echo "================== Jetbrains ===================";
sudo snap install pycharm-community --classic

echo "================== INSTALL INTELLIJ EDITOR ===================";
sudo snap install intellij-idea-community –classic

echo "================== INSTALL MONGODB COMPASS ===================";
wget https://downloads.mongodb.com/compass/mongodb-compass_1.25.0_amd64.deb
sudo dpkg -i mongodb-compass_1.25.0_amd64.deb

echo "================== INSTALL PIP3 AND DATABRICKS-CLI ===================";
sudo apt-get -y install python3-pip -y
pip3 --version
pip3 install databricks-cli
#Save databricks-cli installation path at your environment variables.

echo "================== INSTALL GOLANG ===================";
wget https://golang.org/dl/go1.16.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
 
echo "================== INSTALL ZOOM ===================";
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb

echo "================== INSTALL AZURE STORAGE EXPLORER ===================";
sudo apt update
sudo apt install snapd
sudo snap install storage-explorer

# echo "================== INSTALL TERRAFORM ===================";
# curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
# sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
# sudo apt-get update -y && sudo apt-get install terraform -y

echo "================== INSTALL HOMEBREW ===================";
echo "You need to press 'enter' for the installation to continue"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

echo "================== INSTALL TFENV ===================";
brew install tfenv

echo "================== INSTALL TERRAGRUNT ===================";
brew install terragrunt

echo "================== TERRAFORM-DOCKER INTEGRATION ===================";
ssh-keyscan -t rsa vs-ssh.visualstudio.com >> ~/.ssh/known_hosts

echo "================== INSTALL GIT ===================";
sudo apt install git -y
sudo apt --fix-broken install -y

echo "================== CONFIGURE GIT - MANUAL ===================";
echo "git config --global user.name '<your name>'"
echo "git config --global user.email '<your@email>'"
##command to git to use visual studio code as default editor
echo "git config --global core.editor 'code --wait'"
##command to git to use rebase as default merge strategy
echo "git config --global pull.rebase true"

echo "================== INSTALL SLACK - MANUAL ===================";
# Download image .deb - https://slack.com/intl/pt-br/downloads/linux
# Install sudo apt install ./slack-desktop-4.23.0-amd64.deb
# Example download name - slack-desktop-4.23.0-amd64.deb
echo "Download image .deb - https://slack.com/intl/pt-br/downloads/linux"
echo "Install - sudo apt install ./slack-desktop-4.23.0-amd64.deb"
echo "Example download name - slack-desktop-4.23.0-amd64.deb"

echo "================== INSTALL VSCODE - MANUAL ===================";
echo "How to - https://code.visualstudio.com/docs/setup/linux"
echo "Download image .deb - https://code.visualstudio.com/download"
echo "Install - sudo apt install ./code_1.63.2-1639562499_amd64.deb"
echo "Example download name - code_1.63.2-1639562499_amd64.deb"