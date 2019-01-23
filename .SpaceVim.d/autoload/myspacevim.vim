function! myspacevim#before() abort
  let g:spacevim_lint_on_save = 0
  let g:spacevim_lint_on_the_fly = 1

  " call SpaceVim#custom#SPCGroupName(['G'], '+TestGroup')
  call SpaceVim#custom#SPC('nore', ['f', 'u'], 'UndotreeToggle', 'undo tree', 1)
  call SpaceVim#custom#SPC('nore', ['l', 't'], 'Tagbar', 'tag bar', 1)
  call SpaceVim#custom#SPC('nore', ['l', 'b'], 'call F6()', 'hard breakpoint', 1)
endfunction

function! myspacevim#after() abort
  set ignorecase
  set smartcase

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

endfunction

