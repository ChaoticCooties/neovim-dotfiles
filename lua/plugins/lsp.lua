local M = {}

M.config = function()
  -- Configure lua language server for neovim development
  local lua_settings = {
    Lua = {
      runtime = {
        -- LuaJIT in the case of Neovim
        version = "LuaJIT",
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      }
    }
  }

  -- config that activates keymaps and enables snippet support
  local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
      -- enable snippet support
      capabilities = capabilities,
      -- map buffer local keybindings when the language server attaches
      on_attach = on_attach
    }
  end

  -- lsp-install
  local function setup_servers()
    require "lspinstall".setup()

    -- get all installed servers
    local servers = require "lspinstall".installed_servers()
    -- ... and add manually installed servers
    table.insert(servers, "clangd")

    for _, server in pairs(servers) do
      local config = make_config()

      -- language specific config
      if server == "lua" then
        config.settings = lua_settings
      end
      if server == "clangd" then
        -- config.settings = clangd_settings
        config.filetypes = {"c", "cpp"} -- we don't want objective-c and objective-cpp!
      end

      require "lspconfig"[server].setup(config)
    end
  end

  setup_servers()

  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  require "lspinstall".post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
  end

  -- LSP Diagnostics Icons
  local signs = {Error = " ", Warning = " ", Hint = " ", Information = " "}
  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
  end
end

return M
