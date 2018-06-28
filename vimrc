" Leader"{{{
	let mapleader = "\<Space>"
	let g:mapleader = "\<Space>"
	let maplocalleader = ","
"}}}
" Essential"{{{
	set nocompatible
	filetype plugin indent on
"}}}
" Plugin setting"{{{
	"Nerd tree"{{{
		map <leader>nn :NERDTreeToggle<cr>
		map <leader>nb :NERDTreeFromBookmark
		map <leader>nf :NERDTreeFind<cr>
		let NERDTreeShowBookmarks=1
	"}}}
	" EasyAlign"{{{
		xmap ga <Plug>(EasyAlign)
		nmap ga <Plug>(EasyAlign)
	"}}}
	" undo-tree"{{{
		if has("persistent_undo")
			set undodir=~/.undodir/
			set undofile
			if !isdirectory(expand(&undodir))
				call mkdir(expand(&undodir), "p")
			endif
		endif
		map <leader><leader>u :UndotreeToggle<cr>
	"}}}
	"vimwiki"{{{
		let g:vimwiki_folding='syntax'
	"}}}
	" airline"{{{
		let g:airline_theme='molokai'
		let g:airline#extensions#tabline#enabled = 1
	"}}}
	" UtilSnips"{{{
		if !exists("g:UltiSnipsJumpForwardTrigger")
			let g:UltiSnipsExpandTrigger ="<tab>"
			let g:UltiSnipsJumpForwardTrigger ="<tab>"
			let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
		endif
	"}}}
	" YCM"{{{
		if !exists("g:ycm_key_list_select_completion")
			let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
			let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
			let g:SuperTabDefaultCompletionType = '<C-n>'
			let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
			let g:ycm_seed_identifiers_with_syntax=1
		endif
	"}}}
	" Syntastic"{{{
		if !exists("g:syntastic_check_on_open")
			set statusline+=%#warningmsg#
			set statusline+=%{SyntasticStatuslineFlag()}
			set statusline+=%*

			let g:syntastic_always_populate_loc_list = 1
			let g:syntastic_auto_loc_list = 1
			let g:syntastic_check_on_open = 1
			let g:syntastic_check_on_wq = 0
		endif
	"}}}
	" EasyMotion"{{{
		" <Leader>f{char} to move to {char}
		map  <Leader>f <Plug>(easymotion-bd-f)
		nmap <Leader>f <Plug>(easymotion-overwin-f)

		" s{char}{char} to move to {char}{char}
		nmap s <Plug>(easymotion-overwin-f2)

		"" Move to line
		"map <Leader>L <Plug>(easymotion-bd-jk)
		"nmap <Leader>L <Plug>(easymotion-overwin-line)

		"" Move to word
		"map  <Leader>w <Plug>(easymotion-bd-w)
		"nmap <Leader>w <Plug>(easymotion-overwin-w)
	"}}}
	" Mark"{{{
		nmap <Leader>M <Plug>MarkToggle
		nmap <Leader>N <Plug>MarkAllClear
	"}}}
	" load optional packages by default"{{{
		let load_opt_packages=1
		if load_opt_packages
			:packadd YouCompleteMe
			:packadd command-t
		endif
	"}}}
"}}}
" Configuration"{{{
	" Encoding"{{{
		set encoding=utf-8
		scriptencoding utf-8 "must be after 'set encoding=utf-8'
	"}}}
	" Wildmenu Setting {{{
		set wildmenu
		set wildignore+=.hg,.git,.svn                    " Version control
		set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
		set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
		set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
		set wildignore+=*.sw?                            " Vim swap files
		set wildignore+=*.DS_Store                       " OSX bullshit
	" }}}
	" Appearances Setting"{{{
		set ruler
		set term=screen-256color
		set list listchars=tab:› ,extends:>,precedes:<,eol:¬
		set number
		set relativenumber
		set cursorline
		set cmdheight=2
		set nowrap
		set foldcolumn=1        " Add a bit extra margin to the left
		set tw=0
	"}}}
	" Appearances Color Scheme"{{{
		syntax on    " Enable syntax highlighting
		colo molokai " color scheme
		let g:molokai_original = 1
		hi Visual term=reverse cterm=reverse guibg=Grey
		"hi MatchParen cterm=bold ctermbg=magenta ctermfg=white
		hi MatchParen cterm=none ctermbg=darkgrey ctermfg=grey
	"}}}
	" Sound "{{{
		set noerrorbells
		set novisualbell
		set t_vb=
	"}}}
	" MISC "{{{
		set history=500
		set path+=**
		set hlsearch            " Highlight search results
		set incsearch           " Makes search act like search in modern browsers
		set lazyredraw          " Don't redraw while executing macros (good performance config)
		set noswapfile
		set mouse=a
		set autochdir
		set clipboard=unnamed
		set foldmethod=marker
		set showmatch
		set ai                  " Auto indent
		set viminfo^=%          " Remember info about open buffers on close
		set tm=500
		set so=6                " Set 7 lines to the cursor - when moving vertically using j/k
		map 0 ^
	"}}}
	" Status line"{{{
		set laststatus=2 " Always show the status line
		set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c " Format the status line
	"}}}
	" Special"{{{
		" Return to last edit position when opening files (You want this!)
		au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	"}}}
"}}}
" Hot Key"{{{
	" Save file "{{{
		nmap <leader>q :q<cr>
		nmap <leader>qq :q!<cr>
		nmap <leader>qa :qa<cr>
		nmap <leader>qaa :qa!<cr>
		nmap <leader>w :w!<cr>
		nmap <leader>wq :wq!<cr>
	"}}}
	" Autocomplete"{{{
		imap ;; <c-x><c-p>
	"}}}
	" Pane resizing"{{{
		nnoremap <leader>j :resize +5<cr>
		nnoremap <leader>k :resize -5<cr>
		nnoremap <leader>h :vertical resize -5<cr>
		nnoremap <leader>l :vertical resize +5<cr>

		nnoremap <leader>jj :resize +15<cr>
		nnoremap <leader>kk :resize -15<cr>
		nnoremap <leader>hh :vertical resize -25<cr>
		nnoremap <leader>ll :vertical resize +25<cr>

		nnoremap <leader>jjj :resize +100<cr>
		nnoremap <leader>kkk :resize -100<cr>
		nnoremap <leader>hhh :vertical resize -100<cr>
		nnoremap <leader>lll :vertical resize +100<cr>
	"}}}
	" Pane switching"{{{
		if exists('$TMUX')
			function! TmuxOrSplitSwitch(wincmd, tmuxdir)
				let previous_winnr = winnr()
				silent! execute "wincmd " . a:wincmd
				if previous_winnr == winnr()
					call system("tmux select-pane -" . a:tmuxdir)
					redraw!
				endif
			endfunction

			let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
			let &t_ti = "\<Esc>]2;vim\<Esc>\\" .  &t_ti
			let &t_te = "\<Esc>]2;".  previous_title . "\<Esc>\\" . &t_te

			nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
			nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
			nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
			nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
		else
			nnoremap <C-h> <C-w>h
			nnoremap <C-j> <C-w>j
			nnoremap <C-k> <C-w>k
			nnoremap <C-l> <C-w>l
		endif
	"}}}
	" Buffer switching"{{{
		map <leader>bn :bnext<cr>
		map <leader>bp :bprevious<cr>
		map <leader>bl :bnext<cr>
		map <leader>bh :bprevious<cr>
	"}}}
	" Tab switching"{{{
		map <leader>tn :tabnew<cr>
		map <leader>to :tabonly<cr>
		map <leader>tc :tabclose<cr>
		map <leader>tm :tabmove
		map <leader>tl :tabnext<cr>
		map <leader>th :tabprevious<cr>
		map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
		" Let 'tj' toggle between this and the last accessed tab"{{{
			let g:lasttab = 1
			nmap <Leader>tj :exe "tabn ".g:lasttab<CR>
			au TabLeave * let g:lasttab = tabpagenr()
		"}}}
		" Open a new tab with the current buffer's path"{{{
			map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
		"}}}
	"}}}
	" Spell checking "{{{
		map <leader>ss :setlocal spell!<cr>
		map <leader>sn ]s
		map <leader>sp [s
		map <leader>sa zg
		map <leader>s? z=
		map <leader>sl :set filetype=log<cr>
	"}}}
	"Customization"{{{
		nnoremap <leader>da  :r! date +"\%Y-\%m-\%d \%H:\%M:\%S"<ESC>0=j
		nnoremap <leader>vt  :vs ~/vimwiki/tmp.wiki<CR>
		nnoremap <leader>vw  :vs ~/vimwiki/index.wiki<CR>
		nnoremap <leader>ev  :vs ~/.vimrc<CR>
		nnoremap <leader>es  :vsplit<cr>:UltiSnipsEdit<CR>
		nnoremap <leader>mr  :MRU<CR>
		nnoremap <leader>sv  :set syntax=systemverilog<CR>
		nnoremap <leader>sp  :set syntax=snippets<CR>
	"}}}
"}}}
" Helper Functions "{{{
	" Delete trailing white space on save "{{{
		func! DeleteTrailingWS()
			exe "normal mz"
			%s/\s\+$//ge
			exe "normal `z"
		endfunc
		autocmd BufWrite * :call DeleteTrailingWS()
	"}}}
	" HasPaste()"{{{
		function! HasPaste()
			if &paste
				return 'PASTE MODE  '
			endif
			return ''
		endfunction
	"}}}
""}}}
"Ctags"{{{
set tags=./tags;
set tags+=~/ctag_UVM/tags
"recursieve source tags and vimrc
let local_vimrc = ".vimrc"
let local_tags = "tags"
let local_tags2 = ".tags"
let local_path = "/"
let current_path = getcwd()
" If the current path is a child of $HOME directory, start from $HOME
if current_path =~ $HOME
    let local_path = $HOME . local_path
    let current_path = substitute(current_path, $HOME, '', '')
endif
let path_parts = split(current_path, "/")
for path_part in path_parts
    let local_path = local_path . path_part . "/"
    if filereadable(local_path . local_vimrc)
        exe ":so " . local_path . local_vimrc
    endif
    if filereadable(local_path . local_tags)
        exe ":set tags+=" . local_path . local_tags
    endif
    if filereadable(local_path . local_tags2)
        exe ":set tags+=" . local_path . local_tags2
    endif
endfor
unlet local_vimrc local_tags local_path current_path path_parts
"}}}
"Autoload for filetype"{{{
autocmd Filetype verilog setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype systemverilog setlocal expandtab shiftwidth=2 softtabstop=2

autocmd Filetype systemverilog map <localleader>d.  <esc>0/\.\/<cr>xx

autocmd Filetype taskpaper map <localleader>cp  <esc>0xxf@hi:<esc>0
autocmd Filetype taskpaper map <localleader>ca  <esc>f:x0i- <esc>0
autocmd Filetype taskpaper map <localleader>t   <esc>cwtrue<esc>0
autocmd Filetype taskpaper map <localleader>f   <esc>cwfalse<esc>0

autocmd Filetype taskpaper map <localleader>af  <esc>$a @flagged<esc>0
autocmd Filetype taskpaper map <localleader>adu <esc>$a @due(tomorrow)<esc>0
autocmd Filetype taskpaper map <localleader>adf <esc>$a @defer(1 week)<esc>0

autocmd Filetype taskpaper map <localleader>df  <esc>0/@flagged<cr>dW0
autocmd Filetype taskpaper map <localleader>ddu <esc>0/@due<cr>dW0
autocmd Filetype taskpaper map <localleader>ddf <esc>0/@defer<cr>dW0
autocmd Filetype taskpaper map <localleader>dad <esc>0/@autodone<cr>dW0

autocmd Filetype taskpaper map <localleader>da  <esc>0/@<cr>d$x0
"}}}
