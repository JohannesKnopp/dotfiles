return {
	'nvimtools/none-ls.nvim',
	dependencies = {
		'nvimtools/none-ls-extras.nvim'
	},
	config = function()
		local null_ls = require('null-ls')

		local sources = {
			null_ls.builtins.formatting.prettier.with({
				filetypes = { 'javascript', 'typescript', 'css', 'html', 'json', 'markdown', 'yaml' }
			}),
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.djlint,
			null_ls.builtins.formatting.isort,
			null_ls.builtins.formatting.stylua,
			require('none-ls.diagnostics.eslint_d'),
		}

		null_ls.setup({
			sources = sources,
			-- on_attach = function(client, bufnr)
			-- 	if client.server_capabilities.documentFormattingProvider then
			-- 		vim.
			-- 	end
			-- end,
		})

		local keymap = vim.keymap
		local fmt_func = function()
			vim.lsp.buf.format({ async = true })
		end
		keymap.set('n', '<leader>ii', fmt_func, { noremap = true, silent = true })

		local wk = require('which-key')
		wk.add({
			{ '<leader>i',  group = 'Formatting' },
			{ '<leader>ii', desc = 'Format File' },
		})
	end,
}
