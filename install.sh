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
echo "NOTE: you should install node (version > v8) and vim (version > v8) before enable coc plugin!"
echo "you can manually enable coc plugin later by creating file plugged/enable-coc-plugin"
echo -n "so enable coc plugin right now? [y:N] "
read answ
if [[ "$answ" != "y" ]]; then
    echo "will NOT intsall/load coc plugin and all nodejs plugins of coc"
else
    echo "will intsall coc plugin"
    mkdir -p plugged
    touch plugged/enable-coc-plugin
fi
vim -c PlugUpdate

unset answ

echo "install finished!"
