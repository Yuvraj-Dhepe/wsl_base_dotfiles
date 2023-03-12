#!$(which zsh)

#read -p "Are you running script via zsh? [y/n]: " cn


#if [ "$cn" = "y" ] || [ "$cn" = "Y" ]; then
	
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

# Install conda if it is not already installedW
{
if ! command_exists conda; then

	# Download the latest version of Miniconda for Linux
	if [ ! -f ~/downloads/setups/Miniconda3-X86_64.sh ]; then
		echo "-------------------------------------------"
		echo "conda not found. Downloading..."
		echo "-------------------------------------------"
		wget -P ~/downloads/setups https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/downloads/setups/Miniconda3-X86_64.sh
	fi
	
	echo "-------------------------------------------"
	echo "Installing Conda...(set the install location to ~/downloads/installed/miniconda3)"
	echo "-------------------------------------------"
	# Run the installation script and set the install location to ~/downloads/installed/miniconda3
	bash ~/downloads/setups/Miniconda3-X86_64.sh

	echo "-------------------------------------------"
	echo "Initializing the conda environment, press yes only..."
	echo "-------------------------------------------"
	eval "$($HOME/downloads/installed/miniconda3/bin/conda shell.zsh hook)"
	conda init
	
	#echo "Initializing the conda environment, Refreshing the omz shell, .zshrc file and activating the base environment."	
	echo "-------------------------------------------"
	echo "OMZ reload"
	echo "-------------------------------------------"
	
	echo "-------------------------------------------"
	echo "Conda Installed successfully with version: "
	echo "-------------------------------------------"
	conda --version
	
	echo "-------------------------------------------"
	echo "Conda Env's "
	echo "-------------------------------------------"
	conda env list
	
	# nohup bash $HOME/side_projects/omz_reload.sh > /dev/null 2>&1 &
	#zsh $HOME/.zshrc
	
	#bash $HOME/side_projects/omz_reload.sh 
	#> /dev/null 2>&1 &
	# The nohup command is used to run the script in the background and the > /dev/null 2>&1 & redirects all the output to the null device and detaches the script from the terminal so that your current script execution doesn't stop.
	
		
	echo "-------------------------------------------"
	echo "Install an env with following command"
	echo "sh $HOME/.dotfiles/conda_env_create.sh"
	echo "-------------------------------------------"
	
	
	
	zsh $HOME/.zshrc
	$(which zsh) -i -c "omz reload"
	

			
	# echo "-------------------------------------------"
	# echo "Activating the base environment."
	# echo "-------------------------------------------"
	# conda activate base

	
	# echo "-------------------------------------------"
	# echo "Refresh .zshrc file"
	# echo "-------------------------------------------"	
	# zsh $HOME/.zshrc
	
	
	# # # This can also be used instead of conda init.
	# # #echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.zshrc
	
else
	echo "-------------------------------------------"
	echo "conda already installed"
	echo "-------------------------------------------"
	conda --version
	
	echo "-------------------------------------------"
	echo "Install an env with following command"
	echo "sh $HOME/.dotfiles/conda_env_create.sh"
	echo "-------------------------------------------"
fi
}

# else
    # echo "Run script with zsh conda_install_script.sh"
    # exit 1
# fi
