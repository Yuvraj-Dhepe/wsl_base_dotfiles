#/bin/bash

# install nix
curl -L https://nixos.org/nix/install | sh

# Making necessary folders for installation
mkdir -p $HOME/downloads/installed
mkdir -p $HOME/downloads/setups
mkdir -p $HOME/side_projects/
mkdir -p $HOME/MSc_Life/Sem_one
mkdir -p $HOME/MSc_Life/Sem_one
mkdir -p $HOME/MSc_Life/Sem_two
mkdir -p $HOME/MSc_Life/Sem_three
mkdir -p $HOME/MSc_Life/Sem_four

# source nix
. $HOME/.nix-profile/etc/profile.d/nix.sh

# install packages via nix package manager
{
nix-env -iA nixpkgs.antibody
nix-env -iA nixpkgs.neovim
nix-env -iA nixpkgs.tmux
nix-env -iA nixpkgs.yarn
nix-env -iA nixpkgs.ripgrep
nix-env -iA nixpkgs.bat
nix-env -iA nixpkgs.direnv
nix-env -iA nixpkgs.zsh
nix-env -iA nixpkgs.git
}

# stow 
stow git
stow zsh
stow nvim
#stow vscode

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# Use Zsh as your default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
{
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
}

# reformat the zshrc file with necessary inputs.
{
echo '# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Theme setup
ZSH_THEME="powerlevel10k/powerlevel10k"

# source plugins
source ~/.zsh_plugins.sh


# aliases
alias ls="ls -la"

# Use Nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Supress message
#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' | cat - ~/.zshrc > temp && mv temp ~/.zshrc
}

# install omz shell
{
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc 
}

# install github client and we are not stowing it.
{
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
}

#installing vscode and we are not stowing it, but maybe we can in the future, however remember that our installation location of vscode is different so accordingly
# we have to put the files or folders inside the code {package in .dotfiles} folder. So if I am not wrong we have to have some path like: .dotfiles/code/downloads/installed/vscode/{all the dotfiles and folders}
if ! command -v code &> /dev/null; then
	
	# Make a dir to install vscode
	mkdir -p ~/downloads/installed/vscode
	
	# Download Vs Code 
    wget -P ~/downloads/setups https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O vscode_amd64.deb
    
	# Install VsCode
	sudo dpkg -i ~/downloads/setups/vscode_amd64.deb -R $HOME/downloads/installed/vscode
	
	# Reload the zshrc file.
    omz reload
	source ~/.zshrc
fi

# Installing files from the conda script
zsh $HOME/.dotfiles/conda_install.sh