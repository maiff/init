"语言相关功能{
	map <f6> :call F6()<CR>
    command CancelDebug :call CancelDebug()
    command LatexToURL :call LatexToURL()

	func! F6()
		" python文件设置断点
		if &filetype == 'python'
            let s:first_line = getline(1)
            if s:first_line != 'import ipdb'
                call append(0, 'import ipdb')
            endif
			let s:n_indent = indent('.')
			let append_content = 'ipdb.set_trace()'
			let append_content = repeat(' ', s:n_indent).append_content
			call append(line('.') - 1, append_content)
			exec 'write'
		" markdown文件向下插入公式
		elseif &filetype == 'markdown'
			call append(line('.'), '<img src="http://chart.googleapis.com/chart?cht=tx&chl=" style="border:none;">')
			call setpos('.', [0, line('.') + 1, 55,0])
		endif
	endfunc

	func! CancelDebug()
		" python文件取消调试
		if &filetype == 'python'
			exec 'g/\v(^[ \t#]*ipdb\.|^import ipdb$)/d'
			exec 'g/\v(^[ \t#]*pdb\.|^import pdb$)/d'
			exec 'write'
        endif
	endfunc

	func! LatexToURL()
		" markdown文件将加号改成URL码
		elseif &filetype == 'markdown'
			exec 's/+/%2B/g'
		endif
	endfunc
" }

" 调试运行{
	map <F5> :call Debug()<CR>
    command Run :call Run()

	func! Debug()
		exec "w" 
		if &filetype == 'c' 
			exec '!g++ % -o %<'
			exec '!time ./%<'
		elseif &filetype == 'cpp'
			exec '!g++ % -o %<'
			exec '!time ./%<'
		elseif &filetype == 'python'
            call VimuxRunCommand("ipython3")
            call VimuxRunCommand("%run ".bufname("%"))
		elseif &filetype == 'sh'
			:!time bash %
		endif                                                                              
	endfunc 

	func! Run()
		exec "w" 
		if &filetype == 'c' 
			exec '!g++ % -o %<'
			exec '!time ./%<'
		elseif &filetype == 'cpp'
			exec '!g++ % -o %<'
			exec '!time ./%<'
		elseif &filetype == 'python'
            call VimuxRunCommand("python3 " . bufname("%"))
		elseif &filetype == 'sh'
			:!time bash %
		endif                                                                              
	endfunc 
" }

" }

" Vundle{
	set nocompatible              " 去除VI一致性,必须
	filetype off                  " 必须

	" 设置包括vundle和初始化相关的runtime path
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" 另一种选择, 指定一个vundle安装插件的路径
	"call vundle#begin('~/some/path/here')

	" 让vundle管理插件版本,必须
	Plugin 'VundleVim/Vundle.vim'

    " 不一定有用
    Plugin 'tpope/vim-repeat'
    Plugin 'mbbill/undotree'
	Plugin 'kien/ctrlp.vim'
	Plugin 'mileszs/ack.vim'
    Plugin 'luochen1990/rainbow'
    "Plugin 'Lokaltog/vim-powerline'
    Plugin 'rking/ag.vim'
    " 绝对有用
    Plugin 'julienr/vim-cellmode'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'majutsushi/tagbar'
    Plugin 'benmills/vimux'
    Plugin 'Yggdroot/indentLine'
	Plugin 'godlygeek/tabular'
	Plugin 'tmhedberg/SimpylFold'
	Plugin 'w0rp/ale'
	Plugin 'davidhalter/jedi-vim'
	"Plugin 'https://github.com/yonchu/accelerated-smooth-scroll.git'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'iamcco/markdown-preview.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'tell-k/vim-autopep8'
	Plugin 'tpope/vim-surround'
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'ervandew/supertab'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'itchyny/lightline.vim'
	Plugin 'fcitx.vim'
	Plugin 'jnurmine/Zenburn'
    Plugin 'zefei/vim-wintabs'
    Plugin 'zefei/vim-wintabs-powerline'

	" 你的所有插件需要在下面这行之前
	call vundle#end()            " 必须
	filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
	" 忽视插件改变缩进,可以使用以下替代:
	"filetype plugin on
	"
	" 简要帮助文档
	" :PluginList       - 列出所有已配置的插件
	" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
	" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
	" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
	"
	" 查阅 :h vundle 获取更多细节和wiki以及FAQ
	" 将你自己对非插件片段放在这行之后" 
" }
"" 折叠设置{
"    set foldmethod=indent
"    set foldlevel=99
"    nnoremap <space> za
"" }
" auto-pairs{
	let g:AutoPairsShortcutJump = '<c-m-n>'
	let g:AutoPairsShortcutToggle = '<c-m-p>'
" }
" jedi-vim{
	let g:jedi#completions_enabled = 0
	let g:jedi#goto_command = "<leader>d"
	let g:jedi#goto_assignments_command = "<leader>a"
	let g:jedi#goto_definitions_command = "<leader>*"
	let g:jedi#documentation_command = "K"
	let g:jedi#usages_command = "<leader>n"
	let g:jedi#completions_command = "<C-J>"
	let g:jedi#rename_command = "<leader>r"
" }
" NERDTree{
	map <C-f> :NERDTreeToggle<CR>
" }
" Supertab{
	let g:SuperTabDefaultCompletionType="<c-n>"
