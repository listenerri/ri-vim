" 不兼容vi
" compatible
set nocp





" ##########################vim选项设置##########################
" 每一个设置上面都有中文翻译,和完整的设置名称
" 因为大部分设置使用的都是简写

" 允许跨行移动的按键
" whichwrap
set ww=b,s,h,l,<,>,[,]

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
set rnu

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
"colorscheme molokai
colorscheme zellner
hi CursorColumn ctermfg=NONE ctermbg=253 cterm=NONE guifg=NONE guibg=gray gui=NONE
hi CursorLine ctermfg=NONE ctermbg=253 cterm=NONE guifg=NONE guibg=gray gui=NONE

" 本段主要针对molokai主题(偏向于个人喜好)
" 设置主题背景为空,就会使用终端的背景色
" 也就是说如果终端背景色透明,则vim透明
"highlight Normal ctermbg=none
" 同上,但设置的是左边的行数背景
"highlight LineNr ctermbg=none
" 修改底部状态栏背景色
"highlight StatusLine ctermfg=0 ctermbg=250
" 当没有文字时的背景色为空,否则不能完全透明
"highlight NonText ctermbg=none

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





" ##########################GUI##########################
if has("gui_running")
    "gui窗口宽高
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
        set guifont=Monaco:h14
        set lines=25
        set columns=100
    endif

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
nnoremap <leader>W :w !sudo tee % > /dev/null<CR>
"nnoremap <leader>e :exit<CR>

" 保证搜索结果高亮,避免下面取消高亮后再次搜索没有高亮
nnoremap n :set hlsearch<CR>n
nnoremap N :set hlsearch<CR>N
nnoremap * :set hlsearch<CR>*
nnoremap # :set hlsearch<CR>#

" 取消搜索的高亮
nnoremap <leader><Space> :set nohlsearch<cr>

" 可视模式下搜索高亮的内容
" 向下搜索
vnoremap / y:set hlsearch<CR>/<C-R>"<CR>
" 向上搜索
vnoremap ? y:set hlsearch<CR>?<C-R>"<CR>

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

" 删除当前buffer
" 如果有多个buffer则自动编辑上一个buffer
" 如果只有当前一个buffer则删除后打开NERDTree
nnoremap <leader>q :call CloseCurrentBuffer()<CR>

function! CloseCurrentBuffer()
    let l:bufsInfo = getbufinfo()
    let l:bufsNrListed = []
    for l:bufInfo in l:bufsInfo
        if get(l:bufInfo, "listed") == 1
            call add(l:bufsNrListed, get(l:bufInfo, "bufnr"))
        endif
    endfor
    let l:bufsNrListedCount = len(l:bufsNrListed)
    if l:bufsNrListedCount <= 1
        execute "bw"
        NERDTreeFocus
    else
        bp
        if bufloaded(bufnr("#"))
            execute "bw #"
        endif
    endif
endfunction

" 删除所有buffer
nnoremap <leader>bc :call CloseListedBuffers()<cr>
" 删除所有buffer,除了当前的
nnoremap <leader>bo :call CloseOtherBuffers()<cr>
" 切换到上一个buffer
nnoremap <leader>bp :bp<cr>
" 切换到下一个buffer
nnoremap <leader>bn :bn<cr>
" 切换到之前的buffer
nnoremap <leader>0 :b#<cr>

function! CloseListedBuffers()
    let l:bufsInfo = getbufinfo()
    for l:bufInfo in l:bufsInfo
        if get(l:bufInfo, "listed") == 1
            let l:bufNr = get(l:bufInfo, "bufnr")
            if bufloaded(l:bufNr)
                execute "bw" l:bufNr
            endif
        endif
    endfor
    NERDTreeFocus
endfunction

function! CloseOtherBuffers()
    let l:bufsInfo = getbufinfo()
    for l:bufInfo in l:bufsInfo
        if get(l:bufInfo, "listed") == 1
            let l:bufNr = get(l:bufInfo, "bufnr")
            if l:bufNr != bufnr("%")
                if bufloaded(l:bufNr)
                    execute "bw" l:bufNr
                endif
            endif
        endif
    endfor
endfunction





"###########################安装/加载插件##########################
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
" fcitx.vim
" 记住fcitx在插入模式的中英状态
" 按ESC键后设置fcitx为英文,进入插入模式后设置为上次离开是的中英状态
" 只适用于unix/linux系统
if has('unix')
    Plug 'lilydjwg/fcitx.vim'
endif


