vim.g.material_style = "deep ocean"
local material = require 'material'
local colors = require 'material.colors'
material.setup({

    contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
    },

    styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { --[[ italic = true ]] },
        strings = { --[[ bold = true ]] },
        keywords = { --[[ underline = true ]] },
        functions = { --[[ bold = true, undercurl = true ]] },
        variables = {},
        operators = {},
        types = {},
    },

    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        -- "gitsigns",
        -- "hop",
        -- "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        -- "neorg",
        -- "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-tree",
        -- "nvim-web-devicons",
        -- "sneak",
        -- "telescope",
         "trouble",
        -- "which-key",
    },

    disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false -- Hide the end-of-buffer lines
    },

    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },

    lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

    async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

    custom_colors = function(colors)
    colors.editor.fg = "#dddddd"
    end, -- If you want to everride the default colors, set this to a function

    custom_highlights = {
      Comment = {fg = '#7777aa' },
      Nontext = {fg = '#777777'},
      LineNr = {fg = '#777777'},
      Identifier = {fg = '#dddddd'}, -- variable
      String = {fg = "#d3b987"},
      Operator = {fg = '#cccccc'},
      Function = {fg = '#a5c9fc'},
      Delimiter = {fg = '#bbbbbb'},
      Cursor = {fg = '#000000', bg = '#eeeeee'},
      Search = {fg = '#ffffff', underline = true},
      IncSearch = {fg = '#ffffff', underline = true},
      QuickFixLine = {fg = '#ffffff', underline = true},
      Folded = {fg = '#aaaaaa', italic = true},
      FloatBorder = {fg = '#ffffff'},
      CurSearch = {fg = '#000000', bg = "#ffcb6b"},
      ["@attribute"] = {fg = '#60f3c2'},
      ["@storageclass"] = {fg = '#a081ff'},
      ["@constant.builtin"] = {fg = '#ff7c3c'},
      ["@preproc"] = {fg = '#ef97f9'},
      ["@keyword"] = {fg = '#9070ff'},
      ["@keyword.function"] = {fg = '#ed4091'},
      ["@include"] = {fg = '#ba4091'},
      ["@type"] = {fg = '#ccb044'},
      ["@type.qualifier"] = {fg = '#a081ff'},
      ["@type.builtin"] = {fg = '#ed4091'},
      ["@namespace"] = {fg = '#66ddff'},
      ["@field"] = {fg = '#c3aadd'},
      ["@property"] = {fg = '#c3aadd'},
      ["@constant"] = {fg = '#97c062' },
      ["@punctuation"] = {fg = '#cccccc' },
      ["@punctuation.delimiter"] = {fg = '#cccccc' },
      ["@punctuation.bracket"] = {fg = '#cccccc' },
      ["@punctuation.special"] = {fg = '#97d7e6' },
      ["@function.macro"] = {fg = '#97d7e6'},
    }, -- Overwrite highlights with your own
})

vim.cmd 'colorscheme material'
