" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Environmental Plugins
Plug 'glepnir/dashboard-nvim'
Plug 'gruvbox-community/gruvbox'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'hrsh7th/nvim-compe'
Plug 'L3MON4D3/LuaSnip'

Plug 'mhartington/formatter.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-media-files.nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Latex Plugins
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'KeitaNakamura/tex-conceal.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

for f in glob('$HOME/.config/nvim/vimscript/*.vim', 0, 1)
  execute 'source' f
endfor

lua require('init')

" Auto reload
if has ('autocmd') " Remain compatible with earlier versions
 augroup init.vim     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd
