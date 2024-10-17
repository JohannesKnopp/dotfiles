return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function ()
		local nvim_tree = require('nvim-tree')
		local api = require('nvim-tree.api')

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvim_tree.setup()

		local keymap = vim.keymap
		keymap.set('n', '<leader>ee', api.tree.toggle, { noremap = true, silent = true })

		local wk = require('which-key')
		wk.add({
			{ '<leader>e', group = 'nvim-tree', icon = { icon = '  ', color = 'orange' } },
			{ '<leader>ee', group = 'Toggle tree' }
		})
	end
}
