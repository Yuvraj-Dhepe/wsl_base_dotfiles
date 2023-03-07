# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. /home/yuvidh/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA nixpkgs.antibody
nix-env -iA nixpkgs.neovim
nix-env -iA nixpkgs.tmux
nix-env -iA nixpkgs.yarn
nix-env -iA nixpkgs.ripgrep
nix-env -iA nixpkgs.bat
nix-env -iA nixpkgs.direnv
nix-env -iA nixpkgs.zsh
nix-env -iA nixpkgs.git

# stow 
stow git
stow zsh
stow nvim

#Adding few 
# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# Use Zsh as your default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

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


# aliases
alias ls="ls -la"

# Use Nix
if [ -e /home/yuvidh/.nix-profile/etc/profile.d/nix.sh ]; then . /home/yuvidh/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Supress message
#POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' | cat - ~/.zshrc > temp && mv temp ~/.zshrc

# install omz shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc 
 
