-- Load plugins
require "list"
require "editor"
require "mappings"

vim.cmd([[autocmd BufWritePost list.lua source <afile> | PackerCompile]])
