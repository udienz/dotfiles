#!/bin/bash

set -x
#if grep -Fxq "dot-bash" ~/.bashrc
if grep -E "^\. dot-bash$" ~/.bashrc
then
	echo "it is found"
else
	echo "it is not found"
    cp dot-bashrc ~/.dot-bash
    echo -e "\n. dot-bash" >> ~/.bashrc
    source ~/.bashrc
fi

cp dot-vim ~/.vimrc
