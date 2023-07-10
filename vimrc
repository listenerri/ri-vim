" 不兼容vi
" compatible
set nocp




" ##########################vim选项设置:options##########################
" 每一个设置上面都有中文翻译,和完整的设置名称
" 因为大部分设置使用的都是简写

" 允许跨行移动的按键
" whichwrap
set ww=b,s,h,l,<,>,[,]

" 插入模式下回格键，删除键，CTRL-W，CTRL-U 的功能
" backspace
set bs=2

" 禁止跳转时光标移动到非空字符
" 默认当跳转时光标会移动到那一行的非空字符处
" nostartofline
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

" 显示相对行数
" relativenumber
"set rnu

" 检测文件类型,载入文件类型插件,载入文件类型缩进
" :filetype
filetype on
filetype plugin on
filetype indent on

" 语法高亮
" :syntax
syntax on

" 设置背景色模式为暗色
" background
set background=dark

" 终端颜色数目为256(兼容更多的颜色主题)
set t_Co=256

" 颜色主题
" 主题的设置应在语法高亮和类型检测后面,否则会出现一些问题
" 执行版本管理之外的配置文件来设置主题，避免因为改完主题而提交代码
" 主题配置文件的为HOME目录下的".vimrc-colorscheme"文件
if filereadable(glob("~/.vimrc-colorscheme"))
    source ~/.vimrc-colorscheme
else
    colorscheme molokai
endif

" 高亮搜索时匹配到的搜过结果
" hlsearch
set hls

" 高亮光标所在列和行
" cursorcolumn
" cursorline
"set cuc
"set cul

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

" 以下四个选项设置了使用4个空格代替tab制表符
" 文件里制表键代表的空格数
" tabstop
set ts=4
" (自动)缩进时的空格数目
" shiftwidth
set sw=4
" 行首一次性插入或删除sw所设置的空格数
" smarttab
set sta
" 输入制表键时以空格代替
" expandtab
set et

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

" 自动写入(不包含"edit","quit"等命令,如需包含参见autowriteall)
" 当在执行一些跳转,离开本缓冲区的命令时自动写入文件,如:
" :next,:last,:stop,:suspend,CTRL-],CTRL-O,'{A-Z0-9}等
" autowrite
set aw

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

" 以下设置一些超时时间(超过这个时间后才不在等待后续按键)
" 这样可以避免状态栏提示信息的一点延迟
" 开启映射超迟(默认是开启):自己定义的按键映射比如<leader>y
set timeout
" 设置映射超迟时间(默认是1000)
set timeoutlen=3000
" 开启键码超迟(默认是关闭):比如按ESC键退出插入,命令,可视模式的超时
set ttimeout
" 设置键码超时时间(默认是负数也就是关闭,关闭时由timeoutlen的值管理键码超时)
set ttimeoutlen=100

" 当打开文件时切换当前的工作目录到文件所在的目录下
" 当前工作目录可以通过:pwd命令查看
"set autochdir

" 隐藏已经被:bdelete的buffer
" airline的tabline就不会再显示已经被delete的buffer
set hidden

" 使用view时不使用options，只加载vimrc中默认的配置
set viewoptions-=options





" ##########################GUI:gui##########################
if has("gui_running")
    "gui窗口宽高
    set guifont=WenQuanYi\ Micro\ Hei\ Mono\ 11
    set lines=28
    set columns=120
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
    set go-=T
    set go-=L

    "for mac osx
    if has('mac')
        "gui字体
        set guifont=Source\ Code\ Pro:h12
        set lines=30
        set columns=100
    endif

endif





