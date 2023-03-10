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
