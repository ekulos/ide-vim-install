" Common
set shiftwidth=4
set tabstop=4
set expandtab
set number
set selection=exclusive
set autoindent
set autoread
set showcmd
set nocompatible
set relativenumber
set nrformats-=octal
set showmatch
set hidden
set history=100
set nowrap
set splitbelow
set splitright
set mouse=a

" color row if > 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Closetag script
autocmd Filetype html let g:closetag_html_style=1
autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
autocmd FileType ruby,yaml setl nowrap sw=2 sts=2 et
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType qf wincmd J
autocmd BufWritePre * :%s/\s\+$//e
au BufEnter * set scrolloff=30
au VimLeave * !resetcolor

" Pathogen
execute pathogen#infect()
filetype plugin indent on

" Syntax highlighting
syntax enable
colorscheme molokai

" Easygrep
let g:EasyGrepRecursive=1

" Ag
let g:ag_working_path_mode="r"

" Grammarous
let g:grammarous#default_comments_only_filetypes = {
 \ '*' : 1, 'help' : 0, 'markdown' : 0,
 \ }

" Tagbar plugin
autocmd VimEnter * nested :TagbarOpen
autocmd VimEnter * nested :NERDTreeFind
autocmd VimEnter * nested :NERDTreeFocusToggle

" Go-vim plugin
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_fmt_command = "goimports"

" Emmet plugin
let g:user_emmet_leader_key='<C-C>'

" YouCompleteMe plugin
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" DelimitMate plugin
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 0

" Airline plugin
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

" NERDTree & NERDTree tabs plugins
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp', '\.pyc', '\.pyo']
let g:nerdtree_tabs_startup_cd=1


" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" Instant markdown
let g:instant_markdown_autostart = 0

" Syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:go_list_type='quickfix'
let g:syntastic_ignore_files = ['\.s$']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Exit if quickfix is last window
au BufEnter * call MyLastWindow()
function! MyLastWindow()
    " if the window is quickfix go on
    if &buftype=="quickfix"
        " if this window is last on screen quit without warning
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction

" Shortcuts remap
nmap  <F2>          :tabnew<CR>
nmap  <F4>          :set hlsearch<CR>
nmap  <F5>          :nohlsearch<CR>
nmap  <F6>          :NERDTreeTabsToggle<CR>
nmap  <F7>          :GundoToggle<CR>
nmap  <F8>          :TagbarToggle<CR>
nmap  <F9>          :tabclose<CR>
nmap  <F10>         :Tabularize /,\zs<CR>
vmap  <F10>         :Tabularize /,\zs<CR>
nmap  <F12>         :Tabularize / \zs<CR>
vmap  <F12>         :Tabularize / \zs<CR>
nmap  <C-Down>      :tabprevious<CR>
nmap  <C-Up>        :tabnext<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Developper
nmap , :lnext<CR>
nmap ? :lprevious<CR>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Grammar
nmap <leader>g :GrammarousCheck<CR>
nmap <leader>ga <Plug>(grammarous-fixall)
nmap <leader>gf <Plug>(grammarous-fixit)
nmap <leader>gr <Plug>(grammarous-remove-error)
nmap <leader>gd <Plug>(grammarous-disable-rule)
nmap ! <Plug>(grammarous-move-to-next-error)
nmap § <Plug>(grammarous-move-to-previous-error)

" Search
nmap <leader><leader>s :%s/<C-r><C-w>/
nmap <leader><leader>a :Ag<space>
nmap <leader>aa :Ag <C-r><C-w><CR>

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

