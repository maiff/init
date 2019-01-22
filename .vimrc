" 通用设置{
    let mapleader=','                             " leader key
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
    set hidden
    set autoindent
    set copyindent
    set hls
    set incsearch
    set wildignore=*.swp,*.bak,*.pyc,*.class
    set backspace=start,indent
	" 搜索时除非输入大写字母,否则不区分大小写
	set ignorecase
	set smartcase
	" 设置窗口分割方向
	set splitbelow
	set splitright
	set nowrap
	" 命令提示菜单
	set wildmenu
	" 设置永远显示状态栏
	set laststatus=2
	set noshowmode
	set t_Co=256

	set timeout ttimeoutlen=50
    set mouse=a

	" GUI设定
	if has("gui_running") 
		"au GUIEnter * simalt ~x            " 窗口启动时自动最大化
		set guioptions-=m                   " 隐藏菜单栏
		set guioptions-=T                   " 隐藏工具栏
		set guifont=Monospace\ Regular\ 15  " 字体
	endif 
" }

" Plugins{
	set nocompatible              " 去除VI一致性,必须
	filetype off                  " 必须

	call plug#begin('~/.vim/plugged')

    " 不一定有用
    Plug 'chrisbra/csv.vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'easymotion/vim-easymotion'
    Plug 'rbong/vim-buffest'
    Plug 'tpope/vim-fugitive'
    Plug 'yegappan/mru'
    Plug 'chrisbra/vim-diff-enhanced'
    Plug 'plasticboy/vim-markdown'
    "Plug 'julienr/vim-cellmode'
    "Plug 'ivanov/vim-ipython'
    "Plug 'SleepyBag/nvim-ipy'
    "Plug 'cjrh/vim-conda'
    "Plug 'Vigemus/iron.nvim'
    "Plug 'szymonmaszke/vimpyter'
    "Plug 'jjhelmus/vim-ipython'
    "Plug 'prabirshrestha/async.vim'
    "Plug 'prabirshrestha/asyncomplete.vim'
    "Plug 'prabirshrestha/vim-lsp'
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


    " 绝对有用
    Plug 'tpope/vim-capslock'
    Plug 'mbbill/undotree'
	"Plug 'kien/ctrlp.vim'
	Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-repeat'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'majutsushi/tagbar'
    Plug 'benmills/vimux'
    Plug 'Yggdroot/indentLine'
	Plug 'godlygeek/tabular'
	Plug 'tmhedberg/SimpylFold'
	"Plug 'w0rp/ale'
    Plug 'davidhalter/jedi-vim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'iamcco/markdown-preview.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'tell-k/vim-autopep8'
	Plug 'tpope/vim-surround'
	Plug 'jiangmiao/auto-pairs'
	"Plug 'ervandew/supertab'
    "Plug 'Valloric/YouCompleteMe'
    Plug 'itchyny/lightline.vim'
	"Plug 'fcitx.vim'
	Plug 'jnurmine/Zenburn'
    Plug 'zefei/vim-wintabs'
    Plug 'zefei/vim-wintabs-powerline'
    Plug 'junegunn/fzf.vim'
    Plug 'ayuanx/vim-mark-standalone'

    " enable plugin fzf
    set rtp+=/home/$USER/.linuxbrew/opt/fzf

	" 你的所有插件需要在下面这行之前
	call plug#end()
	filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

    " Required for operations modifying multiple buffers like rename.
    "
    " deoplete
    let g:deoplete#enable_at_startup = 1

    " neovim-lsp
    set hidden
    
    let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
        \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
        \ 'python': ['/home/qmxue/anaconda3/bin/pyls'],
        \ }
    
    "nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    "nnoremap <buffer> <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
    "nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    "nnoremap <buffer> <silent> <leader>r :call LanguageClient#textDocument_references()<CR>
    
    "" vim-lsp
    "if executable('pyls')
    "" pip install python-language-server
    "au User lsp_setup call lsp#register_server({
    "    \ 'name': 'pyls',
    "    \ 'cmd': {server_info->['pyls']},
    "    \ 'whitelist': ['python'],
    "    \ })
    "endif 

    "" asyncomplete.vim
    "inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    "inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
    "imap <c-o> <Plug>(asyncomplete_force_refresh)
    "let g:asyncomplete_smart_completion = 1
    "let g:asyncomplete_auto_popup = 1

    "" nvim-ipy
    "let g:nvim_ipy_perform_mappings = 0
    "nmap <leader>i :Ipy<CR>
    "nmap <silent> <CR> <Plug>(IPy-Run)j0
    "vmap <silent> <CR> <Plug>(IPy-Run)
    "nmap <silent> <c-s> <Plug>(IPy-RunCell)
    ""imap <silent> <c-i> <Plug>(IPy-Complete)
    ""nmap <silent> ? <Plug>(IPy-WordObjInfo)
    "nmap <silent> <c-c> <Plug>(IPy-Interrupt)
    "nmap <silent> <c-t> <Plug>(IPy-Terminate)

    " vim-markdown
    let g:vim_markdown_conceal = 0

    " fzf
    nnoremap <c-p> :FZF |
    nnoremap <silent> <leader>/ :BLines<enter>

    " lightline
    let g:lightline = {'colorscheme': 'default'}
    "let g:lightline.component_expand = {
    "    \ 'currenttag': tagbar#currenttag('%s', '')}
    let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste'],
        \           [ 'readonly', 'relativepath', 'modified' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ],
        \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }

    " zenburn
    colorscheme wombat
    syntax on
    hi Normal  ctermfg=252 ctermbg=none
    hi Visual term=reverse cterm=reverse
    highlight cursorcolumn cterm=NONE ctermbg='DarkBlue'
    highlight cursorline cterm=NONE ctermbg='DarkMagenta'
    highlight colorcolumn cterm=NONE ctermbg='red'
    "hi DiffAdd          ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse        gui=reverse
    "hi DiffChange       ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse        gui=reverse
    "hi DiffDelete       ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse        gui=reverse
    "hi DiffText         ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse        gui=reverse
    hi DiffAdd          ctermbg=black       ctermfg=green       cterm=reverse
    hi DiffChange       ctermbg=black       ctermfg=magenta     cterm=reverse
    hi DiffDelete       ctermbg=black       ctermfg=darkred     cterm=reverse
    hi DiffText         ctermbg=black       ctermfg=red         cterm=reverse

    " auto-pairs
    let g:AutoPairsShortcutJump = ''
    let g:AutoPairsShortcutToggle = ''
    let g:AutoPairsShortcutBackInsert = ''

    " jedi-vim
    let g:jedi#completions_enabled = 0
    let g:jedi#goto_command = "<leader>d"
    let g:jedi#goto_assignments_command = "<leader>a"
    let g:jedi#goto_definitions_command = "<leader>*"
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>n"
    let g:jedi#completions_command = "<C-J>"
    let g:jedi#rename_command = "<leader>r"

    " NERDTree
    nnoremap <C-f> :cd %:p:h<CR>:NERDTree<CR>

    " Supertab
    let g:SuperTabDefaultCompletionType="<c-n>"

    " IndentGuides
    let g:indent_guides_enable_on_vim_startup = 1 "添加行，vim启动时启用
    let g:indent_guides_start_level = 1           "添加行，开始显示对齐线的缩进级别
    let g:indent_guides_guide_size = 1            "添加行，对齐线的宽度，（1字符）
    let g:indent_guides_tab_guides = 0            "添加行，对tab对齐的禁用

    " YouCompleteMe
    let g:ycm_key_invoke_completion = '<C-/>'

    " Tabular
    nmap <leader><Tab> :Tabularize /#/l2r1<enter>
    vmap <leader><Tab> :Tabularize /#/l2r1<enter>

    "" ale
    "let g:ale_linters = {'python': ['flake8', 'autopep8', 'pylint']}
    "let g:ale_change_sign_column_color=1
    "let g:ale_python_flake8_options = '--ignore=E501'
    "let g:ale_python_autopep8_options = '--ignore E501'
    "nmap - <Plug>(ale_previous_wrap)
    "nmap = <Plug>(ale_next_wrap)

    " mark.vim
    nmap <leader>msan <Plug>MarkSearchAnyNext
    let g:mwDefaultHighlightingPalette = 'extended'

    " SimpylFold
    let g:SimpylFold_docstring_preview=1

    " ack.vim
    let g:ackprg = 'ag --nogroup --nocolor --column'

    " markdown-preview
    let g:mkdp_auto_start = 1
    let g:mkdp_auto_open = 1
    let g:mkdp_auto_close = 0

    " vmux
    map <Leader>vp :VimuxPromptCommand<CR>

    " Autopep8
    let g:autopep8_disable_show_diff=1
    let g:autopep8_ignore="E501,E722"
    let g:autopep8_max_line_length=1079

    " tagbar
    nnoremap <leader>t :TagbarOpen fj<CR>
    let g:tagbar_width = 20
    let g:tagbar_left = 1

    " undotree
    nmap <leader>u :UndotreeToggle<cr>

    " indentLine
    let g:indentLine_color_term = 202
    let g:indentLine_char = '│'
    "let g:indentLine_bgcolor_term = 202

    " wintabs
    nmap Y <Plug>(wintabs_previous)
    nmap U <Plug>(wintabs_next)
    nmap <C-w>w <Plug>(wintabs_close)
    nmap <C-w>u <Plug>(wintabs_undo)
    nmap <C-w>o <Plug>(wintabs_only)
    nmap <C-w>^ <Plug>(wintabs_first)
    nmap <C-w>$ <Plug>(wintabs_last)
    nmap _ <Plug>(wintabs_move_left)
    nmap + <Plug>(wintabs_move_right)
    let g:wintabs_ui_readonly = '|ro'
    let g:wintabs_ui_buffer_name_format = '%n: %t'
