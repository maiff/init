" 通用设置{
	set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
	set encoding=utf8
	set number
	set cursorline
	set cursorcolumn
	set tabstop=4
    set expandtab
    set colorcolumn=80

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

	"按S将一行拆分为两行
	nnoremap S i<enter><esc>
	map <C-s> :w<enter>

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

" 语言相关功能{
	map <f6> :call F6()<CR>
    command CancelDebug :call CancelDebug()
    command LatexToURL :call LatexToURL()

	func! F6()
		" python文件设置断点
		if &filetype == 'python'
            let s:first_line = getline(1)
            if s:first_line != 'import pdb'
                call append(0, 'import pdb')
            endif
			let s:n_indent = indent('.')
			let append_content = 'pdb.set_trace()'
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

	" 以下范例用来支持不同格式的插件安装.
	" 请将安装插件的命令放在vundle#begin和vundle#end之间.
	" Github上的插件
	" 格式为 Plugin '用户名/插件仓库名'
	" Plugin 'tpope/vim-fugitive'
	" 来自 http://vim-scripts.org/vim/scripts.html 的插件
	" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
	" Plugin 'L9'
	" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
	" Plugin 'git://git.wincent.com/command-t.git'
	" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
	" Plugin 'file:///home/gmarik/path/to/plugin'
	" 插件在仓库的子目录中.
	" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
	" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
	" Plugin 'ascenator/L9', {'name': 'newL9'}
    Plugin 'julienr/vim-cellmode'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'benmills/vimux'
    Plugin 'Yggdroot/indentLine'
	Plugin 'godlygeek/tabular'
	Plugin 'tmhedberg/SimpylFold'
	Plugin 'w0rp/ale'
	Plugin 'davidhalter/jedi-vim'
	Plugin 'https://github.com/yonchu/accelerated-smooth-scroll.git'
	Plugin 'kien/ctrlp.vim'
	Plugin 'mileszs/ack.vim'
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

" 折叠设置{
	set foldmethod=indent
	set foldlevel=99
	nnoremap <space> za
" }

" jedi-vim配置{
	let g:jedi#completions_enabled = 0
	let g:jedi#goto_command = "<leader>d"
	let g:jedi#goto_assignments_command = "<leader>a"
	let g:jedi#goto_definitions_command = "<leader>*"
	let g:jedi#documentation_command = "K"
	let g:jedi#usages_command = "<leader>n"
	let g:jedi#completions_command = "<C-J>"
	let g:jedi#rename_command = "<leader>r"
" }

" 有道翻译{
	vnoremap <silent> <C-T> :<C-u>Ydv<CR>
	nnoremap <silent> <C-T> :<C-u>Ydc<CR>
	cmap yd <C-u>Yde<CR>
	cmap youdao <C-u>Yde<CR>
	noremap <leader>yd :<C-u>Yde<CR>
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
	let g:ale_change_sign_column_color=1
    let g:ale_python_flake8_options = '--ignore=E501'
    let g:ale_python_autopep8_options = '--ignore E501'
" }

" SimpylFold{
	let g:SimpylFold_docstring_preview=1
" }

" 配色方案{
	colorscheme zenburn
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
    map <Leader>vm :VimuxPromptCommand("make ")<CR>
" }

" Autopep8{
    let g:autopep8_disable_show_diff=1
    let g:autopep8_ignore="E501"
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
