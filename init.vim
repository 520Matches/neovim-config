" ===================================================================
" _           _   _                 _
" (_)  _ __   (_) | |_      __   __ (_)  _ __ ___
" | | | '_ \  | | | __|     \ \ / / | | | '_ ` _ \
" | | | | | | | | | |_   _   \ V /  | | | | | | | |
" |_| |_| |_| |_|  \__| (_)   \_/   |_| |_| |_| |_|
" ===================================================================

syntax on

set ts=4  
set softtabstop=4
set shiftwidth=4
set mouse=a
set encoding=utf-8

set scrolloff=5

set autoindent
set number
set nohlsearch
set relativenumber

" 用<C-a>和<C-x>的时候默认是十进制
set nrformats=

"system=============================================================
"可以和系统的剪贴板共用,unnamed是*寄存器,unnamedplus是+寄存器
set clipboard^=unnamed,unnamedplus
" set wildmenu
"system=============================================================

let mapleader=" "
map <leader>h <C-w>h
map <leader>l <C-w>l
map <leader>j <C-w>j
map <leader>k <C-w>k

" 单词拼写检查
map <leader>sp :set spell<CR>
map <leader>sP :set spell!<CR>

vnoremap <leader>vn : normal 

map <F5> :source ~/.config/nvim/init.vim<CR>

map sh :vsplit<CR>
map sl :vsplit<CR><C-w>l
map sj :split<CR><C-w>j
map sk :split<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :verticjl resize-5<CR>
map <right> :vertical resize+5<CR>

" 图片化字体,需要安装figlet
map tx :r !figlet 

inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
" inoremap < <><Left>

" nnoremap <silent> g0 :?^{<CR>
" nnoremap <silent> g9 :/^}<CR>

" 普通模式下用块状光标，在插入模式下用条状光标（形状类似英文 "I" 的样子），然后在替换模式中使用下划线形状的光标
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" 恢复到上次关闭文件时光标所在的位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" 在可视模式中使用 >>>>> 而不用用一次要再选中一次
xnoremap <  <gv
xnoremap >  >gv

" 当前行高亮
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdcommenter'

"快速对齐
Plug 'godlygeek/tabular'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'kristijanhusak/defx-icons'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf',{'do':'./install --bin'}
Plug 'junegunn/fzf.vim'

" Plug 'glepnir/dashboard-nvim'

Plug '520Matches/vim-open-url'

" float terminal
Plug 'voldikss/vim-floaterm'

" vim-easymotion
Plug 'easymotion/vim-easymotion'

" vim-buffet
Plug 'bagrat/vim-buffet'

" vim-devicons
" Plug 'ryanoasis/vim-devicons'

" 'airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

if has("mac")
	Plug 'lyokha/vim-xkbswitch'
else
	Plug '520Matches/fcitx5.vim'
endif

Plug 'matze/vim-move'

"显示git信息的插件
Plug 'APZelos/blamer.nvim'

" 让括号有颜色的插件
Plug 'luochen1990/rainbow'

" Plug 'jayli/vim-easycomplete'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'Blackrush/vim-gocode'

call plug#end()

" tabularize============================================
map <leader>= :Tabularize /=<CR>
map <leader>, :Tabularize /,<CR>
map <leader>; :Tabularize /;<CR>
map <leader>( :Tabularize /(<CR>
map <leader>: :Tabularize /:<CR>
map <leader><Space> :Tabularize /<Space><CR>

" defx================================================

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

nmap <silent> <C-n> :Defx -columns=icons:indent:filename:type<CR>

autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> <C-h>     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
 " nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

" defx================================================

" kristijanhusak/defx-icons===============================================================
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_copy_icon = ''
let g:defx_icons_link_icon = ''
let g:defx_icons_move_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''
" kristijanhusak/defx-icons===============================================================

" dashboard-nvim
"let g:dashboard_default_executive ='fzf'
"let g:dashboard_custom_shortcut={
"\ 'last_session'       : 'SPC l s',
"\ 'find_history'       : 'SPC f h',
"\ 'find_file'          : 'SPC f f',
"\ 'new_file'           : 'SPC c n',
"\ 'change_colorscheme' : 'SPC t c',
"\ 'find_word'          : 'SPC f a',
"\ 'book_marks'         : 'SPC f b',
"\ }
"nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
"nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
"nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
"nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
"nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
"nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

"nerdcommenter=============================================================================

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 2

"nerdcommenter=============================================================================

"junegunn/fzf============================================================
nnoremap <silent> <Leader>f :Files<CR>
" nnoremap <silent> <Leader>b :Buffers<CR>
"junegunn/fzf============================================================

"Ag===================================================
nnoremap <silent> <Leader>a :Ag<CR>

" float terminal=============================================================
" let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'

" nnoremap   <silent>   <F9>    :FloatermNew<CR>
" tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F10>    :FloatermPrev<CR>
tnoremap   <silent>   <F10>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F11>    :FloatermNext<CR>
tnoremap   <silent>   <F11>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
" float terminal=============================================================

" coc====================================================================
let g:coc_global_extensions = ['coc-json','coc-go','coc-vimlsp']

set updatetime=100

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
" nnoremap <silent><leader>h :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" coc====================================================================

" easymotion=================================================

" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)

" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
"
" easymotion=================================================

" vim-buffet=================================================
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>

" How do I get the look like in the screenshot?
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

" I can only see the current active buffer in the tabline
" let g:lightline.enable.tabline = 0
" use command 'bd' to close current buffer
" vim-buffet=================================================
 
" vim-visual-multi===========================================
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-m>'
let g:VM_maps['Find Subword Under'] = '<C-m>'
" vim-visual-multi===========================================

" APZelos/blamer.nvim=============================================
let g:blamer_enabled = 1
let g:blamer_show_in_insert_modes = 0
" APZelos/blamer.nvim=============================================

" 'luochen1990/rainbow'=========================================
let g:rainbow_active = 1
" 'luochen1990/rainbow'=========================================

" 'jayli/vim-easycomplete'========================================
" let g:easycomplete_scheme="sharp"
" 'luochen1990/rainbow'=========================================

" Plug 'lyokha/vim-xkbswitch'
if has("mac")
	let g:XkbSwitchEnabled = 1
else
endif

" Plug 'matze/vim-move'============================================
if has('mac')
	let g:move_key_modifier = 'C'
else
	let g:move_key_modifier = 'A'
endif
" Plug 'matze/vim-move'============================================

" Plug 'Blackrush/vim-gocode'========================================
" imap <leader>p <C-x><C-o>
" Plug 'Blackrush/vim-gocode'========================================
