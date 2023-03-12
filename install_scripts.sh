#!(which bash)

# Update the system

echo "Checking for system updates..."
sudo apt-get update
sudo apt-get upgrade -y
#sudo apt full-upgrade -y


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

nix-env -iA nixpkgs.antibody
nix-env -iA nixpkgs.neovim
nix-env -iA nixpkgs.tmux
nix-env -iA nixpkgs.yarn
nix-env -iA nixpkgs.ripgrep
nix-env -iA nixpkgs.bat
nix-env -iA nixpkgs.direnv
nix-env -iA nixpkgs.zsh
nix-env -iA nixpkgs.gcc
nix-env -iA nixpkgs.stow
nix-env -iA nixpkgs.fzf
nix-env -iA nixpkgs.git
nix-env -iA nixpkgs.gnumake


# stow 
#stow git
stow zsh
stow nvim
stow p10k
#stow vscode

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# Use Zsh as your default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins

antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh


# install neovim plugins

nvim --headless +PlugInstall +qall


# reformat the zshrc file with necessary inputs.

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

# Use Nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Supress message
#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' | cat - ~/.zshrc > temp && mv temp ~/.zshrc

echo "-------------------------------------------"
echo "Run the other_imp package script via after omz is installed after opening a new session "
echo "sh $HOME/.dotfiles/other_imp_packages.sh"
echo "-------------------------------------------"

# install omz shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc 

# Export ZSH_THEME variable not required as we are already copying it. we just need to simply have it's folder.
# echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

# Reload the zsh configuration
zsh ~/.zshrc

# Running p10k and gh client downloader script
sh $HOME/.dotfiles/other_imp_packages.sh