" }

" my own functions{
	noremap <f6> :call F6()<CR>
    command! CancelDebug :call CancelDebug()
    command! LatexToURL :call LatexToURL()
    command! CopyMode :call CopyMode()

	func! F6()
		" python文件设置断点
		if &filetype == 'python'
            "let s:first_line = getline(1)
            "if s:first_line != 'import ipdb'
            "    call append(0, 'import ipdb')
            "endif
			let s:n_indent = indent('.')
			let append_content = 'import ipdb'
			let append_content = repeat(' ', s:n_indent).append_content
			call append(line('.') - 1, append_content)
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
		    let l:winview = winsaveview()
			exec 'g/\v(^[ \t#]*i?pdb\.|^[ \t#]*import i?pdb$)/d'
			exec 'write'
            call winrestview(l:winview)
        endif
	endfunc

	func! LatexToURL()
		" markdown文件将加号改成URL码
		elseif &filetype == 'markdown'
			exec 's/+/%2B/g'
		endif
	endfunc

    " 调试运行
    noremap <F5> :call Debug()<CR>
    command! Run :call Run()

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

    " F8功能键
	noremap <F8> :call F8()<CR>

	func! F8()
        " python下调整pep8格式
		if &filetype == 'python'
			exec 'Autopep8'
        " markdown下预览效果
		elseif &filetype == 'markdown'
			exec 'MarkdownPreview'
		endif
	endfunc

	let g:isCopyMode = 0
	func! CopyMode()
		if g:isCopyMode == 0
			let g:isCopyMode = 1
			set paste
			set wrap
			set nonumber
			set norelativenumber
			exec 'IndentLinesDisable'
		else
			let g:isCopyMode = 0
            set nopaste
			set nowrap
			set number
			set relativenumber
			exec 'IndentLinesDisable'
		endif
    endfunc
