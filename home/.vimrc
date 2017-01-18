" from http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  elseif(&number == 1)
    set nonumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" https://github.com/altercation/vim-colors-solarized
" http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized/
if has('gui_running')
    set background=light
    let g:solarized_termcolors=256
else
    "set background=dark
    set background=light
    let g:solarized_termcolors=16
endif
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste#Paste_toggle
set pastetoggle=<F2>

" http://vim-doc.heroku.com/view?https://raw.github.com/rizzatti/dash.vim/master/doc/dash.txt#DashKeyBindings
nmap <silent> <leader>d <Plug>DashSearch

"set tabstop=8

" http://vim.wikia.com/wiki/Vim_as_XML_Editor
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType html setlocal foldmethod=syntax
au FileType ruby setlocal foldmethod=syntax

" http://stackoverflow.com/questions/8316139/vim-how-to-set-the-default-to-unfolded-when-you-open-a-file
set nofoldenable

" https://stackoverflow.com/questions/2447109/showing-a-different-background-colour-in-vim-past-80-characters
let &colorcolumn=join(range(101,999),",")

" https://github.com/fatih/vim-go/blob/master/README.md

" Show a list of interfaces which is implemented by the type under your cursor with <leader>s
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor with <leader>i (useful if you have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor with <leader>gd or open it vertically with <leader>gv
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Or open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run commands, such as go run with <leader>r for the current file or go build and go test for the current package with <leader>b and <leader>t. Display a beautiful annotated source code to see which functions are covered with <leader>c.
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default the mapping gd is enabled which opens the target identifier in current buffer. You can also open the definition/declaration in a new vertical, horizontal or tab for the word under your cursor:
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

" Don't conceal quotes in json
let g:vim_json_syntax_conceal = 0

" https://github.com/kien/ctrlp.vim/issues/279
let g:ctrlp_show_hidden = 1

" http://stackoverflow.com/a/2496570/684619
set autoread
