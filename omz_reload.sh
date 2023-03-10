#!/bin/bash

#This will reload the Oh My Zsh configuration in the current shell session and allow the script to continue execution immediately after.
conda init zsh
source ~/.zshrc
$(which zsh) -i -c "omz reload"