" }

" General settings 
" {
    set showcmd
" }

"inoremap <C-b> <Left>
"inoremap <C-f> <Right>
"inoremap <C-n> <Down>
"inoremap <C-p> <Up>
"inoremap <C-e> <End>
"inoremap <C-a> <Home>
"inoremap <C-h> <BS>
"inoremap <C-d> <Del>
"inoremap <C-u> <Right><ESC>d<Home>i
"inoremap <C-k> <Right><ESC>d<End>a
"inoremap <C-t> <Right><ESC>xpi
"inoremap <M-b> <Right><ESC>bi
"inoremap <M-f> <Right><ESC>wi
"inoremap <M-h> <Right><ESC>dbi
"inoremap <M-d> <Right><ESC>dwi

let g:python_location = system('which python')
let g:python_location = substitute(g:python_location, '\n', '', 'g')
let g:python3_host_prog=g:python_location

" better key binding
nnoremap \ ,
"nnoremap : ,
nnoremap <space> :
vnoremap <space> :
nnoremap <bs> "_|                             " use backspace to delete things into the blackhole
vnoremap <bs> "_|                             " use backspace to delete things into the blackhole
nnoremap zl zL|                               " moving the view horizontally
nnoremap zL zl
nnoremap zh zH
nnoremap zH zh
nnoremap <silent> <leader>rc :e ~/.vimrc<CR>
nnoremap <silent> <leader>rl :so $MYVIMRC<CR>
"nnoremap <C-j> <C-w><C-j>|                        " swtich current window
"nnoremap <C-k> <C-w><C-k>
"nnoremap <C-h> <C-w><C-h>
"nnoremap <C-l> <C-w><C-l>
nnoremap S i<enter><esc>
nnoremap <silent> <leader>. :cd %:p:h<CR>|    " switch the directory to the current file's
tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <c-j>  <C-\><C-n><c-w>j
tnoremap <c-h>  <C-\><C-n><c-w>h
tnoremap <c-k>  <C-\><C-n><c-w>k
tnoremap <c-l>  <C-\><C-n><c-w>l
