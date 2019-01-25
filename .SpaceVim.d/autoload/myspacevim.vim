function! myspacevim#before() abort
  let g:spacevim_lint_on_save = 0
  let g:spacevim_lint_on_the_fly = 1

  " call SpaceVim#custom#SPCGroupName(['G'], '+TestGroup')
  call SpaceVim#custom#SPC('nore', ['f', 'u'], 'UndotreeToggle', 'undo tree', 1)
  call SpaceVim#custom#SPC('nore', ['l', 't'], 'Tagbar', 'tag bar', 1)
  call SpaceVim#custom#SPC('nore', ['q', 'w'], 'wqa', 'write and quit all files', 1)
  call SpaceVim#custom#SPC('nore', ['l', 'b'], 'call F6()', 'hard breakpoint', 1)
  call SpaceVim#custom#SPC('nore', ['l', 'c'], 'CancelDebug', 'write off all hard breakpoints', 1)
  call SpaceVim#custom#SPC('nore', ['f', 'v', 'm'], 'e ~/.SpaceVim.d/autoload/myspacevim.vim', 'open myspacevim.vim', 1)
  call SpaceVim#custom#SPC('nore', ['B', 'l'], 'Lines', 'fzf in all buffers', 1)
  call SpaceVim#custom#SPC('nore', ['b', 'l'], 'BLines', 'fzf in current buffer', 1)

  " switch python interpreter
  let g:python_location = system('which python')
  let g:python_location = substitute(g:python_location, '\n', '', 'g')
  let g:python3_host_prog=g:python_location
endfunction

function! myspacevim#after() abort
  set ignorecase
  set smartcase

  unmap <c-x>
  nnoremap Y y$

  noremap <f6> :call F6()<CR>
  command! CancelDebug :bufdo call CancelDebug()
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

  " LeaderGuid
  nnoremap <silent> [ :<c-u>LeaderGuide '['<CR>
  vnoremap <silent> [ :<c-u>LeaderGuide '['<CR>
  nnoremap <silent> ] :<c-u>LeaderGuideVisual ']'<CR>
  vnoremap <silent> ] :<c-u>LeaderGuideVisual ']'<CR>

endfunction

