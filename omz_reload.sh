#!/bin/bash

#This will reload the Oh My Zsh configuration in the current shell session and allow the script to continue execution immediately after.
#conda init zsh
echo "-------------------------------------------"
echo "OMZ reload closes the current session, so omz reload has to be always run at end."
echo "-------------------------------------------"

source ~/.zshrc
$(which zsh) -i -c "omz reload"
