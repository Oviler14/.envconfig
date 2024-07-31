#! /usr/bin/env /bin/sh
set -e # Exit script upon error

SCRIPT_PATH=`dirname $0`
HOME_DIR=`realpath ${SCRIPT_PATH}/..`

cd ${HOME_DIR}

rm -rf .bashrc .vimrc .txts.conf .gitconfig .fzf

ln -s .envconfig/.bashrc .bashrc
ln -s .envconfig/.vimrc .vimrc
ln -s .envconfig/.txts.conf .txts.conf
ln -s .envconfig/.gitconfig .gitconfig
ln -s .envconfig/nvim .config/nvim

# FZF config
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sed -i 's/C-t/C-f/' .fzf/shell/key-bindings.bash

# Z config
git clone https://github.com/rupa/z ~/.z_cd
