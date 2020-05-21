" CTRLSF
let g:ctrlsf_ackprg = 'rg' " Use rg as backend
let g:ctrlsf_auto_close = { "normal" : 0, "compact": 0 } " Disable auto close
let g:ctrlsf_auto_focus = { "at": "start" } " Focus Ctrlsf buffer after it's called

" coc.nvim
let g:coc_global_extensions = [
  \ 'coc-css', 
  \ 'coc-emmet',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-git',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-stylelint',
  \ 'coc-tsserver',
  \ ]

" CSV.vim
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['help', 'coc-explorer', 'csv']

" Lightline
let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ 'active': {
  \   'left':   [ [ 'mode', 'paste' ],
  \               [ 'cocstatus', 'currentfunction', 'gitbranch',
  \                 'statusdiagnostic', 'readonly', 'filename', 'modified' ] ],
  \   'right':  [ [ 'lineinfo' ],
  \               [ 'percent' ],
  \               [ 'filetype' ]
  \             ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction',
  \   'filetype': 'MyFiletype',
  \   'gitbranch': 'fugitive#head',
  \   'statusdiagnostic': 'StatusDiagnostic'
  \ },
  \ }

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? 
    \ (strlen(&filetype) ? &filetype : 'no ft') 
    \: ''
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascriptreact' : 1,
    \ 'eruby' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1
    \}

" FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --follow --glob "!.git/*"'
let $FZF_DEFAULT_OPTS .= ' --layout=reverse'
let g:fzf_preview_window = '' " Disable preview windows
let g:fzf_layout = { 'window': 
  \ { 'width': 0.80, 'height': 0.5, 'yoffset': 0, 'border': 'rounded' } }

" Fugitive
let g:fugitive_git_executable = 'LANG=en_US git'

" Polyglot
" Ragtag
let g:ragtag_global_maps = 1

" Multi
" let g:VM_highlight_matches = 'value'

" Vim-test
" let test#neovim#term_position = "vert"
let test#strategy = "vimux"
" let g:test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_binstubs = 0
