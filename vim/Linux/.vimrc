" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> Plugins
"    -> Configure Plugins
"    -> Misc
"    -> Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""
"Paths
set rtp+=~/.fzf

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" make backspaces delete sensibly
set backspace=indent,eol,start

set path+=**

set hidden

set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""
"Add number line"
set number

" Number relative
set relativenumber
set numberwidth=4

set scrolloff=4   "This keep 4 lines visible above cursor

" Show matching brackets when text indicator is over them
set showmatch

" Highlight search results
set hlsearch

" Height of the command bar
set cmdheight=2

"Always show current position
set ruler

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

" show command in bottom bar
set showcmd    

" Split window right
set splitright

" bells
set noerrorbells
set visualbell
set belloff=all

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on 

if has("termguicolors")
    set termguicolors
endif

"set bg=light
set t_Co=256
set background=dark

" Use theme
colorscheme gruvbox 

set guifont=FiraCode\ Nerd\ Font\ Mono
set listchars=tab:>-,trail:•,precedes:<,extends:>,eol:$,space:.

""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab


" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" Set  no wrap lines
set nowrap 

" Performance search
set ignorecase
set smartcase

" by default, the indent is 2 spaces. 

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" for js/typescript
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab

" for python
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
set noshowmode
" Leader
let mapleader=" "

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'editorconfig/editorconfig-vim'

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'

"Color Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mkitt/tabline.vim'

"Color editor
"Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'morhetz/gruvbox'
"Plug 'joshdick/onedark.vim'
"Plug 'jacoborus/tender.vim'

"Fuentes
Plug 'ryanoasis/vim-devicons'

"Utilites
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'
Plug 'qpkorr/vim-bufkill'

" Syntax 
Plug 'sheerun/vim-polyglot'

"Snippets
Plug 'hell-spawn/vim-spawn-snippets'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" Config Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

"
" POLYGLOT
"
" let g:python_highlight_all = 1

map <C-d> :BD<cr>

"
" AUTO PAIRS
"
let g:AutoPairsMapCR = 0
let g:AutoPairsCenterLine = 0

"
"-VIM AIRLINE
"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#buffer_nr_show = 1

" airline symbols
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"
"-COC VIM
" 

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup
"Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ CheckBackspace() ? "\<TAB>" :
            \ coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)"

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"
" COC Snippets
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"
"COC-explorer
"
nnoremap <space>e :CocCommand explorer<CR>

"
" COC-prettier
"
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"
" - FZF 
"

"TODO WINDOWS
"let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:50%' "
"command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--preview', 'powershell -nologo "& "Get-Content -Head 50 {}']}, <bang>0)
"command! -bang -nargs=? -complete=dir GFiles call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'powershell -nologo "& "Get-Content -Head 50 {}']}, <bang>0)
"command! -bang -nargs=* -complete=dir  Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': ['--preview', 'C:\Users\MA30609\vimfiles\plugged\fzf.vim\bin\preview.bat {}' ]}, <bang>0)

nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>G :GFiles<CR>
nnoremap <silent> <leader>R :Rg<CR>
"nnoremap <silent> <leader>o :BTags<CR>
"nnoremap <silent> <leader>O :Tags<CR>
"nnoremap <silent> <leader>? :History<CR>
"nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
"nnoremap <silent> <leader>. :AgIn 

let g:fzf_nvim_statusline = 0 " disable statusline overwriting

"disable conflict Cocvim
"nnoremap <silent> K :call SearchWordWithAg()<CR>
"vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable space DiffMode
if &diff
    " diff mode
    set diffopt+=iwhite
endif

" Add SemiColon end of line
inoremap <C-_> <Esc>:call <SID>InsSemiColon()<CR>
function! <SID>InsSemiColon() abort
    let l:line = line('.')
    let l:content = getline('.')
    let l:eol = ';'
    " If the line ends with a semicolon we simply insert one.
    if l:content[col('$') - 2] ==# ';'
        normal! a;
        normal! l
        startinsert
    else
        if search('(', 'bcn', l:line)
            let l:eol = search(')', 'cn', l:line) ?  ';' : ');'
        endif
        call setline(l:line, l:content . l:eol)
        startinsert!
    endif
endfunction

" XML formatter
function! DoFormatXML()
    exe ':'.'%s/<\([^>]\)*>/\r&\r/g'
    exe ':'.'%g/^\s*$/delete'
endfunction


command -nargs=1 Vsb call VsbFunction(<f-args>)

function VsbFunction (arg1)
    execute 'vert sb' a:arg1
endfunction
