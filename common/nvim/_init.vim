" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = '/home/kaightasa/.local/share/dein'

" Set Dein source path (required)
let s:dein_src = '/home/kaightasa/.local/share/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
if dein#load_state(s:dein_base)
  call dein#begin(s:dein_base)

  call dein#add(s:dein_src)
  let g:rc_dir = expand('~/.config/nvim/dein/toml')
  let s:toml = g:rc_dir . '/dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  " Your plugins go here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Finish Dein initialization (required)
  call dein#end()
  call dein#save_state()
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

set number
set autoindent
set shiftwidth=2
set splitright
set expandtab
set hls
set nowritebackup
set backspace=indent,eol,start
set incsearch
set hlsearch
set showmatch matchtime=1
set cmdheight=2
set display=lastline
set list
set smartindent
set noswapfile
set title
set mouse=a
set whichwrap=b,s,h,l,<,>,[,],~
set formatoptions-=ro
set sessionoptions+=winpos,terminal,folds
autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType qf wincmd J

inoremap <silent> jj <ESC>

set shell=/usr/bin/zsh

set clipboard+=unnamedplus

" terminal
tnoremap <Esc> <C-\><c-n>
command! -nargs=* T split | wincmd j | resize 15 | terminal <args>
autocmd TermOpen * startinsert

" back to last cursor
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" persisitend_undo
if has('persistent_undo')
  let undo_path = expand('/tmp/nvim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif

"---- nvim-treesitter.configs-----

lua << EOF
  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true,
    },
    yati = {
      enable = true,
      -- Disable by languages, see `Supported languages`
      disable = { "python" },

      -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
      default_lazy = true,

      -- Determine the fallback method used when we cannot calculate indent by tree-sitter
      --   "auto": fallback to vim auto indent
      --   "asis": use current indent as-is
      --   "cindent": see `:h cindent()`
      -- Or a custom function return the final indent result.
      default_fallback = "auto"
    },
    indent = {
      enable = false -- disable builtin indent module
    }
  }
  require('hlargs').setup{
    color = '#cceedd',
  }
  require('anywise_reg').setup()
EOF


"---- material theme ------

lua << EOF
vim.g.material_style = "deep ocean"
local material = require 'material'
local colors = require 'material.colors'
require('material').setup({

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
EOF

" Theme
colorscheme material
" for vim-lsp
hi LspInformationHighlight gui=None cterm=None
hi LspHintHighlight gui=None cterm=None
hi link LspWarningHighlight Todo
hi link LspInformationText Hint
hi link LspHintText Hint
hi LspErrorVirtualText ctermfg=125 guifg=#cd617a
hi LspWarningVirtualText guifg=#cf7754 ctermfg=172
set pumblend=20

"session plugin
let g:session_path = "/home/kaightasa/.config/nvim/session"
