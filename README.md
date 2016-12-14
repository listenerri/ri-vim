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

# 主要快捷键(不是全部)
- 映射\<leader\>为\<Space\>
- `<Space>`是空格键
- `<C-J>`是CTRL加j键,`<C-K>`是CTRL加k键,其他类似
- 类似这种`<C-J>`时不区分大小写
- 其他内容注意区分大小写

|按键		    |功能                                |
|:----:		    |:----:                              |
|H		    |移动到行首                          |
|L		    |移动到行尾                          |
|\<Space\>y	    |将高亮部分复制到系统剪切板          |
|\<Space\>Y	    |复制整行到系统剪切板                |
|\<Space\>p	    |从系统剪切板粘贴到光标之后          |
|\<Space\>P	    |从系统剪切板粘贴到光标之前          |
|\<Space\>q	    |退出当前窗口                        |
|\<Space\>w	    |保存当前缓冲区                      |
|\<Space\>\<Space\> |取消搜索高亮                        |
|\<Space\>/	    |向下搜索光标下的单词                |
|\<Space\>?	    |向上搜索光标下的单词                |
|/		    |可视模式下按`/`键向下搜索高亮的部分 |
|?		    |可视模式下按`?`键向上搜索高亮的部分 |
|\<C-H\>	    |正常模式下切换到左边的窗口          |
|\<C-J\>	    |正常模式下切换到下边的窗口          |
|\<C-K\>	    |正常模式下切换到上边的窗口          |
|\<C-L\>	    |正常模式下切换到右边的窗口          |
|\<C-H\>	    |插入模式下向左移动光标              |
|\<C-J\>	    |插入模式下向下移动光标              |
|\<C-K\>	    |插入模式下向上移动光标              |
|\<C-L\>	    |插入模式下向右移动光标              |
|\<Insert\>	    |插入模式下输入二合字符              |

# 插件相关快捷键
- 需要注意的东西请看上面“主要快捷键”的部分

|按键		    |功能                                |
|:----:		    |:----:                              |
|\<F2\>		    |打开netrw文件管理                   |
|\<F5\>	    	    |运行quickrun                        |
|\<F8\>	    	    |运行tagbar                          |
|\<Space\>gi        |跳转到头文件(ycm)                   |
|\<Space\>gdc       |跳转到声明(ycm)                     |
|\<Space\>gdf       |跳转到定义(ycm)                     |
|\<Space\>gg        |跳转到声明或定义(ycm)               |
|\<Space\>gt        |获取类型信息(ycm)                   |
|\<Space\>gp        |获取父类信息(ycm)                   |
|\<Space\>go        |获取相关文档(ycm)                   |
|\<Space\>gf        |快速修复功能(ycm)                   |
|\<Space\>gc        |强制检查c系列语言语法错误(ycm)      |
|\<Space\>ge        |c系列语言语法错误的位置列表窗口(ycm)|
|\<Space\>jA        |为所有变量生成setter和getter(java)  |
|\<Space\>js        |为光标下变量生成setter(java)        |
|\<Space\>jg        |为光标下变量生成getter(java)        |
|\<Space\>ja        |为光标下变量生成setter和getter(java)|
|\<Space\>jc        |生成默认构造方法(java)              |
|\<Space\>jC        |同jA但生成有参数的构造方法(java)    |
|\<Space\>ji        |为光标下的类名增加import(java)      |
|\<Space\>jI        |增加所有缺失的import(java)          |
|\<Space\>jr        |移除所有未使用的import(java)        |
|\<Space\>jm        |增加未实现的接口的方法(java)        |
|\<Space\>sc        |强制检查语法错误(syntastic)         |
|\<Space\>se        |语法错误的位置列表窗口(syntastic)   |
