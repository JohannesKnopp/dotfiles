return {
	'nvimtools/none-ls.nvim',
	config = function()
		local null_ls = require('null-ls')

		local sources = {
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.djlint,
			null_ls.builtins.formatting.eslint_d,
			null_ls.builtins.formatting.isort,
			null_ls.builtins.formatting.stylua,
		}

		null_ls.setup({
			sources = sources,
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
