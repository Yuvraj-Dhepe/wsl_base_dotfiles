#!$(which bash)

# Function to check if a command is installed
command_exists () {
    command -v "$1" &> /dev/null
}

# Update the system
{
echo "Checking for system updates..."
sudo apt-get update
sudo apt-get upgrade -y
#sudo apt full-upgrade -y
}

# Install wget if it is not already installed
{
if ! command_exists wget; then
    echo "wget not found. Installing..."
    sudo apt-get install -y wget
fi
}

# install the powerlevel10k theme properly.
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install github client and we are not stowing it.
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y


#installing vscode and we are not stowing it, but maybe we can in the future, however remember that our installation location of vscode is different so accordingly

 # we have to put the files or folders inside the code {package in .dotfiles} folder. So if I am not wrong we have to have some path like: .dotfiles/code/downloads/installed/vscode/{all the dotfiles and folders}
# To use Visual Studio Code with the Windows Subsystem for Linux, please install Visual Studio Code in Windows and uninstall the Linux version in WSL. You can then use the `code` command in a WSL terminal just as you would in a normal command prompt.
# if ! command -v code &> /dev/null; then
	
	# # Make a dir to install vscode
	# mkdir -p ~/downloads/installed/vscode

	# # Download the latest version of Miniconda for Linux
	# if [ ! -f ~/downloads/setups/vscode_amd64.deb ]; then
		# echo "-------------------------------------------"
		# echo "Code Setup Not Found Downloading..."
		# echo "-------------------------------------------"
		# wget -P ~/downloads/setups https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/downloads/setups/vscode_amd64.deb 
	# fi
	
	# # Install VsCode
	# sudo apt install ~/downloads/setups/vscode_amd64.deb 
	
	# # Reload the zshrc file.
    
	# zsh ~/.zshrc
	# zsh -i -c "omz reload"
	
# else
	# echo "-------------------------------------------"
	# echo "VsCode already has been installed"
	# echo "-------------------------------------------"
	# code --version
# fi


# Installing Quarto
if ! command -v quarto &> /dev/null; then

	# make a directory to install quarto
	mkdir -p ~/downloads/installed/quarto

	# download the latest version of quarto for Linux
	if [ ! -f ~/downloads/setups/quarto_1-2-335.deb ]; then
		echo "-------------------------------------------"
		echo "Quarto setup not found, downloading..."
		echo "-------------------------------------------"
		wget -O ~/downloads/setups/quarto_1-2-335.deb https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.335/quarto-1.2.335-linux-amd64.deb
	fi
	
	echo "-------------------------------------------"
	echo "Installing Quarto..."
	echo "-------------------------------------------"
	# install quarto
	sudo dpkg -i ~/downloads/setups/quarto_1-2-335.deb
	
	# reload the zshrc file
	zsh ~/.zshrc
	
	echo "-------------------------------------------"
	echo "Quarto Installed Successfully"
	echo "-------------------------------------------"
	quarto --version
	
	
	# reload oh-my-zsh
	zsh -i -c "omz reload"
	
else
	echo "-------------------------------------------"
	echo "Quarto has already been installed"
	echo "-------------------------------------------"
	quarto --version
fi


#p10k configure


echo "-------------------------------------------"
echo "After OMZ Reload is done, Run Conda Install Script by following command"
echo "zsh $HOME/.dotfiles/conda_install_script.sh"
echo "-------------------------------------------"

# Reloading the omz shell
zsh $HOME/.dotfiles/omz_reload.sh