" smartim
" 功能和上面的fctix.vim插件相同
" 但只适用于mac osx系统
if has('mac')
    Plug 'ybian/smartim'
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
    " 标签栏
    let g:airline#extensions#tabline#enabled = 1
    " 显示标签栏序号以及标签内有多少窗口
    let g:airline#extensions#tabline#tab_nr_type = 2
    " 标签栏符号
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
    " 只显示文件名,不显示路径(:h :p查看相关帮助)
    let g:airline#extensions#tabline#fnamemod = ':t'
    " 标签栏切换按键(当只有buffer时也可用于切换buffer)
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
    nmap <leader>- <Plug>AirlineSelectPrevTab
    nmap <leader>= <Plug>AirlineSelectNextTab
    " 主题
    let g:airline_theme='minimalist'
    " 自定义符号
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    " powerline符号
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''
    " 编辑下列文件类型的文件时显示文字总数
    " 多个文件类型用'|'号隔开
    let g:airline#extensions#wordcount#filetypes = '\vtext|mail'
    " 显示ycm检查到的错误和警告的数量
    let g:airline#extensions#ycm#enabled = 1
    let g:airline#extensions#ycm#error_symbol = 'YCM: Ec:'
    let g:airline#extensions#ycm#warning_symbol = 'YCM: Wc:'
    " 开关airline
    nnoremap <leader>at :AirlineToggle<cr>
    " 重新加载airline
    nnoremap <leader>ar :AirlineRefresh<cr>
    " 开关whitespace检查(默认关闭该检查功能)
    let g:airline#extensions#whitespace#enabled = 0
    nnoremap <leader>aw :AirlineToggleWhitespace<cr>


"##########
" ultisnips
" 快速插入代码片段
" 会在ycm弹出的补全菜单中包含又<snip>字样的补全项
" 这些补全项可以插入一段代码,要插入这种补全项需要输入这一项在补全菜单中的完整文字,
" 或者使用上面ycm定义的上下移动键移动到要使用的代码段,然后按<tab>键,即可展开片段
" 代码引擎
Plug 'SirVer/ultisnips'
" 代码片段
Plug 'honza/vim-snippets'
    " 很多虚拟终端不会发送<c-tab>以及<s-tab>到程序,所以应该避免映射这种按键
    " 插入模式下使用tab键插入代码片段
    let g:UltiSnipsExpandTrigger="<tab>"
    " 插入模式下使用s-tab键列出所有的可选片段供选择
    let g:UltiSnipsListSnippets="<s-tab>"
    " 在展开代码片段后使用tab键跳转需要修改的关键部分(如果有的话)
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    " 类似上面的定义,但是反向移动
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    " 可以使用:UltiSnipsEdit命令自定义供补全的代码片段,其保存到下面指定的目录下
    let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
    " 当使用:UltiSnipsEdit命令时在一个垂直新建的窗口中编写
    let g:UltiSnipsEditSplit="vertical"


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
    map f <Plug>(easymotion-prefix)f
    map F <Plug>(easymotion-prefix)F
    map t <Plug>(easymotion-prefix)t
    map T <Plug>(easymotion-prefix)T


"##############
" ale
" 异步检查代码插件
Plug 'w0rp/ale', { 'for': ['java','dosbatch','sh','python'] }
    " 用于检查python的工具, pylint
    " python2:pylint2, python3:pylint3
    let g:ale_python_pylint_executable = 'pylint3'

    " 修改默认的提示符颜色
    " 使用:highlight-link查看link子命令的帮助
    hi link ALEErrorSign ErrorMsg
    hi link ALEWarningSign WarningMsg
    " 强制ale进行语法检查(没什么必要)
    nnoremap <leader>ac :ALELint<cr>


"##############
" vim-fswitch
" c/cpp头文件切换
Plug 'derekwyatt/vim-fswitch', { 'for': ['c','cpp'] }
    map <f4> :FSHere<cr>


