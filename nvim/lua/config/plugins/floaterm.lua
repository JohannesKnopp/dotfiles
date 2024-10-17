return {
	'voldikss/vim-floaterm',
	config = function ()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		keymap.set('n', '<C-q>', '<cmd>FloatermToggle<cr>', opts)
		keymap.set('t', '<C-q>', '<cmd>FloatermToggle<cr>', opts)
		keymap.set('t', '<PageUp>', '<cmd>FloatermPrev<cr>', opts)
		keymap.set('t', '<PageDown>', '<cmd>FloatermNext<cr>', opts)

		local wk = require('which-key')
		wk.add({
			{ '<leader>t', group = 'Floaterm', icon = { icon = ' ', color = 'red' } },
			{ '<leader>tn', '<leader>tn', desc = 'New Terminal', noremap = true, silent = true },
			{ '<leader>tt', '<leader>tt', desc = 'Toggle Terminal', noremap = true, silent = true  },
		})
	end
}
