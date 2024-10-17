return {
	'akinsho/bufferline.nvim',
	lazy = false,
	version = '*',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function ()
		local bufferline = require('bufferline')
		bufferline.setup({
			options = {
				hover = {
					enabled = true,
					delay = 200,
					reveal = {'close'}
				},
			}
		})

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map('n', '<A-Left>', '<cmd>BufferLineCyclePrev<cr>', opts)
		map('n', '<A-Right>', '<cmd>BufferLineCycleNext<cr>', opts)
	end
}