" ##########################按键映射设置:mapkeys##########################
" map:全局的映射,映射之后的按键可以递归(被再次映射)
" noremap:全局的映射,但映射后的按键不可递归(多用于定义一个命令)
" unmap:删除一个映射
" mapclear:删除所有映射
"
" 映射也区分模式,如果上述命令前有如下字符,则该命令只对该模式生效:
" n:normal(正常)模式下
" v:可视模式
" i:插入模式
" c:命令行模式
"
" map可以增加参数或者说选项，可用如下：
" <buffer> : 只在当前buffer生效
" <nowait> : 一旦匹配到可用按键序列立即生效，不等待后续按键，相当于对更长按键映射的一种覆盖
" <silent> : 静默，不在状态栏显示
" <special> : 与 cpoptions 选项有关
" <script> : 只用在脚本中定义映射，不是全局映射，多在编写插件时使用
" <expr> : 映射的值将被作为表达式进行解析执行，并将计算结果作为最终映射的值
" <unique> : 映射键已存在时报错
" <nowait>举例：有一个"imap <nowait> ,w week"按键映射，但还有一个"imap ,wl weekly"
" 前一个imap加入了<nowait>的参数，那么输入",w"后就会理解匹配到第一个imap，
" 如果没有<nowait>参数，那么输入",w"后就会等待输入"l"，如果输入了"l"那么就会匹配上第二个imap，
" 如果一直没有输入"l"，那么就会超时，超时后才会匹配第一个imap
"
" 特殊的映射值前缀
" <Cmd>
"   在不真正进入命令行模式的情况下执行命令，这在非 normal
"   模式时很有用，不必先返回到 normal 模式
"   noremap x <Cmd>echo mode(1)<CR>
" <SID>
"   （先说明一个概念，map 不仅可以定义映射，还可以定义别名）
"   <SID> 可以理解为一个变量，会被替换为当前脚本自己的脚本 ID，
"   不同脚本中 <SID> 将被替换为不同的内容，
"   多用在插件脚本中，为一个表达式创建别名，这个表达式通常调用脚本内的函数，
"   表达式调用函数时，也要在函数名前加上 <SID>，同时创建的别名也要加上 <SID>，
"   由于 SID 是动态生成的，被替换 SID 后的具体内容不可预知，
"   所以如果想让其他脚本（其他插件/用户脚本）中想要使用这个 <SID> 别名，
"   还要将 <SID> 别名再次导出为全局的一个别名，这个别名需要带有 <Plug> 前缀。
"   另外，如果要在插件脚本中指定定义按键映射，而不是将别名导出供外部使用的话，
"   可以不写 <Plug> 而是直接定义映射键到带有 <SID> 的函数调用表达式上
" <Plug>
"   <Plug> 可用于在插件脚本中定义一个别名，带有 <Plug> 前缀的别名对于脚本外是可见的，
"   所以可以使用 <Plug> 别名将插件脚本中定义的 <SID> 别名导出到全局范围，
"   <Plug> 别名使用驼峰式命名，驼峰式命名是有意义的，一般为 <Plug>ScriptDest

" 设置<leader>为空格键
let mapleader = "\<Space>"

" 更方便的进入命令模式
nnoremap <leader>; :

" 插入模式下快速移动光标
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" 插入二合字符
" 默认是<C-K>,但已被上面的定义所占用
inoremap <Insert> <C-K>

" 快速移动到行首行尾
" 直接使用map命令从而全局不使用H,L的原功能
map H ^
map L $
" 可视模式下移动到行尾(不包含换行符)
vnoremap L $h

" 复制到系统剪切板
noremap <leader>y "+y

" 复制行到系统剪切板
noremap <leader>Y "+yy

" 剪切到系统剪切板
noremap <leader>d "+d
noremap <leader>x "+x

" 从系统剪切板粘贴
noremap <leader>p "+p
noremap <leader>P "+P

" 保存
nnoremap <leader>w :w<CR>
" 调用 sudo 以 root 权限报错（当普通保存提示没有权限时这很有用）
nnoremap <leader>W :w !sudo tee % > /dev/null<CR>
" 写入改动并关闭窗口 :exit 类似于 :wq
" 当只剩下最后一个窗口时，将退出 vim
nnoremap <leader>e :exit<CR>
" 仅关闭窗口，不退出 vim
" 当只剩下最后一个窗口时，执行此操作将提示不允许关闭最后一个窗口
" 防止习惯了多窗口编辑的人，连续使用此快捷键退出窗口时，不小心w要退出 vim 请使用 <leader>e 或 :q
nnoremap <leader>q :close<CR>
    " 注意：只是关闭窗口，窗口所展示的 buffer/file 并不会同步关闭，
    " 仍然显示在 airline 的标签栏上，airline 的标签栏被配置为显示 buffers，
    " 这也是 vim 本身的理念：
    " buffer 是一切的基础，window 只是 buffer 的视窗，tab 是 windows 的容器，
    " 一个 window 可以用于观察不同的 buffer（同一时刻只观察一个 buffer），
    " 一个 buffer 可以同时显示在一个或多个不同的 windows 中（即使 windows 不在同一个 tab）
    " 总之，tabs 在 vim 中与常规编辑器的标签栏不同

