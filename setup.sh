#!/bin/bash

set -x
sudo apt install byobu gnupg2 -y

#if grep -Fxq "dot-bash" ~/.bashrc
if grep -E ".dot-bash$" ~/.bashrc
then
	echo "it is found"
    cp dot-bashrc ~/.dot-bash
else
	echo "it is not found"
    cp dot-bashrc ~/.dot-bash
    echo -e "\n. \$HOME/.dot-bash" >> ~/.bashrc
fi

update-alternatives --set editor /usr/bin/vim.basic
source ~/.bashrc
cp dot-vim ~/.vimrc
cp gitconfig ~/.gitconfig
cp byobu-status ~/.byobu/status
cp byobu-datetime.tmux ~/.byobu/datetime.tmux
