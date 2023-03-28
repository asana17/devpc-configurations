local options = {
  compatible = false,
  encoding = "utf-8",
  fileencoding = "utf-8",
  number = true,
  mouse = "a",
  shiftwidth = 2,
  hlsearch = true,
  incsearch = true,
  smartcase = true,
  smartindent = true,
  title = true,
  termguicolors = true,
  clipboard = "unnamedplus",
  cmdheight = 2,
  swapfile = false,
  splitright = true,
  expandtab = true,
  timeoutlen = 300,
  updatetime = 300,
  wildmenu = true,
  ignorecase = true,
  writebackup = false,
  undofile = true,
  backspace={indent,eol,start},
  list = true,
  whichwrap = "b,s,h,l,<,>,[,],~",
  shell = "/usr/bin/zsh",
  pumblend = 20,
--  winblend = 20,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd("set showmatch matchtime=1")
vim.cmd("set backspace=indent,eol,start")
vim.cmd("set formatoptions-=ro")
vim.cmd("set sessionoptions+=winpos,terminal,folds")