" 切换搜索高亮的设置
nnoremap <leader><Space> :set hlsearch!<cr>

" 可视模式下搜索选中的内容
" 向下搜索
vnoremap / y/<C-R>"<CR>
" 向上搜索
vnoremap ? y?<C-R>"<CR>


" 窗口切换
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" 打开当前窗口的位置列表
nnoremap <leader>lo :lopen<cr>
" 关闭当前窗口的位置列表
nnoremap <leader>lc :lclose<cr>
" 跳转到当前窗口位置列表的下一项和前一项
" 当syntastic或ycm检测到语法错误时可使用此映射跳转下一个或前一个错误
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>

" 打开当前窗口的quickfix列表
nnoremap <leader>fo :copen<cr>
" 关闭当前窗口的quickfix列表
nnoremap <leader>fc :cclose<cr>
" 跳转到当前窗口quickfix列表的下一项和前一项
nnoremap <leader>fn :cnext<cr>
nnoremap <leader>fp :cprevious<cr>

" buffers 相关按键映射
" 进入 buffer 列表，等待后续操作，比如：
" - 选择加载指定 buffer ":b 2"
" - 执行多个 buffer 的删除操作 ":bd 1 2" 或 "2,4bd"
nnoremap <leader>bb :ls<cr>:
" [Open] 进入 buffer 列表，等待指定 buffer，然后在当前窗口打开/加载它
nnoremap <leader>bo :ls<cr>:b
" [Create Horizontal] 创建新的 buffer 并横向分屏后加载
nnoremap <leader>bcs :new<cr>
" [Create Vertical] 创建新的 buffer 并垂直分屏后加载
nnoremap <leader>bcv :vnew<cr>
" [Delete] 删除当前 buffer
nnoremap <leader>bd :bd<cr>
" [next] 切换到下一个 buffer
nnoremap <leader>bn :bnext<cr>
" [Previous] 切换到上一个 buffer
nnoremap <leader>bN :bNext<cr>
nnoremap <leader>bp :bprevious<cr>
" [First] 切换到第一个 buffer
nnoremap <leader>bf :bfirst<cr>
" [Last] 切换到最后一个 buffer
nnoremap <leader>bl :blast<cr>
" [Split] 进入 buffer 列表，等待指定 buffer，然后分屏一个新窗口打开/加载它
nnoremap <leader>bs :ls<cr>:sbuffer





"###########################安装/加载插件:plugins##########################
"
" 注意！编程相关的插件放在了 vimrc-code-plugs 文件中，默认不安装
" 可通过在执行 install.sh 脚本时，调整选项来控制是否加载编程相关的配置文件
" 也可以通过在创建 ./vim-plug/enable-coding-plugs 文件手动启用
"
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

"##########
" 自动切换输入法
" ssh 会话中不使用此模块
if !exists("$SSH_CLIENT")
    if has('mac') || has('win32') || has('win32unix') || strlen($WSL_DISTRO_NAME) != 0
        Plug 'listenerri/smartim', { 'branch': 'imselect-path' }
        " debug log file: ~/vim_smartim_debug_output
        "let g:smartim_debug = 1
        if has('mac')
            let g:smartim_default = 'com.apple.keylayout.US'
        else
            let g:smartim_default = '1033'
            if executable('im-select')
                let g:smartim_imselect_path = 'im-select'
            endif
        endif
    elseif has('linux') || has('unix')
        Plug 'lilydjwg/fcitx.vim'
    endif
endif





"##############
" vim-signature
" 实现并扩展了vim自身所有的mark功能,每行可以放置多个标记
" 在最左边显示当前行的标记,超过两个标记只显示后两个
Plug 'kshenoy/vim-signature'
    " 下面是这个插件的一些按键:
    " mx           切换当前行的'x'标记,'x'属于a-zA-Z
    " dmx          不管当前光标在哪儿,删除'x'这个标记
    " m,           放置下一个可用的标记在当前行
    " m.           同上,但如果当前行已存在标记就删除它,如果存在多个就删除第一个
    " m-           删除当前行的所有标记
    " m<Space>     删除当前buffer的所有标记
    " ]`           跳转到下一个标记
    " ]'           跳转到下一个标记的行首
    " [`           跳转到上一个标记
    " ['           跳转到上一个标记的行首
    " `]           按标记的字母顺序跳转到下一个标记
    " ']           按标记的字母顺序跳转到下一个标记的行首
    " `[           按标记的字母顺序跳转到上一个标记
    " '[           按标记的字母顺序跳转到上一个标记的行首
    " m/           打开一个本地列表窗口来显示当前buffer的所有标记
    " 以下为类型标记按键,不同行可以是同一种类型标记,同一行可以既有类型标记又有字母标记
    " 其中的数字分别对应:'!@#$%^&*()',每一个符号都是一种类型
    " m[0-9]       切换当前行的类型标记
    " m<S-[0-9]>   不管光标在哪儿,删除对应的所有此类标记
    " ]-           跳转到下一个同类型的标记
    " [-           跳转到上一个同类型的标记
    " ]=           跳转到下一个类型标记,不管哪种类型
    " [=           跳转到上一个类型标记,不管哪种类型
    " m?           打开一个本地列表窗口来显示当前buffer的所有类型标记
    " m<BS>        删除当前buffer的所有类型标记


"############
" vim-airline
" 高度可定制的状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    " 主题
    let g:airline_theme='molokai'
    "
    " 标签栏
    " 注意！airline 的标签栏插件默认有两种显示模式：buffers/tabs
    " - buffers 模式下将显示 buffers
    " - tabs 模式下将显示 tabs，此模式下将没有地方完整显示 buffers
    " 默认情况下当有超过 1 个 tab 时，会进入 tabs 模式
    " 后面将修改这个行为，使其始终处于 buffers 模式，显示所有 buffers
    " 我觉得 buffers 比 tabs 更重要，如果看不到 buffers 就不知道已经打开了哪些文件
    "
    " 启用标签栏插件
    let g:airline#extensions#tabline#enabled = 1
    " 显示标签序号以及标签内有多少窗口
    " 标签序号将以较小的数字显示在标签的左上角
    let g:airline#extensions#tabline#tab_nr_type = 2
    " 显示 buffer/tab 序号，此序号是 vim 中的序号
    " buffer/tab 序号将以普通大小的数字显示在标签中文件名左边以方括号包裹
    let g:airline#extensions#tabline#buffer_nr_format = '[b%s]'
    let g:airline#extensions#tabline#buffer_nr_show = 1
    " 只显示文件名,不显示路径(:h :p查看相关帮助)
    let g:airline#extensions#tabline#fnamemod = ':t'
    " 值为 0 时，始终以 tabs 模式运行，不展示 buffers
    " 值为 1 时（插件默认值），当只有 1 个 tab 时以 buffers 模式运行，否则进入 tabs 模式
    " 下面的 show_tabs 选项为 0 时，此选项等同于被强制设置为 1
    let g:airline#extensions#tabline#show_buffers = 1
    " 始终在标签栏上显示 buffers，即始终处于 buffers 模式
    let g:airline#extensions#tabline#show_tabs = 0
    " 标签切换按键映射
    " 注意！这个标签序号与真实的 buffer/tab 序号没有关联对应关系
    " 值为 1 时，映射 1-10 个标签，
    " 值为 2 时，规则有点反脑回路，就不用了
    " 值为 3 时，映射 01-99 个标签
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    nmap <leader>0 <Plug>AirlineSelectTab0
    nmap <leader>- <Plug>AirlineSelectPrevTab
    nmap <leader>= <Plug>AirlineSelectNextTab
    " 开关 airline
    nnoremap <leader>at :AirlineToggle<cr>
    " 重新加载 airline，这在测试主题样式时很有用
    nnoremap <leader>ar :AirlineRefresh<cr>
    " 开关 whitespace 检查(默认关闭该检查功能)
    let g:airline#extensions#whitespace#enabled = 0
    nnoremap <leader>aw :AirlineToggleWhitespace<cr>

