return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'williamboman/mason.nvim',
		'hrsh7th/cmp-nvim-lsp',
		{ 'antosha417/nvim-lsp-file-operations', config = true },
		{ 'folke/neodev.nvim',                   opts = {} },
	},
	config = function()
		local lspconfig = require('lspconfig')
		local mason_lspconfig = require('mason-lspconfig')
		local cmp_nvim_lsp = require('cmp_nvim_lsp')
		local keymap = vim.keymap
		local wk = require('which-key')

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				local function opts(desc)
					return { desc = desc, buffer = ev.buf, silent = true }
				end

				keymap.set('n', 'K', vim.lsp.buf.hover, opts('Show documentation'))
				keymap.set('n', 'gR', '<cmd>Telescope lsp_references<cr>', opts('Show LSP references'))
				keymap.set('n', 'gD', vim.lsp.buf.declaration, opts('Go to declaration'))
				keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts('Show LSP definitions'))
				keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts('Show LSP implementations'))
				keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', opts('Show LSP type definitions'))
				keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, opts('Show available code actions'))
				wk.add({
					{ '<leader>r', group = 'Rename' },
					{ '<leader>rn', vim.lsp.buf.rename, desc = 'Smart Rename' },
				})
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()
		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			-- TODO add lsp configs
			['lua_ls'] = function()
				lspconfig['lua_ls'].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { 'vim' },
							},
							completion = {
								callSnippet = 'Replace'
							},
						}
					}
				})
			end,
			['emmet_ls'] = function()
				-- capabilities.textDocument.completion.completionItem.snippetSupport = true
				lspconfig['emmet_ls'].setup({
					capabilities = capabilities,
					filetypes = {
						'html',
						'css',
						'sass',
						'scss',
						'less',
						'javascript',
						'javascriptreact',
						'svelte',
						'vue',
					}
				})
			end,
		})
	end
}
