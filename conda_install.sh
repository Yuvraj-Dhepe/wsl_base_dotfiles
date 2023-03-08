#$HOME/.nix-profile/bin/zsh

# Function to check if a command is installed
command_exists () {
    command -v "$1" &> /dev/null
}

# Update the system
{
echo "Checking for system updates..."
sudo apt-get update
sudo apt-get upgrade -y
}

# Install wget if it is not already installed
if ! command_exists wget; then
    echo "wget not found. Installing..."
    sudo apt-get install -y wget
fi

# Install conda if it is not already installed
if ! command_exists conda; then
    echo "conda not found. Installing..."
    # Download the latest version of Miniconda for Linux
    wget -P ~/downloads/setups https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda3-X86_64.sh

    # Run the installation script
	bash ~/downloads/Miniconda3-X86_64.sh -b -p $HOME/downloads/installed/miniconda

    # Add Conda to the PATH
    conda init zsh
	#or	
	#echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.zshrc

	# Refresh the shell and omz
    omz reload
	source ~/.zshrc
	

    # Verify the installation by printing the Conda version
    conda --version
	
	# This can also be used.
	#echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.zshrc
    #source ~/.zshrc
    #conda init zsh
else
    echo "conda already installed"
	conda --version
fi

# Creation of Conda environment and installing programs via pip.
{
# Create a new Conda environment named fastai
echo "Creating Conda environment fastai..."
conda create -y -n fastai

# Install pip in the fastai environment
echo "Installing pip in the fastai environment..."
conda activate fastai
conda install -y pip

# Pip Installed successfully
conda list pip

# Install packages from a requirements file into the fastai environment
echo "Installing packages in the fastai environment..."
pip install -r ~/side_projects/portable_env/pip_install_requirements.txt

# Uninstall packages from a requirements file out of the fastai environment
#pip uninstall -r /path/to/uninstall_file.txt

# Deactivate the fastai environment
echo "Deactivating Conda environment fastai..."
conda deactivate
}

# Install Quarto
if ! command_exists quarto; then
    echo "Quarto not found. Installing..."
	
	# Make a dir to install Quarto
	mkdir -p ~/downloads/installed/quarto
	
    # Download the latest version of quarto for Linux
    wget -P ~/downloads/setups https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.335/quarto-1.2.335-linux-amd64.deb -O quarto_1.2.335-linuxamd64.deb

    # Run the installation script
    sudo dpkg -i ~/downloads/setups/quarto_1.2.335-linuxamd64.deb -R $HOME/downloads/installed/quarto

    # Verify the installation by printing the Quarto version
    quarto --version
else
    echo "Quarto already installed"
fi



