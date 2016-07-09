# ri-vim
ri-vim是一份中文注释齐全的vim配置,除了自己使用外,
也为了能让从未接触过vim的人能快速了解部分常用配置的作用,以便能尽快上手vim

插件管理器使用的是:[vim-plug](https://github.com/junegunn/vim-plug)

# 使用方法
``` bash
#进入家目录
cd ~

#备份.vim文件夹
mv .vim .vim.bak

#备份.vimrc文件
mv .vimrc .vimrc.bak

#下载本配置
git clone git@github.com:ListenerRi/ri-vim.git

#链接本位置目录到.vim
ln -s ~/ri-vim ~/.vim
```

# 主要快捷键
- 映射\<leader\>为\<Space\>
- 以下内容注意区分大小写

|按键		    |功能|
|:----:		    |:----:|
|H		    |移动到行首|
|L		    |移动到行尾|
|\<Space\>y	    |将高亮部分复制到系统剪切板|
|\<Space\>p	    |从系统剪切板粘贴到光标之后|
|\<Space\>P	    |从系统剪切板粘贴到光标之前|
|\<Space\>q	    |退出当前窗口|
|\<Space\>w	    |保存当前缓冲区|
|\<Space\>\<Space\> |取消搜索高亮 (`<Space>`是空格键)|
|\<Space\>/	    |向下搜索光标下的单词|
|\<Space\>?	    |向上搜索光标下的单词|
|/		    |可视模式下按`/`键向下搜索高亮的部分|
|?		    |可视模式下按`?`键向上搜索高亮的部分|
|\<C-H\>	    |将光标切换到左边的窗口(`<C-H>`是CTRL加h键,不区分大小写)|
|\<C-J\>	    |将光标切换到下边的窗口(`<C-J>`是CTRL加j键,不区分大小写)|
|\<C-K\>	    |将光标切换到上边的窗口(`<C-K>`是CTRL加k键,不区分大小写)|
|\<C-L\>	    |将光标切换到右边的窗口(`<C-L>`是CTRL加l键,不区分大小写)|
