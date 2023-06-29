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
echo ""
echo "enable coc plugin?"
echo "NOTE: you should install node (ver > v8) and vim (ver > v8) before enable coc plugin!"
echo "you can manually enable coc plugin later by creating file vim-plug/enable-coc-plugin"
echo "so enable coc plugin right now? [y:N] "
read answ
if [[ "$answ" != "y" ]]; then
    echo "will NOT intsall/load coc plugin and all nodejs plugins of coc"
else
    echo "will intsall coc plugin"
    mkdir -p vim-plug
    touch vim-plug/enable-coc-plugin
fi
vim -c PlugUpdate

if [[ -f vim-plug/enable-coc-plugin ]]; then
    echo -n "install coc plugins(nodejs plugins of coc) right now? [y:N] "
    read answ
    if [[ "$answ" != "y" ]]; then
        echo "coc plugins will be installed when the next time vim is started"
    else
        echo "intsalling coc plugins"
        vim
    fi
fi

unset answ

echo "install done!"
