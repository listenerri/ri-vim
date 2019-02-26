#!/usr/bin/env bash

VimDir=$(dirname $(readlink -e $0))
echo "current vim directory is: $VimDir"

if [[ -e $HOME/.vim  ]]; then
    echo "backup exsit .vim to .vim-bak"
    rm -rf $HOME/.vim-bak
    mv -f $HOME/.vim $HOME/.vim-bak
fi

if [[ -e $HOME/.vimrc  ]]; then
    echo "backup exsit .vimrc to .vimrc-bak"
    mv -f $HOME/.vimrc $HOME/.vimrc-bak
fi

echo "create link from $VimDir to $HOME/.vim"
ln -s -f $VimDir $HOME/.vim

echo "install plugins..."
vim -c PlugUpdate -c qa

echo "install done!"
