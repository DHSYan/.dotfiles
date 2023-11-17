-- local lsp_zero = require('lsp-zero')
--
-- lsp.preset('recommended')
--
-- -- lsp.ensure_installed({
-- -- 	"racket-langserver"
-- -- })
-- --
-- -- lsp.nvim_workspace()
--
--
-- lsp_zero.set_sign_icons({
--   error = '✘',
--   warn = '▲',
--   hint = '⚑',
--   info = ''
-- })
--
-- vim.diagnostic.config({
--   virtual_text = false,
--   severity_sort = true,
--   float = {
--     style = 'minimal',
--     border = 'rounded',
--     source = 'always',
--     header = '',
--     prefix = '',
--   },
-- })
--
-- lsp.setup()
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

