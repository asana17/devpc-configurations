local plugins = {
  { "marko-cerovac/material.nvim" }, -- colorscheme theme
  { "nvim-lua/plenary.nvim" }, -- common util
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }}, -- status line
  { "MattesGroeger/vim-bookmarks"}, -- mark as bookmark

  -- search
  { "haya14busa/vim-asterisk" }, -- improve * search
  { 'kevinhwang91/nvim-hlslens' }, -- show search info
  { "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens",
      "lewis6991/gitsigns.nvim",
    }
  },

  -- telescope
  { "nvim-telescope/telescope.nvim", version = "0.1.2" },

  -- text editing
  { "rhysd/accelerated-jk" }, -- faster j/k scroll
  { "tpope/vim-surround" }, -- edit brackets
  { "windwp/nvim-autopairs" }, -- complete brackets automatically
  { "preservim/nerdcommenter" }, -- comment functions
  --{ "terryma/vim-expand-region" }, -- expand visual selection by +/-
  { "tversteeg/registers.nvim" }, -- show register popup window
  { "kevinhwang91/nvim-bqf"}, -- add preview window for quickfix
  { "bkad/CamelCaseMotion" }, -- move, delete by CamelCase
  { "godlygeek/tabular" }, -- align with :Tab
  { "lambdalisue/suda.vim" }, -- text edit with sudo
  { "junegunn/vim-easy-align" }, -- align with :EasyAlign
  { "mtdl9/vim-log-highlighting" }, -- coloring log
  { "nicwest/vim-camelsnek" }, -- convert between CamelCase and snake_case

  -- text view
  { "lukas-reineke/indent-blankline.nvim" }, -- show indent line
  { "lambdalisue/readablefold.vim" }, -- show fold preview text
  { "t9md/vim-quickhl" }, -- highlight words under cursor, etc
  { "unblevable/quick-scope" }, -- highlight unique character in line

  -- git
  --{ "airblade/vim-gitgutter" }, -- show git status in LineNr
  { "sindrets/diffview.nvim"}, -- show diff
  { "tpope/vim-fugitive" }, -- run git comannd on vim command
  { "lewis6991/gitsigns.nvim" }, -- show git status
  { "ruanyl/vim-gh-line" }, -- go to github page
  --{ "rhysd/committia.vim" }, -- improve git editor window

  -- fern file tree viewer
  { "lambdalisue/fern.vim",
    dependencies = {
      "lambdalisue/fern-hijack.vim", -- override default vim editor
      "lambdalisue/fern-git-status.vim", -- show git change status
      "LumaKernel/fern-mapping-fzf.vim", -- use fzf in fern
    }
  },

  -- syntax
  { "preservim/tagbar" }, -- open code objects list window
  { "LeafCage/vimhelpgenerator" }, -- syntax highlight logs
  { "rhysd/vim-grammarous" }, -- grammar check: to fix bug temporaliy, need to delete vim-grammarous/autoload/grammarous.vim L698: "call grammarous#info_win#close()

  -- completion
  --{ "hrsh7th/nvim-cmp", commit=b356f2c },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  { -- optional cmp completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline"},
  { "L3MON4D3/LuaSnip",
    dependencies = {
      --"saadparwaiz1/cmp_luasnip",
      "honza/vim-snippets",
    }
  },
  { "petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim" },

  -- lsp
  { "neovim/nvim-lspconfig" }, -- official configuration
  { "williamboman/mason.nvim"}, -- lsp server install helper
  { "williamboman/mason-lspconfig.nvim"}, -- package support above
  --{ "folke/neodev.nvim" }, -- neovim setup for luaAPI
  { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

  -- dap
  { "mfussenegger/nvim-dap" }, -- debug adapter manager
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }, -- debugger ui

  --test
  { "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  }, -- interact test
  { "nvim-neotest/neotest-go"},
  { "nvim-neotest/neotest-plenary"},
  { "nvim-neotest/neotest-python"},
  { "nvim-neotest/neotest-vim-test"},
  {
    'andythigpen/nvim-coverage',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
	}, -- show if function is tested

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build ={":TSUpdate",":TSInstall c lua vim"},
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "yioneko/nvim-yati",
    }, -- syntax tree analyzer
  },
  { "m-demare/hlargs.nvim" }, -- highlight arguments of function

  -- github copilot
  { "github/copilot.vim" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
    },
  },

  -- runner
  { "michaelb/sniprun", build = "bash ./install.sh" }, -- run visual snipped code

  -- open browser
  { "tyru/open-browser.vim" },
  { "tyru/open-browser-github.vim", dependencies = "tyru/open-browser.vim"},

  -- rust
  { "rust-lang/rust.vim" },
  { "simrat39/rust-tools.nvim" },

  -- markdown
  { "preservim/vim-markdown" }, -- markdown syntax highlighting and extensions
  { "mattn/vim-maketable" }, -- make table easily
  { "previm/previm" }, -- preview markdown on browser with Ctrl-P
  {
    "hedyhli/markdown-toc.nvim",
    ft = "markdown",
    cmd = {"Mtoc"},
    main = "mtoc",
  }, -- make table of contents

  -- latex
  { "vim-latex/vim-latex", version = "*" },

  -- flutter
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  -- others
  {"norcalli/nvim-colorizer.lua"}, -- highlight rgb colors

  -- my plugin
  {"asana17/prev-mark.nvim"}, -- preview markdown
  {"asana17/commit-buf.nvim",
   dependencies = "nvim-lua/plenary.nvim"}, -- improve commitbuf
}

local opts = {
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        --'matchparen',
        --'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
