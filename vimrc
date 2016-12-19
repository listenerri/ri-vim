" 不兼容vi
" compatible
set nocp





" ##########################vim选项设置##########################
" 每一个设置上面都有中文翻译,和完整的设置名称
" 因为大部分设置使用的都是简写

" 允许跨行移动的按键
" whichwrap
set ww=b,s,h,l,<,>

" 禁止跳转时光标移动到非空字符
" 默认当跳转时光标会移动到那一行的非空字符处
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
colorscheme molokai

" 本段主要针对molokai主题(偏向于个人喜好)
" 设置主题背景为空,就会使用终端的背景色
" 也就是说如果终端背景色透明,则vim透明
highlight Normal ctermbg=none
" 同上,但设置的是左边的行数背景
highlight LineNr ctermbg=none
" 修改底部状态栏背景色
highlight StatusLine ctermfg=0 ctermbg=250
" 当没有文字时的背景色为空,否则不能完全透明
highlight NonText ctermbg=none

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

" 快速移动到行尾航首
" 直接使用map命令从而全局不适用H,L的原功能
map H ^
map L $

" 复制到系统剪切板
noremap <leader>y "+y

" 复制行到系统剪切板
noremap <leader>Y "+yy

" 剪切到系统剪切板
noremap <leader>d "+d

" 从系统剪切板粘贴
noremap <leader>p "+p
noremap <leader>P "+P

" 保存和退出
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" 保证搜索结果高亮,避免下面取消高亮后在此搜索没有高亮
nnoremap / :set hlsearch<CR>/
nnoremap n :set hlsearch<CR>nzz
nnoremap N :set hlsearch<CR>Nzz

" 取消搜索的高亮
nnoremap <leader><Space> :set nohlsearch<cr>

" 快速搜索光标下的单词
" 向下搜索
nnoremap <leader>/ :set hlsearch<CR>viwy/<C-R>"<CR>
" 向上搜索
nnoremap <leader>? :set hlsearch<CR>viwy?<C-R>"<CR>

" 快速可视模式下搜索高亮的内容
" 向下搜索
vnoremap / y:set hlsearch<CR>/<C-R>"<CR>
" 向上搜索
vnoremap ? y:set hlsearch<CR>?<C-R>"<CR>

