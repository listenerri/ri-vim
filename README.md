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

#打开vim并安装插件
vim -c PlugUpdate

#插件安装完之后除了youcompleteme插件不能直接使用以外，
#其他插件都可以直接使用，youcompleteme插件需要编译后才能使用，
#编译方法见youcompleteme插件的README介绍：
https://github.com/Valloric/YouCompleteMe#installation
```

# 以下介绍部分按键
这些按键都是本配置相对于vim默认新增的(修改的)按键操作

**注意:**
- 映射`<leader>`为`<Space>`,也就是空格键
- `<C-J>`是CTRL加j键,`<C-K>`是CTRL加k键,其他类似
- 类似这种`<C-J>`时不区分大小写
- 其他内容注意区分大小写
- 注意按键在哪种模式(普通/插入/可视)下生效

## 一般按键
| 按键 | 功能 |
| :- | :- |
| H | 移动到行首 |
| L | 移动到行尾 |
| \<Space\>y | 将高亮部分复制到系统剪贴板 |
| \<Space\>Y | 复制整行到系统剪贴板 |
| \<Space\>d | 删除并复制到系统剪贴板 |
| \<Space\>x | 删除并复制到系统剪贴板 |
| \<Space\>p | 从系统剪贴板粘贴到光标之后 |
| \<Space\>P | 从系统剪贴板粘贴到光标之前 |
| \<Space\>q | 删除当前缓冲区(并开始编辑上一个) |
| \<Space\>e | 关闭当前窗口 |
| \<Space\>w | 保存当前缓冲区 |
| \<Space\>W | 使用root权限保存当前缓冲区 |
| \<Space\>\<Space\> | 取消搜索高亮 |
| / | 可视模式-按`/`键向下搜索高亮的部分 |
| ? | 可视模式-按`?`键向上搜索高亮的部分 |
| \<C-H\> | 正常模式-切换到左边的窗口 |
| \<C-J\> | 正常模式-切换到下边的窗口 |
| \<C-K\> | 正常模式-切换到上边的窗口 |
| \<C-L\> | 正常模式-切换到右边的窗口 |
| \<C-H\> | 插入模式-向左移动光标 |
| \<C-J\> | 插入模式-向下移动光标 |
| \<C-K\> | 插入模式-向上移动光标 |
| \<C-L\> | 插入模式-向右移动光标 |
| \<Insert\> | 插入模式-输入二合字符 |
| \<Space\>lo | 打开位置列表窗口(一般包含错误信息) |
| \<Space\>lc | 关闭位置列表窗口 |
| \<Space\>ln | 跳转到位置列表窗口中的下一个错误 |
| \<Space\>lp | 跳转到位置列表窗口中的上一个错误 |
| \<Space\>fo | 打开quickfix列表窗口 |
| \<Space\>fc | 关闭quickfix列表窗口 |
| \<Space\>fn | 跳转到quickfix列表窗口中的下一个错误 |
| \<Space\>fp | 跳转到quickfix列表窗口中的上一个错误 |
| \<Space\>bc | 删除所有buffer |
| \<Space\>bo | 删除所有buffer,除了当前的 |
| \<Space\>bp | 切换到上一个buffer |
| \<Space\>bn | 切换到下一个buffer |
| \<Space\>b0 | 切换到之前的buffer |

## 简单插件相关
| 按键 | 功能 |
| :- | :- |
| \<F2\> | 运行nerdtree |
| \<F5\> | 运行quickrun |
| \<F8\> | 切换tagbar |
| \\ | 调用easymotion |

## YouCompleteMe插件相关
| 按键 | 功能 |
| :- | :- |
| \<Space\>gi | 跳转到头文件 |
| \<Space\>gdc | 跳转到声明 |
| \<Space\>gdf | 跳转到定义 |
| \<Space\>gg | 跳转到声明或定义 |
| \<Space\>gt | 获取类型信息 |
| \<Space\>gp | 获取父类信息 |
| \<Space\>go | 获取相关文档 |
| \<Space\>gf | 快速修复功能 |
| \<Space\>gc | 强制检查c系列语言语法错误 |
| \<Space\>ge | c系列语言语法错误的位置列表窗口 |

## JavaComplete2插件相关
| 按键 | 功能 |
| :- | :- |
| \<Space\>jA | 为所有变量生成setter和getter |
| \<Space\>js | 为光标下变量生成setter |
| \<Space\>jg | 为光标下变量生成getter |
| \<Space\>ja | 为光标下变量生成setter和getter |
| \<Space\>jc | 生成默认构造方法 |
| \<Space\>jC | 同jA但生成有参数的构造方法 |
| \<Space\>ji | 为光标下的类名增加import |
| \<Space\>jI | 增加所有缺失的import |
| \<Space\>jr | 移除所有未使用的import |
| \<Space\>jm | 增加未实现的接口的方法 |

## ALE插件相关
| 按键 | 功能 |
| :- | :- |
| \<Space\>ac | ale强制检查语法错误 |

## Airline插件相关
| 按键 | 功能 |
| :- | :- |
| \<Space\>at | 开关airline |
| \<Space\>ar | 重新加载airline |
| \<Space\>aw | 开关whitespace检查 |

## EasyMotion插件相关
| 按键 | 功能 |
| :- | :- |
| f,F,t,T | 增强默认的这些vim功能 |
