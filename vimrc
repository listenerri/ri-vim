" 不兼容vi
" compatible
set nocp





" ##########################安装/加载插件##########################
" 使用vim-plug插件管理器
" vim-plug的简要使用方法:
" 命令:
" :PlugInstall  安装列表中的插件
" :PlugUpdate   安装/升级列表中的插件
" :PlugUpgrade 	更新vim-plug这个插件管理器
" :PlugStatus 	查看插件状态
" :PlugClean    删除一些未使用的插件,删除前会询问
" 安装或加载插件时的一些选项:
" do 	  当安装/更新插件后的回调命令:系统命令或定义的一个方法
"   例:Plug '插件', { 'do': './install.py' }
"   例:Plug '插件', { 'do': function('自定义方法名') }
" on 	  当在vim中执行某个命令时才加载这个插件
"   例:Plug '插件', { 'on': '命令' }
"   例:Plug '插件', { 'on': ['命令1', '命令2'] }
" for 	  当打开某个类型的文件时才加载这个插件
"   例:Plug '插件', { 'for': '文件类型' }
"   例:Plug '插件', { 'for': ['文件类型1','文件类型2'] }
" 也可以同时使用上述另个选项:
"   例:Plug '插件',  { 'on': '命令', 'for': '文件类型' }

" 开始插件加载,括号中的是插件的安装和加载目录
" 每个插件下面的是对这个插件的设置
call plug#begin('~/.vim/vim-plug')

"  hybrid颜色主题
Plug 'w0ng/vim-hybrid'

" 记住fcitx在插入模式的中英状态
" 按ESC键后设置fcitx为英文,进入插入模式后设置为上次离开是的中英状态
Plug 'lilydjwg/fcitx.vim'
    " 以下设置一些超时时间(超过这个时间后才不在等待后续按键)
    " 这样可以避免使用此插件从插入模式退出后带来的一点延迟
    " 其实如果按照默认设置,本来就有一点延迟,只是无关紧要,
    " 使用此插件后就这点延迟就变得非常明显了
    " 开启映射超迟(默认是开启):自己定义的按键映射比如<leader>y
    set timeout
    " 设置映射超迟时间(默认是1000)
    set timeoutlen=3000
    " 开启键码超迟(默认是关闭):比如按ESC键退出插入,命令,可视模式的超时
    set ttimeout
    " 设置键码超时时间(默认是负数也就是关闭,关闭时由timeoutlen的值管理键码超时)
    set ttimeoutlen=100

" 一个多功能的自动补全插件
" 支持c系列,python,go,TypeScript,JavaScript,rust语言补全,
" 支持文件目录/文件名补全
" 支持从vim的omnifunc接收数据补全
" 支持上下文变量以及tags文件补全
" 支持UltiSnips的snippet补全(一个快速插入整块代码的插件)
" 异常强大,但需要手动编译,编译的时候可以选择性的编译上述特性
" 需要注意的是如果vim-plug更新了YCM,那么就需要重新编译
" 更多介绍参见此项目主页(https://github.com/Valloric/YouCompleteMe)
Plug 'Valloric/YouCompleteMe'
    " 当没有找到打开的文件或项目的'.ycm_extra_conf.py'时使用哪个作为默认的
    let g:ycm_global_ycm_extra_conf = '~/.vim/vim-plug/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    " 使用ctrl-j或下键或ctrl-n在补全菜单中向下移动
    let g:ycm_key_list_select_completion = ['<c-j>', '<Down>']
    " 使用ctrl-k或上键或ctrl-p在补全菜单中向上移动
    let g:ycm_key_list_previous_completion = ['<c-k>', '<Up>']

" 快速插入代码片段
" 会在ycm弹出的补全菜单中包含又<snip>字样的补全项
" 这些补全项可以插入一段代码,要插入这种补全项需要输入这一项在补全菜单中的完整文字,
" 或者使用上面ycm定义的上下移动键移动到要使用的代码段,然后按<tab>键
" 引擎
Plug 'SirVer/ultisnips'
" 代码片段
Plug 'honza/vim-snippets'
    " 使用tab键展开在补全菜单中选中的补全项的代码片段
    let g:UltiSnipsExpandTrigger="<tab>"
    " 在展开代码片段后使用tab键跳转需要修改的关键部分(如果右的话),跟eclipse中的自动补全后按tab键很像
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    " 类似上面的定义,但是反向移动
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    " 可以使用:UltiSnipsEdit命令自定义供补全的代码片段,其保存到下面指定的目录下
    let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
    " 当使用:UltiSnipsEdit命令时在一个垂直新建的窗口中编写
    let g:UltiSnipsEditSplit="vertical"


" 结束插件加载
call plug#end()





" ##########################vim选项设置##########################
" 每一个设置上面都有中文翻译,和完整的设置名称
" 因为大部分设置使用的都是简写

" 允许跨行移动的按键
" whichwrap
set ww=b,s,h,l,<,>

" 禁止跳转时光标移动到非空字符
" 默认当跳转时光标会移动到那一行的非空字符处
" startofline
set nosol

" 输入搜索关键字时跳转到匹配的结果
" 但并未真正跳转,仍需要按enter键才会真正跳转
" 找不到匹配或按esc键则回到光标原来的位置
" incsearch
set is

" 搜索不区分大小写
" ignorecase 
set ic

" 搜索智能区分大小写
" 本选项的作用是配合上面不区分大小写的设置
" 这样,只要包含一个大写字母则搜索时区分大小写
" smartcase
set scs