"##############
" YouCompleteMe
" 一个多功能的自动补全插件
" 支持c系列,python,go,TypeScript,JavaScript,rust语言补全,
" 支持文件目录/文件名补全
" 支持从vim的omnifunc接收数据补全
" 支持上下文变量以及tags文件补全
" 支持UltiSnips的snippet补全(一个快速插入整块代码的插件)
" 异常强大,但需要手动编译,编译的时候可以选择性的编译上述特性
" 需要注意的是如果vim-plug更新了YCM,那么就有可能需要重新编译
Plug 'Valloric/YouCompleteMe', { 'for': ['java','c','cpp','dosbatch','sh','python','html','xhtml','go'] }
" 为YCM生成ycm_extra_conf文件
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable', 'for': ['java','c','cpp','dosbatch','sh','python','html','xhtml','go'] }
    " 只需要输入一个字符就触发补全
    let g:ycm_min_num_of_chars_for_completion = 1
    " 当没有找到打开的文件或项目的'.ycm_extra_conf.py'时使用哪个作为默认的
    let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_extra_conf-default.py'
    " 加载自定义'.ycm_extra_conf.py'不再询问
    let g:ycm_confirm_extra_conf = 0
    " 使用ctrl-j或下键或ctrl-n在补全菜单中向下移动
    let g:ycm_key_list_select_completion = ['<C-N>']
    " 使用ctrl-k或上键或ctrl-p在补全菜单中向上移动
    let g:ycm_key_list_previous_completion = ['<C-P>']
    " 编辑注释时也自动补全
    let g:ycm_complete_in_comments = 1
    " 从注释和字符串中收集可补全关键字
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    " 将补全项的详细信息放入预览窗口中
    let g:ycm_add_preview_to_completeopt = 1
    " 当接受补全项之后关闭预览窗口
    "let g:ycm_autoclose_preview_window_after_completion = 1
    " 当离开插入模式后,自动关闭用于显示补全项详细信息的预览窗口(上面的选项启用时这个选项可能无效)
    "let g:ycm_autoclose_preview_window_after_insertion = 1
    " 当使用下面定义的GoTo*系列快捷键时使用垂直分割打开新窗口显示数据
    "let g:ycm_goto_buffer_command = 'vertical-split'
    " 指定ycmd使用的py版本, 必须是编译ycm时所用的以及vim支持的py版本
    let g:ycm_server_python_interpreter = 'python3'
    " 指定ycm client使用的python版本(也是jedi使用的python版本)
    let g:ycm_python_binary_path = 'python2'

    " 以下映射对应命令生效的对象一般是光标下的变量或者方法
    " 以下'c*'代表c系列语言
    " 跳转到头文件(c*)
    nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
    " 跳转到声明(c*, go, py, rust)
    nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
    " 跳转到定义(c* go, js, py, rust, typescript)
    nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
    " 跳转到声明或定义(c* go, js, py, rust)
    nnoremap <leader>gg :YcmCompleter GoTo<CR>
    " 获取类型信息(c* js, typescript)
    nnoremap <leader>gt :YcmCompleter GetType<CR>
    " 获取父类信息(c*)
    nnoremap <leader>gp :YcmCompleter GetParent<CR>
    " 获取相关文档(c* py, typescript, js)
    nnoremap <leader>go :YcmCompleter GetDoc<CR>

    " ycm语法检查相关的功能,此功能只支持c系列的语言
    " ycm会禁用syntastic插件关于c系列语言的代码检查
    " 如果要关闭ycm对c*的语法检查, 只使用syntastic,
    " 就取消注释下面这行配置
    "let g:ycm_show_diagnostics_ui = 0
	" 自动将错误信息放入位置列表
	let g:ycm_always_populate_location_list = 1
	" 语法错误或警告时使用的提示字符
	let g:ycm_error_symbol = ">>"
	let g:ycm_warning_symbol = "??"
	" 定义上述提示字符的颜色(默认的看着不舒服)
	" 此处没有重新定义颜色组,而是使用了已定义好的"ErrorMsg"或"WarningMsg"组
	highlight link YcmErrorSign ErrorMsg
	highlight link YcmWarningSign ErrorMsg
	" 快速修复检测到的语法错误
	nnoremap <leader>gf :YcmCompleter FixIt<CR>
	" 强制进行语法检查
	nnoremap <leader>gc :YcmForceCompileAndDiagnostics<CR>
	" 打开错误位置列表窗口
	nnoremap <leader>ge :YcmDiags<CR>


"####################
" previm
" 执行PrevimOpen命令在浏览器中实时预览所编写的markdown文件
Plug 'kannokanno/previm', { 'for': 'markdown' }
    let g:previm_open_cmd = 'firefox'


"############
" vim-quickrun
" 快速运行当前文件或选中的行
Plug 'thinca/vim-quickrun', { 'for': ['sh','java','c','cpp','python'] }
    " 按F5按默认配置快速启动
    nmap <F5> <Plug>(quickrun)
    " 为了避免运行时无法进行交互
    " 所以设置runner为shell, 默认为system
    let g:quickrun_config = {
    \   "_" : {
    \       "runner" : "shell",
    \   },
    \}


"######
" tagbar
" 以对象的方式显示当前文件中的类，变量，方法，等
Plug 'majutsushi/tagbar', { 'for': ['vim','java','c','cpp','python'] }
    " 按<F8>开关tag窗口
    nnoremap <F8> :TagbarToggle<CR><C-W>b


