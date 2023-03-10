# $(which zsh)

conda install anaconda-clean -y

anaconda-clean --yes

rm -rf ~/downloads/installed/miniconda3

zsh $HOME/.zshrc

$(which zsh) -i -c "omz reload"




