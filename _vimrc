set encoding=utf-8

if ($OS == 'Windows_NT')
	source c:\Program\ Files\ (x86)\Vim\_vimrc
	set guifont=Consolas:h11	 "Font
endif

filetype plugin indent on
syntax on 

colorscheme desert
exec ":hi CursorLine guibg=gray20"
exec ":hi Normal guibg=gray5"
exec ":hi NonText guibg=gray20" 

set number
set hidden         
set backup
set tabstop=4
set smartcase
set ignorecase
set cursorline
set visualbell
set scrolloff=5  
set shiftwidth=4
set laststatus=2
set cursorcolumn
set numberwidth=5
set spellsuggest=14
set nowrapscan

" Directories
"""""""""""""
if ($OS == 'Windows_NT') 
	let    MRU_File='~/vimfiles/_vim_mru_files'
	set   backupdir=~/vimfiles/backup/swap
	set   directory=~/vimfiles/backup/directory
	set     undodir=~/vimfiles/backup/undodir
	set   spellfile=~/vimfiles/spell/es.utf-8.add
	set viminfofile=~/vimfiles/_viminfo
	set noundofile
else
	let    MRU_File='~/.vim/_vim_mru_files'
	set   backupdir=~/.vim/backup/swap
	set   directory=~/.vim/backup/directory
	set     undodir=~/.vim/backup/undodir
	set   spellfile=~/.vim/backup/spell/es.utf-8.add
	set viminfofile=~/.vim/_viminfo
endif

"Maps
"""""
map <C-f9>  <esc>:make clean<cr>
map <C-f10> <esc>:make<cr>
map <C-f11> <esc>:silent make run<cr>:silent copen<cr>
"term_sendkeys() mada mensajes al buffer (nro, msg) 
map <C-f12> :call term_sendkeys(bufnr("*cmd.exe*"), "make run\n\r")<cr> 

"Copy/Paste
" <C-V> (insert)->paste, <C-V> (visual)->paste, replace. <C-C> (visual)->" Copy
imap <C-V> <ESC>"+gpa
vmap <C-V> "+gp
vmap <C-C> "+y

"Vimtex
let g:vimtex_compiler_latexmk = {
			\ 'backend' : 'process',
			\ 'background' : 1,
			\ 'build_dir' : 'output',
			\ 'callback' : 1,
			\ 'continuous' : 1,
			\ 'options' : [
			\   '-use-make',
			\   '-pdf',
			\   '-verbose',
			\   '-file-line-error',
			\   '-synctex=1',
			\   '-interaction=nonstopmode',
			\ ],
			\}
"let g:vimtex_quickfix_open_on_warning=0   "Para que no se abra la ventanita en warnings

if ($OS == 'Windows_NT') 
	let g:vimtex_view_general_viewer = 'SumatraPDF' 
	let g:vimtex_view_general_options='-reuse-instance -forward-search @tex @line @pdf'
else
	let g:vimtex_view_general_viewer = 'okular'
	let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
	let g:vimtex_view_general_options_latexmk = '--unique'
endif

"YCM
let g:ycm_auto_trigger = 0 
set completeopt-=preview 

"NERDTree
map <C-F2> :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\~$', '\.\(aux\|bbl\|blg\|log\|out\|bst\|cls\|synctex\)$', ]

"Airline
let g:airline_theme='luna'  
let g:airline#extensions#tabline#enabled=1"

"Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1 

let g:syntastic_vhdl_checkers=["vcom"]
let g:syntastic_vhdl_vcom_args="-work modelSimProject/work" 

let g:syntastic_verilog_checkers=["vlog"]
let g:syntastic_verilog_vlog_args="-work modelSimProject/work" 
let g:syntastic_systemverilog_checkers=["vlog"]
let g:syntastic_systemverilog_vlog_args="-sv -work modelSimProject/work" 

"Para syntastic con ant
let g:syntastic_java_javac_config_file_enabled=1 
"let g:syntastic_java_javac_custom_classpath_command = "ant -q path|grep echo|cut -f2- -d]|tr -d ' '|tr ':' '\n'"
let g:syntastic_java_javac_custom_classpath_command = "ant -q path|grep echo|cut -f2- -d]|tr -d ' '|tr ';' '\n'"

"let g:syntastic_cpp_include_dirs = [ '/usr/local/include'] 

"Otras configuraciones
set includeexpr=substitute(v:fname,'work.','','g') 
set suffixesadd=.vhd,.vhdl,.java 

hi Pmenu guibg=black guifg=cyan
hi Pmenu guibg=black guifg=skyBlue

autocmd BufNewFile  makefile r ~/vimfiles/my_templates/makefile 