" 多用于C程序中,从一个名叫tags的文件中搜索数据
" 使用CTRL-]快捷键进行跳转到当前光标所在关键字的
" 方法的定义处,CTRL-T跳转回来
"暂不设置

" 光标上下最少保留行数
" 比如当向下移动光标时,光标不会移动到当前编辑区最低部
" 才开始滚动编辑区,这样能保证看到部分连续的上下文
" scrolloff
set so=4

" 同上,但对横向滚动起作用,且只有设置了nowrap(下面)的时候才起作用
" sidescrolloff
set siso=4

" 是否把超出编辑区显示范围的行,按多行显示
" wrap
set wrap 

" 显示行数
" number
set nu

" 设置背景色模式为暗色
" background
set background=dark

" 终端颜色数目为256(兼容更多的颜色主题)
set t_Co=256

" 颜色主题
colorscheme hybrid

" 检测文件类型,载入文件类型插件,载入文件类型缩进
" :filetype
filetype on
filetype plugin on
filetype indent on

" 语法高亮
" :syntax
syntax on

" 高亮搜索时匹配到的搜过结果
" hlsearch
set hls

" 高亮光标所在列和行
" cursorcolumn
" cursorline
set cuc
set cul

" 何时有底部的状态行:0,永不;1,至少两个窗口;2,总是显示
" laststatus
set ls=2

" 状态行显示的内容
" statusline
set stl=%t%m%r%h%w%=[%c-%l]%P

" 启动鼠标
" mouse
set mouse=a

" 在状态行显示命令
" showcmd
set sc

" 确认对话框
" 多用于退出时文件已修改但未保存时询问,询问选项有:
" 保存,不保存,取消
" confirm
set cf

" 制表键代表的空格数
" tabstop
set ts=8

" 输入制表键时混合输入制表键和空格
" softtabstop
set sts=4

" 自动缩进时的空格数目
" shiftwidth
set sw=4

" 自动缩进
" autoindent
set ai

" 智能缩进
" 主要适用于c这样的程序,也可能适用于其他程序
" 另外,对于c程序还有更好但也更严谨,配置更复杂的cindent
" smartindent
set si

" 自动重新读入
" 如果vim发现文件在其他地方被修改了,自动重新读入
" autoread
set ar

" 自动写入
" 当在执行一些跳转,离开本缓冲区的命令时自动写入文件,如:
" :next,:last,:stop,:suspend,CTRL-],CTRL-O,'{A-Z0-9}等
" autowriteall
set awa

" 命令行补全菜单
" 在命令行按tab键补全命令时,在命令行上方出现可能的匹配
" 使用tab键或CTRL-P/CTRL-N移动到合适的匹配上
" 上键:文件名/菜单名补全中: 上移到父目录或父菜单
" 下键:文件名/菜单名补全中: 移进子目录和子菜单
" 回车键:菜单补全中，如果光标在句号之后: 移进子菜单
" wildmenu
set wmnu
" 默认左键和右键也是选择匹配,修改按键令其移动光标
cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>

" 编码
" encoding:vim内部使用的编码
" termencoding终端使用的编码(一般与encoding相同)
" fileencoding:当前文件编码(不在此处设置,vim会自动设置)
" fileencodings:可选的文件编码
"     utf-8不能放到usc-bom之前,latin1应为最后,default是encoding的值
set enc=utf-8
set tenc=utf-8
set fencs=ucs-bom,utf-8,gbk,gb2312,default,latin1





" ##########################GUI##########################
if has("gui_running")
    "gui窗口宽高
    set lines=30
    set columns=84
    " gui选项
    " guioptions
    " m 菜单栏
    " g 灰色菜单项
    " t 可撕下的菜单
    " T 工具栏
    " r 右边滚动条总是存在
    " R 右边滚动条有垂直分割的窗口时总是存在
    " l 左边滚动条总是存在
    " L 左边滚动条有垂直分割的窗口时总是存在
    " b 底部的水平滚动条,大小为当前文件中的最长行
    " h 限制水平滚动条的长度为当前光标所在行,可减少计算量
    " 每个选项都可以使用加号"+"和减号"-"来开关
    set go-=m
    set go-=T
    set go-=r
    set go-=l
    set go-=b
endif





" ##########################按键映射设置##########################
" map:全局的映射,映射之后的按键可以递归(被再次映射)
" noremap:全局的映射,但映射后的按键不可递归(多用于定义一个命令)
" unmap:删除一个映射
" mapclear:删除所有映射
" 映射也区分模式,如果上述命令前有如下字符,则该命令只对该模式生效:
" n:normal(正常)模式下
" v:可视模式
" i:插入模式
" c:命令行模式

" 设置<leader>为","
let mapleader = ","

" 将";"映射为":"
nnoremap ; :

" 默认的V选择整行不好用
nnoremap V ^v$

" 快速移动到行尾航首
" 全局不适用H,L的原功能
map H ^
map L $

" 复制到系统剪切板
noremap <leader>y "+y

" 从系统剪切板粘贴
noremap <leader>p "+p
noremap <leader>P "+P

" 保存和退出
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

" 保证搜索结果高亮,避免下面取消高亮后在此搜索没有高亮
nnoremap / :set hlsearch<cr>/
nnoremap n :set hlsearch<cr>nzz
nnoremap N :set hlsearch<cr>Nzz

" 取消搜索的高亮
nnoremap <leader>/ :set nohlsearch<cr>

" 窗口切换
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l





" ##########################自动命令设置##########################

"打开文件后自动跳转到上次离开的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