" }
" IndentGuides{
	let g:indent_guides_enable_on_vim_startup = 1 "添加行，vim启动时启用
	let g:indent_guides_start_level = 1           "添加行，开始显示对齐线的缩进级别
	let g:indent_guides_guide_size = 1            "添加行，对齐线的宽度，（1字符）
	let g:indent_guides_tab_guides = 0            "添加行，对tab对齐的禁用
" }
" YouCompleteMe{
	let g:ycm_key_invoke_completion = '<C-/>'
" }
" Tabular{
	nmap <leader><Tab> :Tabularize /#/l2r1<enter>
	vmap <leader><Tab> :Tabularize /#/l2r1<enter>
" }
" ale{
    let g:ale_linters = {'python': ['flake8', 'autopep8', 'pylint']}
	let g:ale_change_sign_column_color=1
    let g:ale_python_flake8_options = '--ignore=E501'
    let g:ale_python_autopep8_options = '--ignore E501'
    nmap <leader>ap <Plug>(ale_previous_wrap)
    nmap <leader>an <Plug>(ale_next_wrap)
    nmap <m-p> <Plug>(ale_previous_wrap)
    nmap <m-n> <Plug>(ale_next_wrap)
" }
" SimpylFold{
	let g:SimpylFold_docstring_preview=1
" }
" 配色方案{
	colorscheme zenburn
    syntax on
	hi Normal  ctermfg=252 ctermbg=none
" }
" ack.vim{
	let g:ackprg = 'ag --nogroup --nocolor --column'
" }
" ctrlp{
	let g:ctrlp_map = '<c-p>'
" }
" markdown-preview{
	let g:mkdp_auto_start = 1
	let g:mkdp_auto_open = 1
	let g:mkdp_auto_close = 0
" }
" vmux{
    map <Leader>vp :VimuxPromptCommand<CR>
" }
" Autopep8{
    let g:autopep8_disable_show_diff=1
    let g:autopep8_ignore="E501,E722"
    let g:autopep8_max_line_length=1079
"}
" F8功能键{
	map <F8> :call F8()<CR>

	func! F8()
        " python下调整pep8格式
		if &filetype == 'python'
			exec 'Autopep8'
        " markdown下预览效果
		elseif &filetype == 'markdown'
			exec 'MarkdownPreview'
		endif
	endfunc
" }
" cellmode{
    let g:cellmode_tmux_sessionname=''
    let g:cellmode_tmux_windowname='ipython3'
    let g:cellmode_tmux_panenumber='1'
" }
" tagbar{
    nnoremap <leader>t :TagbarOpen fj<CR>
" }
" undotree{
    nnoremap <leader>u :UndotreeToggle<cr>
" }
" indentLine{
    let g:indentLine_color_term = 202
    let g:indentLine_char = '|'
    "let g:indentLine_bgcolor_term = 202
" }

" wintabs{
    nmap Y <Plug>(wintabs_previous)
    nmap U <Plug>(wintabs_next)
    nmap <C-w>w <Plug>(wintabs_close)
    nmap <C-w>u <Plug>(wintabs_undo)
    nmap <C-w>o <Plug>(wintabs_only)
    nmap <C-w>^ <Plug>(wintabs_first)
    nmap <C-w>$ <Plug>(wintabs_last)
    nmap - <Plug>(wintabs_move_left)
    nmap + <Plug>(wintabs_move_right)
    "map <C-w>c <Plug>(wintabs_close_window)
    "map <C-w>o <Plug>(wintabs_only_window)
" }

" 通用设置{
	set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
	set encoding=utf8
	set number
    set relativenumber
	set cursorline
	set cursorcolumn
	set tabstop=4
    set expandtab
    set colorcolumn=80
    set foldlevelstart=99
    highlight cursorcolumn cterm=NONE ctermbg='DarkBlue'
    highlight cursorline cterm=NONE ctermbg='DarkMagenta'
    highlight colorcolumn cterm=NONE ctermbg='red'
    hi Visual term=reverse cterm=reverse
    set hls
    nmap <leader>r :source ~/.vimrc<enter>

	" 使用alt键
	let c='a'
	while c <= 'z'
	  exec "set <A-".c.">=\e".c
	  exec "imap \e".c." <A-".c.">"
	  let c = nr2char(1+char2nr(c))
	endw
	
	set timeout ttimeoutlen=50

    set mouse=a

	" 搜索时除非输入大写字母,否则不区分大小写
	set ignorecase
	set smartcase

	" 设置窗口分割方向
	set splitbelow
	set splitright
	set nowrap

	" 切换窗口快捷键
	nnoremap <C-j> <C-w><C-j>
	nnoremap <C-k> <C-w><C-k>
	nnoremap <C-h> <C-w><C-h>
	nnoremap <C-l> <C-w><C-l>

    nnoremap <leader>rc :e ~/.vimrc<CR>

	"按S将一行拆分为两行
	nnoremap S i<enter><esc>
	nmap <s-enter> :w<enter>

	" 命令提示菜单
	set wildmenu

	" 设置永远显示状态栏
	set laststatus=2
	set noshowmode
	" GUI设定
	if has("gui_running") 
		"au GUIEnter * simalt ~x            " 窗口启动时自动最大化
		set guioptions-=m                   " 隐藏菜单栏
		set guioptions-=T                   " 隐藏工具栏
		set guifont=Monospace\ Regular\ 15  " 字体
	endif 

	" 切换目录到当前编辑的文件
	nnoremap <silent> <leader>. :cd %:p:h<CR>
" }