"###########
" nerdtree
" 文件管理
Plug 'scrooloose/nerdtree'
    " 显示隐藏文件(dotfiles)
    let NERDTreeShowHidden=1
    " 按<F2>开关nerdtree
    nnoremap <F2> :NERDTreeToggle<CR>
    inoremap <F2> <ESC>:NERDTreeToggle<CR>


"###########
" easymotion
" 快速移动到某一位置
Plug 'easymotion/vim-easymotion'
    " 智能大小写
    let g:EasyMotion_smartcase = 1
    map \ <Plug>(easymotion-prefix)
    map <leader>s <Plug>(easymotion-prefix)s
    " 替换默认的 f F t T 功能到此插件
    map f <Plug>(easymotion-prefix)f
    map F <Plug>(easymotion-prefix)F
    map t <Plug>(easymotion-prefix)t
    map T <Plug>(easymotion-prefix)T


"####################
" previm
" 执行PrevimOpen命令在浏览器中实时预览所编写的markdown文件
Plug 'kannokanno/previm', { 'for': 'markdown' }
    let g:previm_open_cmd = 'xdg-open'


"##############
" vim-multiple-cursors
" 实现同时编辑多个位置
" 使用<c-n>开始选择位置, <c-p>取消当前的选择,返回上一个
" <c-x>跳过下一个匹配, <esc>终止操作
" 选择完毕之后可以使用I,A,c,s开始是修改所有选择的位置
Plug 'terryma/vim-multiple-cursors'



"##############
" vim-fswitch
" c/cpp头文件切换
Plug 'derekwyatt/vim-fswitch', { 'for': ['c','cpp'] }
    map <f4> :FSHere<cr>



"############
" vim-quickrun
" 快速运行当前文件或选中的行
Plug 'thinca/vim-quickrun', { 'for': ['sh','java','c','cpp','python','go'] }
    " 按F5按默认配置快速启动
    nmap <F5> <Plug>(quickrun)
    " 为了避免运行时无法进行交互
    " 所以设置runner为shell, 默认为system
    let g:quickrun_config = {
    \   "_" : {
    \       "runner" : "shell",
    \   },
    \}



" NERD-Commenter
" 提供注释功能
Plug 'scrooloose/nerdcommenter', { 'for': ['vim','java','c','cpp','dosbatch','sh','python','html','xhtml','go'] }
    " 禁止其默认绑定 <leader>c*
    " 默认绑定了一堆 <leader>c 开头的按键映射，太复杂用不到
    let NERDCreateDefaultMappings = 0
     "使用 Ctrl+_ 或 Ctrl+/ 执行注释操作
    map <c-_> <plug>NERDCommenterToggle



" git 插件
Plug 'tpope/vim-fugitive'


" DoxygenToolkit.vim
" doxygen文档注释插件
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': ['c','cpp','python'] }
    let g:DoxygenToolkit_briefTag_pre = "\\brief "
    let g:DoxygenToolkit_templateParamTag_pre = "\\tparam "
    let g:DoxygenToolkit_paramTag_pre = "\\param "
    let g:DoxygenToolkit_returnTag = "\\return "
    let g:DoxygenToolkit_throwTag_pre = "\\throw " " @exception is also valid
    let g:DoxygenToolkit_fileTag = "\\file "
    let g:DoxygenToolkit_authorTag = "\\author "
    let g:DoxygenToolkit_dateTag = "\\date "
    let g:DoxygenToolkit_versionTag = "\\version "
    let g:DoxygenToolkit_blockTag = "\\name "
    let g:DoxygenToolkit_classTag = "\\class "

    " 添加两个命令用于中英文标记
    command! -nargs=0 Doe :call DoxygenCommentFuncEnglish()
    command! -nargs=0 Doc :call DoxygenCommentFuncChinese()

    function! DoxygenCommentFuncEnglish()
        let g:DoxygenToolkit_interCommentTag = "* \\~english "
        let g:DoxygenToolkit_interCommentBlock = "* \\~english "
        Dox
    endfunction

    function! DoxygenCommentFuncChinese()
        let g:DoxygenToolkit_interCommentTag = "* \\~chinese "
        let g:DoxygenToolkit_interCommentBlock = "* \\~chinese "
        Dox
    endfunction



"############
" 选择性加载 coc.nvim
" 强大的 nodejs 扩展引擎，为 vim 带来与 vscode 类似的扩展机制
" 但其依赖 node 和版本较新的 vim
" 在首次部署本项目时，会提示是否启用 coc
" 也可以手动创建 vim-plug/enable-coc-plugin 文件来启用（文件内容可为空）
if filereadable(globpath(&rtp, "vim-plug/enable-coc-plugin"))
    "Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
        "let $NVIM_COC_LOG_LEVEL = 'trace'
        " coc 内部插件，coc 服务启动后将会自动安装此处已定义，但本地未安装的插件
        let g:coc_global_extensions =<< trim eval END
            coc-marketplace
            coc-json
            coc-go
            coc-snippets
            coc-sh
            coc-markdownlint
        END

        " Ctrl+Space 触发补全菜单， vim 插入模式下 <C-@> 是 Ctrl+Space
        inoremap <expr> <C-@> coc#refresh()
        " 回车键接受补全
        " 另外默认的 Ctrl-y 也是接受补全，使用 Ctrl-e 取消并关闭补全弹窗
        inoremap <expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

        " Tab 键触发（前面如果有字符的话）、接受补全
        " 同时也支持 snippets 的 placeholder 跳转
        inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ?
            \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ CheckBackspace() ? "\<TAB>" :
            \ coc#refresh()
        function! CheckBackspace() abort
            let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
        let g:coc_snippet_next = '<tab>'

        " 显示文档
        nnoremap <leader>h :call CocActionAsync('doHover')<cr>
        " 滚动浮动窗口，整屏向下、向上，单行向下向上
        if has('nvim-0.4.0') || has('patch-8.2.0750')
            nnoremap <expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
            nnoremap <expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
            nnoremap <expr> <C-e> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<C-e>"
            nnoremap <expr> <C-y> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<C-y>"
        endif
        " 恢复上一次使用的那个 CocList
        nnoremap <F1> :CocListResume<CR>
        " 打开顶层 CocList
        nnoremap <leader>c<space> :CocList<CR>
        " 打开命令列表
        nnoremap <leader>cc :CocCommand<CR>
        " 打开诊断（报错）列表
        nnoremap <leader>cd :CocDiagnostics<CR>
        " 打开大纲
        nnoremap <leader>co :CocOutline<CR>
        " 打开搜索列表
        nnoremap <leader>cs :CocList symbols<CR>
        " 打开重构/重命名列表
        nnoremap <leader>cr :call CocAction('refactor')<CR>
        " 显示调用和类型层级 coc tree
        " 在新窗口中可以使用 Tab 键显示更多菜单，比如显示子类型层级
        nnoremap <leader>chc :call CocAction('showIncomingCalls')<CR>
        nnoremap <leader>cht :call CocAction('showSuperTypes')<CR>
        " 选择 CodeAction
        nnoremap <leader>cf <Plug>(coc-codeaction-cursor)
        " 打开引用列表（下面的所有都属于引用，比较常用，所以重复定义了 gg 映射
        nnoremap <leader>gr <Plug>(coc-references)
        nnoremap <leader>gg <Plug>(coc-references)
        " 跳转定义
        nnoremap <leader>gdf <Plug>(coc-definition)
        " 跳转声明
        nnoremap <leader>gdc <Plug>(coc-declaration)
        " 跳转实现
        nnoremap <leader>gi <Plug>(coc-implementation)
        " 跳转类型定义
        nnoremap <leader>gt <Plug>(coc-type-definition)
        " 打开引用列表（不包含声明和定义，仅展示调用）
        nnoremap <leader>gu <Plug>(coc-references-used)
endif



" 结束插件加载
call plug#end()





" ##########################自动命令设置:autocmds##########################

" 启动vim后如果当前文件不存在则打开NERDTree
function! TryToOpenNERDTree()
    if !filereadable(glob("%"))
        NERDTree
    endif
endfunction
"au VimEnter * call TryToOpenNERDTree()

" 启用TermDebug
au Filetype c,cpp packadd termdebug

" 自动保存和恢复一些vim的状态, 如光标位置, 折叠状态等待
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" 自动高亮当前光标下的单词
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction
"set updatetime=200
"autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()
