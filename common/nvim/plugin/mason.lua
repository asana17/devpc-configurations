require("mason").setup()
require("mason-lspconfig").setup{
  automatic_installation = true
}

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true }
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', bufopts)
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', bufopts)
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts)
vim.keymap.set('n', '<C-h>', '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufopts)
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', bufopts)
--vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>', bufopts)
--vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', bufopts)
--vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', bufopts)
vim.keymap.set('n', 'ge', '<cmd>Trouble<CR>', bufopts)
vim.cmd "command! -nargs=* LspDeclaration lua vim.lsp.buf.declaration()<CR>"
vim.cmd "command! -nargs=* LspDefinition lua vim.lsp.buf.definition()<CR>"
vim.cmd "command! -nargs=* LspReferences lua vim.lsp.buf.references()<CR>"
vim.cmd "command! -nargs=* LspFormat lua vim.lsp.buf.formatting()<CR>"
vim.cmd "command! -nargs=* LspHover lua vim.lsp.buf.hover()<CR>"
vim.cmd "command! -nargs=* LspImplementation lua vim.lsp.buf.implementation()<CR>"
vim.cmd "command! -nargs=* LspTypeDefinition lua vim.lsp.buf.type_definition()<CR>"
vim.cmd "command! -nargs=* LspCodeAction lua vim.lsp.buf.code_action()<CR>"
vim.cmd "command! -nargs=* LspRename lua vim.lsp.buf.rename()<CR>"
