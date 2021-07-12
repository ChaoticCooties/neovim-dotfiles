local lspconfig = require "lspconfig"

require "dashboard"
require "lsp"
require "treesitter"
require "format"
require "autopairs"
require "mappings"
require "telescope-nvim"
require "statusline"
require "nvim-compe"

-- Default Indentation
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true
