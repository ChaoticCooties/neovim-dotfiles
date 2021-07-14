local packer = require("packer")
local use = packer.use

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "single"}
    end
  },
  git = {
    clone_timeout = 600 -- Timeout, in seconds, for git clones
  }
}

return packer.startup(
  function()
    use "wbthomason/packer.nvim"

    use "gruvbox-community/gruvbox"

    use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("plugins.treesitter").config()
      end
    }

    use {
      "glepnir/dashboard-nvim",
      cmd = {
        "Dashboard",
        "DashboardNewFile",
        "DashboardJumpMarks",
        "SessionLoad",
        "SessionSave"
      },
      setup = function()
        require("plugins.dashboard").config()
      end
    }

    use {
      "kabouzeid/nvim-lspinstall",
      event = "BufRead"
    }

    use {
      "neovim/nvim-lspconfig",
      after = "nvim-lspinstall",
      config = function()
        require("plugins.lsp").config()
      end
    }

    -- load compe in insert mode only
    use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter",
      config = function()
        require("plugins.compe").config()
      end,
      wants = {"LuaSnip"},
      requires = {
        {
          "L3MON4D3/LuaSnip",
          wants = "friendly-snippets",
          event = "InsertCharPre",
          config = function()
            require("plugins.compe").snippets()
          end
        },
        {
          "rafamadriz/friendly-snippets",
          event = "InsertCharPre"
        }
      }
    }

    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      },
      cmd = "Telescope",
      config = function()
        require("plugins.telescope").config()
      end
    }

    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope"}

    use {
      "nvim-telescope/telescope-media-files.nvim",
      cmd = "Telescope"
    }

    use {
      "windwp/nvim-autopairs",
      after = "nvim-compe",
      config = function()
        require("plugins.autopairs").config()
      end
    }

    use {
      "mhartington/formatter.nvim",
      config = function()
        require("plugins.formatter").config()
      end
    }

    use {
      "hoob3rt/lualine.nvim",
      config = function()
        require("plugins.statusline").config()
      end
    }

    use "kyazdani42/nvim-web-devicons"

    use "tpope/vim-surround"

    use "voldikss/vim-floaterm"

    -- Latex
    use "lervag/vimtex"

    use "sirver/ultisnips"

    use "KeitaNakamura/tex-conceal.vim"
  end
)
