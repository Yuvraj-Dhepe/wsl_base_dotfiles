#!/bin/bash

# Prompt the user for a yes or no answer
read -p "Are you in Base environment ? [y/n]: " response

# Check if the response is "y" or "Y" (yes)
if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
    echo "Continuing with environment installation"
	
	# Update the base conda
	echo "-------------------------------------------"
	echo "Updating all the packages in the base conda environment."
	echo "-------------------------------------------"
	conda update --all

	# Version of Conda
	echo "-------------------------------------------"
	echo "Conda Installed successfully with version: "
	echo "-------------------------------------------"
	conda --version

	# Current environments in conda
	echo "-------------------------------------------"
	echo "Conda environments list"
	echo "-------------------------------------------"
	conda env list

	read -p "Give Name of Environment to install: " name
	
	# Creation of Conda environment and installing programs via pip.

	# Create a new Conda environment named by the user
	echo "-------------------------------------------"
	echo "Creating Conda environment" $name
	echo "-------------------------------------------"
	conda create -y -n $name pip==23.0.1
	
	echo "-------------------------------------------"
	echo $name "has been installed successfully, run the env_package_installer file by giving address of pips requirements.txt file."
	echo "sh $HOME/.dotfiles/env_package_installer.sh"
	echo "-------------------------------------------"

	echo "-------------------------------------------"
	echo "Don't Forget to activate" $name "environment before running the env_package_installer file"
	echo "-------------------------------------------"


else
    echo "Activate the base environment and rerun the script"
    exit 1
fi


