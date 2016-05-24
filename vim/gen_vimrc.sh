#! /usr/bin/env bash

if [ -f ~/.vimrc ]; then
    echo ".vimrc exists!"
    exit 1
fi

# (for Windows use ~\vimfiles instead of ~/.vim)
vimdir=~/.vim

# Add pathogen.vim, a plugin manager
# see https://github.com/tpope/vim-pathogen
mkdir -p ${vimdir}/autoload ${vimdir}/bundle && \
curl -LSso ${vimdir}/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# base vimrc
echo "execute pathogen#infect()
syntax on
filetype plugin indent on" > ~/.vimrc

cd ${vimdir}/bundle

# Add sensible.vim, default vim settings
# see https://github.com/tpope/vim-sensible
git clone https://github.com/tpope/vim-sensible.git

# Add sleuth.vim, auto shiftwidth, expandtab
# see https://github.com/tpope/vim-sleuth
git clone https://github.com/tpope/vim-sleuth.git


