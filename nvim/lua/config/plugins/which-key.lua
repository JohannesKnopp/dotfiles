return {
	'folke/which-key.nvim',
	event = 'VeryLazy',
	config = function()
		local wk = require('which-key')
		wk.add({
			{ '<leader>nh', '<cmd>nohl<cr>',       desc = 'No Highlight' },
			{ '<leader>l', group = 'LazyGit', icon = { icon = '', color = 'cyan' } },
			{ '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open LazyGit', icon = { icon = '', color = 'cyan' } },
		})
	end
}