" 窗口切换
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" 确保方法体的开始和结束标记:'{'和'}'不在第一列时,
" 使用下列跳转命令也可以跳转到正确的位置
" 命令解释:
" ]]:下一个方法体的开始标记'{'
" ][:下一个方法体的结束标记'}'
" [[:上一个方法体的开始标记'{'
" []:上一个方法体的结束标记'{'
nmap [[ ?{<CR>w99[{
nmap ][ /}<CR>b99]}
nmap ]] j0[[%/{<CR>
nmap [] k$][%?}<CR>

" 打开当前窗口的位置列表
nnoremap <leader>lo :lopen<cr>
" 跳转到当前窗口位置列表的下一项和前一项
" 当syntastic或ycm检测到语法错误时可使用此映射跳转下一个或前一个错误
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>




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
" vim-airline
" 高度可定制的状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    " 主题
    let g:airline_theme='molokai'
    " 自定义unicode符号
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.space = ' '
    let g:airline_symbols.readonly = 'RO'
    let g:airline_symbols.modified = '+'
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
" syntastic
" 支持大量编程语言的语法检查
" 但只在执行写入命令后才自动检查语法,也可以手动执行检查命令
" 当打开c系列的文件时,不加载本插件,因为ycm插件会禁用本插件,
" ycm插件已经包含有c系列的语法检查功能而且更好用,详细看ycm配置部分
Plug 'vim-syntastic/syntastic', { 'for': ['java','dosbatch','sh','python'] }
    " 打开文件时就执行语法检查
    let g:syntastic_check_on_open = 1
    " 执行:wq命令时不执行语法检查
    let g:syntastic_check_on_wq = 0
    " 错误及警告标志
    let g:syntastic_error_symbol = ">>"
    let g:syntastic_warning_symbol = "??"
    let g:syntastic_style_error_symbol = "S>"
    let g:syntastic_style_warning_symbol = "S?"
    " 警告标志的颜色
    highlight link SyntasticErrorSign ErrorMsg
    highlight link SyntasticWarningSign ErrorMsg
    " 自动将错误信息放入位置列表
    let g:syntastic_always_populate_loc_list = 1
    " 打开错误位置列表窗口
    nnoremap <leader>se :Errors<cr>
    " 强制进行语法检查
    nnoremap <leader>sc :SyntasticCheck<cr>


"##########
" fcitx.vim
" 记住fcitx在插入模式的中英状态
" 按ESC键后设置fcitx为英文,进入插入模式后设置为上次离开是的中英状态
Plug 'lilydjwg/fcitx.vim'


"##############
" YouCompleteMe
" 条件加载
" 一个多功能的自动补全插件
" 支持c系列,python,go,TypeScript,JavaScript,rust语言补全,
" 支持文件目录/文件名补全
" 支持从vim的omnifunc接收数据补全
" 支持上下文变量以及tags文件补全
" 支持UltiSnips的snippet补全(一个快速插入整块代码的插件)
" 异常强大,但需要手动编译,编译的时候可以选择性的编译上述特性
" 需要注意的是如果vim-plug更新了YCM,那么就需要重新编译
" 更多介绍参见此项目主页(https://github.com/Valloric/YouCompleteMe)
Plug 'Valloric/YouCompleteMe', { 'for': ['java','c','cpp','dosbatch','sh','python'] }
    " 当没有找到打开的文件或项目的'.ycm_extra_conf.py'时使用哪个作为默认的
    let g:ycm_global_ycm_extra_conf = '~/.vim/vim-plug/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    " 使用ctrl-j或下键或ctrl-n在补全菜单中向下移动
    let g:ycm_key_list_select_completion = ['<C-N>', '<Down>']
    " 使用ctrl-k或上键或ctrl-p在补全菜单中向上移动
    let g:ycm_key_list_previous_completion = ['<C-P>', '<Up>']
    " 编辑注释时也自动补全
    let g:ycm_complete_in_comments = 1
    " 从注释和字符串中收集可补全关键字
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    " 当离开插入模式后,自动关闭用于显示补全项详细信息的预览窗口
    let g:ycm_autoclose_preview_window_after_insertion = 1
    " 当使用下面定义的GoTo*系列快捷键时使用垂直分割打开新窗口显示数据
    let g:ycm_goto_buffer_command = 'vertical-split'

    " 以下映射对应命令生效的对象一般是光标下的变量或者方法
    " 跳转到头文件(c, cpp, objc, objcpp)
    nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
    " 跳转到声明(c, cpp, objc, objcpp, cs, go, python, rust)
    nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
    " 跳转到定义(c, cpp, objc, objcpp, cs, go, javascript, python, rust, typescript)
    nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
    " 跳转到声明或定义(c, cpp, objc, objcpp, cs, go, javascript, python, rust)
    nnoremap <leader>gg :YcmCompleter GoTo<CR>
    " 获取类型信息(c, cpp, objc, objcpp, javascript, typescript)
    nnoremap <leader>gt :YcmCompleter GetType<CR>
    " 获取父类信息(c, cpp, objc, objcpp)
    nnoremap <leader>gp :YcmCompleter GetParent<CR>
    " 获取相关文档(c, cpp, objc, objcpp, cs, python, typescript, javascript)
    nnoremap <leader>go :YcmCompleter GetDoc<CR>

    " ycm语法检查相关的功能,此功能只支持c系列的语言
    " ycm会禁用syntastic插件关于c系列语言的代码检查
    " 如果要关闭ycm对c系列语言的语法检查就取消注释下面这行配置
    " 并注释掉下面这行配置之后缩进的那部分ycm配置就可以只使用syntastic插件了
    "let g:ycm_show_diagnostics_ui = 0
	" 自动将错误信息放入位置列表
	let g:ycm_always_populate_location_list = 1
	" 语法错误或警告时使用的提示字符
	let g:ycm_error_symbol = ">>"
	let g:ycm_warning_symbol = "??"
	" 定义上述提示字符的颜色(默认的看着不舒服)
	" 此处没有重新定义颜色组,而是使用了已定义好的"ErrorMsg"和"WarningMsg"组
	highlight link YcmErrorSign ErrorMsg
	highlight link YcmWarningSign WarningMsg
	" 快速修复检测到的语法错误
	nnoremap <leader>gf :YcmCompleter FixIt<CR>
	" 强制进行语法检查
	nnoremap <leader>gc :YcmForceCompileAndDiagnostics<CR>
	" 打开错误位置列表窗口
	nnoremap <leader>ge :YcmDiags<CR>


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


" #################
" vim-javacomplete2
" 条件加载
" java自动补全,可配合ycm实现自动补全,javacomplete2是javacomplete的增强版
" 第一次打开比较慢,是因为要在~/.cache下生成缓存文件
" 提供了一系列:JC开头的命令,更能基本对应下面定义的快捷键,
" 详细介绍可以使用:h javacomplete.txt查看
" 只有在打开java类型的文件时才加载本插件
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
    " 自动设置java类型文件为omnifunc补全
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    " 插件会自动设置一些在插入模式下<c-j>的映射,导致使用<c-j>选择ycm
    " 的补全菜单有问题,所以禁止插件自动映射按键
    let g:JavaComplete_EnableDefaultMappings = 0
    " 当打开java类型文件时设置如下按键映射:
    " jA   打开一个新窗口,包含了光标所在类的所有变量的setter和getter方法
    "      手动删除不需要的方法后按s键生成到正在编辑的java文件中,按q退出
    " js   生成光标所在附近变量的setter方法
    " jg   生成光标所在附近变量的getter方法
    " ja   生成光标所在附近变量的setter和getter方法
    " jc   生成默认的构造方法
    " jC   同jA但生成的是有参数的构造方法
    " ji   为光标下或光标前的类名增加import语句
    " jI   为所有类增加缺失的import语句
    " jR   移除所有未使用的import语句
    " jM   从implement的接口来增加需要实现的方法
    function! s:MyJavaMappings()
	nmap <buffer> <leader>jA <Plug>(JavaComplete-Generate-Accessors)
	nmap <buffer> <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
	nmap <buffer> <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
	nmap <buffer> <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
	nmap <buffer> <leader>jc <Plug>(JavaComplete-Generate-DefaultConstructor)
	nmap <buffer> <leader>jC <Plug>(JavaComplete-Generate-Constructor)
	nmap <buffer> <leader>ji <Plug>(JavaComplete-Imports-Add)
	nmap <buffer> <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
	nmap <buffer> <leader>jr <Plug>(JavaComplete-Imports-RemoveUnused)
	nmap <buffer> <leader>jm <Plug>(JavaComplete-Generate-AbstractMethods)
    endfunction
    autocmd BufEnter *.java call s:MyJavaMappings()


" #################
" vim-instant-markdown
" 条件加载
" 在浏览器中实时预览所编写的markdown文件
" 需要另外安装node.js的一个名叫"instant-markdown-d"模块
" 而且要求以全局方式安装这个模块,具体命令是:
" sudo npm -g install instant-markdown-d
" 如果出现问题请到(https://github.com/suan/vim-instant-markdown)
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
" 取消自动启动预览,需要启动预览时使用命令:InstantMarkdownPreview
" 如需自动启动则注销掉下面的配置即可
let g:instant_markdown_autostart = 0


" ############
" vim-quickrun
" 条件加载
" 快速运行当前文件或选中的行
Plug 'thinca/vim-quickrun', { 'for': ['java','c','cpp','python'] }
" 按F5按默认配置快速启动
nmap <F5> <Plug>(quickrun)


" ######
" tagbar
" 条件加载
" 以对象的方式显示当前文件中的类，变量，方法，等
Plug 'majutsushi/tagbar', { 'for': ['java','c','cpp','python'] }
" 按<F8>开关tag窗口
nnoremap <F8> :TagbarToggle<CR>

" 结束插件加载
call plug#end()





" ##########################netrw自带的文件浏览器##########################
" 在文件浏览窗口具体的用法请使用:h netrw-quickmap命令查看
" 按o键在文件列表窗口下边新建水平窗口打开光标下的文件或目录
" 值为零时，在上面新建水平窗口
let g:netrw_alto=1
" 按v键在文件列表窗口右边新建水平窗口打开光标下的文件或目录
" 值为零时，在左边新建垂直窗口
let g:netrw_altv=1
" 默认以树状形式显示文件列表
let g:netrw_liststyle=3
" 关闭鼠标功能(容易出错)
let g:netrw_mousemaps=0
" 设置在文件列表窗口使用o或者v打开的窗口的大小(百分比)
" 同时也设置了使用:Explore,:Sexplore,:Vexplore,:Hexplore系列命令打开文件列表窗口的大小
let g:netrw_winsize=80
" 使用<F2>开关当前目录文件列表窗口
" 如果要分析下面的方法，需要留意缓冲区编号和窗口编号的区别
function! ToggleVExplorer()
    "如果netrw缓冲区号存在
    if exists("t:expl_buf_num")
	"由netrw缓冲区号获取已打开的netrw窗口编号
	let expl_win_num = bufwinnr(t:expl_buf_num)
	"如果netrw窗口编号不是-1(说明窗口处于打开状态)
	if expl_win_num != -1
	    "获取当前窗口(非netrw)编号
	    let cur_win_nr = winnr()
	    "切换到netrw窗口
	    exec expl_win_num . 'wincmd w'
	    "关闭netrw窗口
	    close
	    "切换到之前的窗口
	    exec cur_win_nr . 'wincmd w'
	    "删除记录的netrw缓冲区号
	    unlet t:expl_buf_num
	"如果netrw窗口编号不存在(关闭netrw没有使用<F2>键时的情况)
	else
	    "删除记录的netrw缓冲区号
	    unlet t:expl_buf_num
	    "打开netrw窗口
	    20Vexplore
	    "记录netrw缓冲区号
	    let t:expl_buf_num = bufnr("%")
	endif
    else
	"打开netrw窗口
	20Vexplore
	"记录netrw缓冲区号
	let t:expl_buf_num = bufnr("%")
    endif
endfunction
nnoremap <F2> :call ToggleVExplorer()<CR>





" ##########################自动命令设置##########################

"打开文件后自动跳转到上次离开的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
