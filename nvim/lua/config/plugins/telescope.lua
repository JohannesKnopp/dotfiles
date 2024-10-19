return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require('telescope')
		-- local actions = require('telescope.actions')
		-- local transform_mod = require('telescope.actions.mt').transform_mod
		-- local trouble = require('trouble')
		-- local trouble_telescope = require('trouble.sources.telescope')

		telescope.setup({
			defaults = {
				path_display = { 'smart' },
			},
		})

		telescope.load_extension('fzf')

		local opts = { noremap = true, silent = true }

		local keymap = vim.keymap
		local builtin = require('telescope.builtin')

		keymap.set('n', '<leader>ff', builtin.find_files, opts)
		keymap.set('n', '<leader>fh', builtin.oldfiles, opts)
		keymap.set('n', '<leader>fs', builtin.live_grep, opts)
		keymap.set('n', '<leader>fc', builtin.grep_string, opts)

		local wk = require('which-key')
		wk.add({
			{ '<leader>f', group = 'telescope' },
			{ '<leader>ff', desc = 'Find Files'},
			{ '<leader>fh', desc = 'Recent Files'},
			{ '<leader>fs', desc = 'Search Text in Files'},
			{ '<leader>fc', desc = 'Search Text under Cursor'},
		})
	end,
}
