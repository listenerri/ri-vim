#!/usr/bin/env bash

IsOSX=$(uname -a | grep -i Darwin)

if [[ $IsOSX ]]; then
    if [[ -z $(which realpath) ]]; then
        echo "require realpath command!"
        exit -1
    fi

    if [[ -z $(shopt | grep autocd) ]]; then
        echo "require install another version of bash using brew!"
        exit -1
    fi
fi

VimDir=$(dirname $(realpath $0))
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
echo -n "enable plugins for coding? [y:N] "
read answ
if [[ "$answ" != "y" ]]; then
    echo "will NOT intsall plugins for coding"
else
    echo "will intsall plugins for coding"
    mkdir -p vim-plug
    touch vim-plug/enable-coding-plugs
fi
vim -c PlugUpdate -c qa


echo "install done!"
