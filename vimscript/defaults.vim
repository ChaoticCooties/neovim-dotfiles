" Python environment
let g:python_host_prog = '/Users/cooties/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/cooties/.pyenv/versions/neovim3/bin/python'

" UltiSnips
let g:UltiSnipsSnippetsDir = $HOME.'/.config/nvim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger = ''
let g:UltiSnipsJumpForwardTrigger = ''
let g:UltiSnipsJumpBackwardTrigger = ''

" Theme stuff
let mapleader=" "
colorscheme gruvbox
set background=dark
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235
set statusline=%=%P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\
set laststatus=2
set noshowmode
set number

" Persistent Undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

" Cursor stuff
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Temp treesitter support
hi! link TSAnnotation GruvboxAqua
hi! link TSBoolean GruvboxPurple
hi! link TSCharacter GruvboxPurple
hi! TSComment cterm=italic
hi! link TSComment GruvboxGrey
hi! link TSConstructor GruvboxOrange
hi! link TSConditional GruvboxRed
hi! link TSConstant GruvboxFg
hi! link TSConstBuiltin GruvboxPurple
hi! link TSConstMacro GruvboxPurple
hi! link TSError GruvboxRed
hi! link TSException GruvboxRed
hi! link TSField GruvboxFg
hi! link TSFloat GruvboxPurple
hi! link TSFunction GruvboxGreenBold
hi! link TSFuncBuiltin GruvboxOrange
hi! link TSFuncMacro GruvboxAqua
hi! link TSInclude GruvboxAqua
hi! link TSKeyword GruvboxRed
hi! link TSLabel GruvboxRed
hi! link TSMethod GruvboxGreenBold
hi! link TSNamespace GruvboxAqua
hi! link TSNone GruvboxPurple
hi! link TSNumber GruvboxPurple
hi! link TSOperator GruvboxOrange
hi! link TSParamter GruvboxFg
hi! link TSParameterReferance GruvboxFg
hi! link TSProperty GruvboxBlue
hi! link TSPunctDelimiter GruvboxFg
hi! link TSPunctBracket GruvboxFg
hi! link TSPunctSpecial GruvboxFg
hi! link TSRepeat GruvboxRed
hi! link TSString GruvboxGreen
hi! link TSStringRegex GruvboxYellow
hi! link TSStringEscape GruvboxOrange
hi! link TSTag GruvboxBlue
hi! link TSTagDelimiter GruvboxAqua
hi! link TSText GruvboxFg
hi! link TSLiteral GruvboxFg
hi! link TSURI GruvboxAqua
hi! link TSType GruvboxYellow
hi! link TSTypeBuiltin GruvboxYellow
hi! link TSVariable GruvboxFg
hi! TSEmphasis cterm=italic
hi! TSUnderline cterm=underline