"############
" indentline
" 显示缩进对齐线
Plug 'yggdroot/indentline'
    " 启用水平缩进提示
    let g:indentLine_leadingSpaceEnabled = 1
    let g:indentLine_leadingSpaceChar = '·'
    " 总开关
    nnoremap <leader>ilt :IndentLinesToggle<CR>
    " 水平缩进提示开关
    nnoremap <leader>ist :LeadingSpaceToggle<CR>
    " 编辑markdown文件时不显示
    " 因为会隐藏markdown的部分关键字(如*)，导致编辑时很不方便
    au FileType markdown let g:indentLine_conceallevel = 0
    au FileType json let g:indentLine_conceallevel = 0


"##############
" vim-qt-assistant
" c/cpp头文件切换
Plug 'listenerri/vim-qt-assistant', { 'for': ['cpp'] }
    noremap <f1> :call GetDocFromAssistant()<cr>


"##############
" vim-multiple-cursors
" 实现同时编辑多个位置
" 使用<c-n>开始选择位置, <c-p>取消当前的选择,返回上一个
" <c-x>跳过下一个匹配, <esc>终止操作
" 选择完毕之后可以使用I,A,c,s开始是修改所有选择的位置
Plug 'terryma/vim-multiple-cursors'


"##############
" vim-easygrep
Plug 'listenerri/vim-easygrep', { 'branch': 'ag-recursive-switch' }
    " 使用grepprg选项指定的外部命令搜索
    "set grepprg=ack
    set grepprg=ag\ -U\ $*
    let g:EasyGrepCommand = 1
    " 哪些文件或目录需要排除
    let g:EasyGrepFilesToExclude = ".svn,.git,build"
    " 默认递归搜索
    let g:EasyGrepRecursive = 1
    " 在结果中列出同一行的多个匹配项
    let g:EasyGrepEveryMatch = 1
    " 不自动跳转到第一个匹配项
    let g:EasyGrepJumpToMatch = 0
    " 结果列表窗口在哪里出现
    let EasyGrepWindowPosition = "rightbelow"
    " 快速设置EasyGrep选项的前缀(默认是'<leader>vy')
    " 按下前缀后再按一个代表对应选项的字母就可以切换该选项(如递归,大小写等)
    " 具体有哪些字母(选项)可以打开选项列表查看(在选项列表中按?显示更多选项)
    let g:EasyGrepOptionPrefix = '<leader>fs'
    " 打开选项列表(options list)
    nmap <leader>fl <plug>EgMapGrepOptions
    " 下面的按键含有大写的表示搜索时使用'whole word'模式
    " vnoremap的表示在可视模式下搜索选择的内容
    " nnoremap的表示搜索光标下的单词
    " f: 搜索并将结果展示在列表中
    " a: 搜索并将结果追加在列表中
    " r: 搜索并替换(交互模式)
    nmap <leader>ff <plug>EgMapGrepCurrentWord_v
    vmap <leader>ff <plug>EgMapGrepSelection_v
    nmap <leader>fF <plug>EgMapGrepCurrentWord_V
    vmap <leader>fF <plug>EgMapGrepSelection_V
    nmap <leader>fa <plug>EgMapGrepCurrentWord_a
    vmap <leader>fa <plug>EgMapGrepSelection_a
    nmap <leader>fA <plug>EgMapGrepCurrentWord_A
    vmap <leader>fA <plug>EgMapGrepSelection_A
    nmap <leader>fr <plug>EgMapReplaceCurrentWord_r
    vmap <leader>fr <plug>EgMapReplaceSelection_r
    nmap <leader>fR <plug>EgMapReplaceCurrentWord_R
    vmap <leader>fR <plug>EgMapReplaceSelection_R


" NERD-Commenter
" 提供注释功能
Plug 'scrooloose/nerdcommenter', { 'for': ['vim','java','c','cpp','dosbatch','sh','python','html','xhtml'] }


" qt相关插件
" qt语法高亮
Plug 'kosl90/qt-highlight-vim'
" qmake语法高亮
Plug 'vim-scripts/qmake--syntax.vim'
    " 设置类似pro，pri等文件的filetype为qmake，以激活这个语法高亮插件
    au BufReadPost *.pr? setfiletype qmake


" 结束插件加载
call plug#end()





" ##########################自动命令设置##########################

" 打开文件后自动跳转到上次离开的位置
"autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 让theme/qss文件使用css的语法高亮(主要针对qt)
au BufReadPost *.theme setfiletype css
au BufReadPost *.qss setfiletype css
" 让qrc文件使用xml的语法高亮(主要针对qt)
au BufReadPost *.qrc setfiletype xml

" 自动保存和恢复一些vim的状态, 如光标位置, 折叠状态等待
au BufWinLeave * mkview
au BufWinEnter * silent! loadview
