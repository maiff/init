function! myspacevim#before() abort
  let g:spacevim_lint_on_save = 0
  let g:spacevim_lint_on_the_fly = 1
  let g:mapleader  = ','
  let g:maplocalleader  = ','

  " call SpaceVim#mapping#space#langSPC('nmap', ['l','i'],
  "       \ '<plug>(vimtex-info)',
  "       \ 'vimtex-info', 0)
  " call SpaceVim#custom#SPCGroupName(['G'], '+TestGroup')
  call SpaceVim#custom#SPC('nore', ['f', 'u'], 'MundoToggle', 'undo tree', 1)
  call SpaceVim#custom#SPC('nore', ['b', 'C'], 'cd %:p:h', 'set path to current directory', 1)
  call SpaceVim#custom#SPC('nore', ['l', 't'], 'Tagbar', 'tag bar', 1)
  call SpaceVim#custom#SPC('nore', ['q', 'w'], 'wqa', 'write and quit all files', 1)
  call SpaceVim#custom#SPC('nore', ['l', 'b'], 'call F6()', 'hard breakpoint', 1)
  call SpaceVim#custom#SPC('nore', ['l', 'c'], 'call CancelDebugForAllBuffers()', 'write off all hard breakpoints', 1)
  call SpaceVim#custom#SPC('nore', ['f', 'v', 'm'], 'tabnew ~/.SpaceVim.d/autoload/myspacevim.vim', 'open myspacevim.vim', 1)
  call SpaceVim#custom#SPC('nore', ['B', 'l'], 'Lines', 'fzf in all buffers', 1)
  call SpaceVim#custom#SPC('nore', ['b', 'l'], 'BLines', 'fzf in current buffer', 1)
  " when using ale, the behavior of next/previous error of SpaceVim is wrong
  " so I have to turn to the functions of ale
  if g:spacevim_enable_ale
    call SpaceVim#custom#SPC('nore', ['e', 'n'], 'ALENext', 'ale-next-error', 1)
    call SpaceVim#custom#SPC('nore', ['e', 'p'], 'ALEPrevious', 'ale-previous-error', 1)
    call SpaceVim#custom#SPC('nore', ['e', 'N'], 'ALEPrevious', 'ale-previous-error', 1)
  endif
  " formatting code will mess up the folding, so it's help to rearrange it
  call SpaceVim#custom#SPC('nore', ['b', 'f'], 'call Format()', 'format-code-and-rearrange-folding', 1)
  call SpaceVim#custom#SPC('nore', ['t', 'L'], 'Limelight!!', 'toggle lime light', 1)

  " switch python interpreter
  let g:python_location = system('which python')
  let g:python_location = substitute(g:python_location, '\n', '', 'g')
  let g:python3_host_prog=g:python_location

  " clever f configuration
  let g:clever_f_across_no_line = 1
  let g:clever_f_smart_case = 1
  map ; <Plug>(clever-f-repeat-forward)
  map \ <Plug>(clever-f-repeat-back)

  " vimcmdline mappings
  let g:cmdline_map_start          = '<LocalLeader>s'
  let g:cmdline_map_send           = '<enter>'
  let g:cmdline_map_send_and_stay  = '<LocalLeader><enter>'
  let g:cmdline_map_source_fun     = '<LocalLeader>f'
  let g:cmdline_map_send_paragraph = '<LocalLeader>p'
  let g:cmdline_map_send_block     = '<LocalLeader>b'
  let g:cmdline_map_quit           = '<LocalLeader>q'
  " vimcmdline options
  let g:cmdline_vsplit      = 1      " Split the window vertically
  let g:cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
  let g:cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
  let g:cmdline_term_height = 15     " Initial height of interpreter window or pane
  let g:cmdline_term_width  = 80     " Initial width of interpreter window or pane
  let g:cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
  let g:cmdline_outhl       = 1      " Syntax highlight the output
  let g:cmdline_auto_scroll = 1      " Keep the cursor at the end of terminal (nvim)
  " cmdline apps
  let g:cmdline_app           = {}
  let g:cmdline_app['python'] = 'ipython'
  let g:cmdline_app['python3'] = 'ipython'
  let g:cmdline_app['sh']     = 'zsh'
endfunction

function! myspacevim#after() abort
  set ignorecase
  set smartcase
  set lazyredraw
  set noswapfile
  set showcmd
  set foldlevel=2
  if has("termguicolors")
    " fix bug for vim
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum

    " enable true color
    set termguicolors
  endif
  if has('nvim')
    set pumblend=20
  endif

  nnoremap Y y$
  nnoremap S i<enter><esc>
  nnoremap <enter> za
  nnoremap <bs> "_
  nnoremap zl 10zl
  nnoremap zh 10zh
  if has('nvim')
    cmap <M-b> <S-Left>
    cmap <M-f> <S-Right>
  endif
  tnoremap <C-j> <C-\><C-N>:<C-U>wincmd j<CR>
  tnoremap <C-k> <C-\><C-N>:<C-U>wincmd k<CR>
  tnoremap <C-h> <C-\><C-N>:<C-U>wincmd h<CR>
  tnoremap <C-l> <C-\><C-N>:<C-U>wincmd l<CR>

  unmap <c-x>
  unmap <tab>
  unmap <
  unmap >

  RainbowParentheses

  noremap <f6> :call F6()<CR>
  " command! CancelDebug :bufdo call CancelDebug()
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
      let append_content = 'import ipdb; ipdb.set_trace()'
      " let append_content = repeat(' ', s:n_indent).append_content
      " call append(line('.') - 1, append_content)
      " let append_content = 'ipdb.set_trace()'
      let append_content = repeat(' ', s:n_indent).append_content
      call append(line('.') - 1, append_content)
      exec 'write'
    " markdown文件向下插入公式
    elseif &filetype == 'markdown'
      call append(line('.'), '<img src="http://chart.googleapis.com/chart?cht=tx&chl=" style="border:none;">')
      call setpos('.', [0, line('.') + 1, 55,0])
    endif
  endfunc

  func! Format()
    Neoformat
    normal zx
  endfunc

  func! CancelDebugForAllBuffers()
    let l:winview = winsaveview()
    let curBuffer = bufnr("%")
    exec 'bufdo call CancelDebug()'
    exec 'buffer'.curBuffer
    call winrestview(l:winview)
  endfunc

  func! CancelDebug()
    " python文件取消调试
    if &filetype == 'python'
      let isDebugging = search('import ipdb; ipdb.set_trace()', 'n')
      if isDebugging
        exec 'g/\Vimport ipdb; ipdb.set_trace()/d'
        exec 'write'
      endif
    endif
  endfunc

  func! LatexToURL()
    " markdown文件将加号改成URL码
    elseif &filetype == 'markdown'
      exec 's/+/%2B/g'
    endif
  endfunc

  " ale
  let g:ale_linters = {'python': ['flake8', 'autopep8', 'pylint']}
  let g:ale_python_flake8_options = '--ignore=E501'
  let g:ale_python_autopep8_options = '--ignore E501'

  " " LeaderGuid
  " nnoremap <silent> [ :<c-u>LeaderGuide '['<CR>
  " vnoremap <silent> [ :<c-u>LeaderGuide '['<CR>
  " nnoremap <silent> ] :<c-u>LeaderGuideVisual ']'<CR>
  " vnoremap <silent> ] :<c-u>LeaderGuideVisual ']'<CR>
  "
endfunction

