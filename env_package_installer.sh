#!(which bash)

# Check the version of Pip
echo "-------------------------------------------"
echo "checking version of installed pip"
echo "-------------------------------------------"
conda list pip

# install packages from a requirements file into the fastai environment
echo "-------------------------------------------"
echo "installing packages in the fastai environment..."
echo "-------------------------------------------"

read -p "Give path to the requirements.txt file: ex. ~/pip_install.txt " path

#echo $path

pip install -r $path

# uninstall packages from a requirements file out of the fastai environment
#pip uninstall -r /path/to/uninstall_file.txt

# deactivate the fastai environment
echo "-------------------------------------------"
echo "packages in environment are as follows: "
echo "-------------------------------------------"
conda list
