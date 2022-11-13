#!/bin/bash

set -x

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

cp dot-vim ~/.vimrc
source ~/.bashrc

# setup ansible
sudo apt install python3-pip -y
pip3 install ansible
ansible-playbook -i inventory.ini playbook.yml

cp gitconfig ~/.gitconfig
mkdir ~/.byobu
cp byobu-status ~/.byobu/status
cp byobu-datetime.tmux ~/.byobu/datetime.tmux

