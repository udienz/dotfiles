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
PATH=$HOME/.local/bin:$PATH
sudo apt install python3 -y

# Newer Debian/Ubuntu (PEP 668) mark system Python as "externally managed"
# and pip refuses to install; detect via the marker file, not the OS version.
if python3 -c 'import os,sys,sysconfig; sys.exit(0 if os.path.exists(os.path.join(sysconfig.get_path("stdlib"),"EXTERNALLY-MANAGED")) else 1)'
then
    echo "Python is externally managed, using pipx/apt"
    if sudo apt install pipx -y
    then
        pipx install --include-deps ansible || pipx upgrade ansible
    else
        # pipx not packaged (older release): fall back to distro ansible
        sudo apt install ansible -y
    fi
else
    echo "pip is usable, using pip --user"
    sudo apt install python3-pip -y
    pip3 install --user ansible
fi
if ! command -v ansible-playbook >/dev/null
then
    echo "ansible-playbook not found, installation failed" >&2
    exit 1
fi
ansible-playbook -i inventory.ini playbook.yml

cp gitconfig ~/.gitconfig
mkdir -p ~/.byobu
cp byobu-status ~/.byobu/status
cp byobu-datetime.tmux ~/.byobu/datetime.tmux

