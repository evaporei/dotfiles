local lsp = require("lsp-zero")

lsp.preset("recommended")

-- local cmp = require('cmp')
-- cmp.setup({
--     mapping = cmp.mapping.preset.insert({
--         ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--     })
-- })

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'tsserver', 'rust_analyzer', 'lua_ls'},
	handlers = {
		lsp.default_setup,
	},
})


lsp.setup()
