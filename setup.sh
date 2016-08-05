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

source ~/.bashrc
cp dot-vim ~/.vimrc
cp gitconfig ~/.gitconfig
