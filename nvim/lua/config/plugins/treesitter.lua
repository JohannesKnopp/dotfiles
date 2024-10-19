return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require('nvim-treesitter.configs')

		treesitter.setup({
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				'json',
				'javascript',
				'typescript',
				'yaml',
				'html',
				'htmldjango',
				'css',
				'scss',
				'markdown',
				'markdown_inline',
				'bash',
				'lua',
				'vim',
				'dockerfile',
				'python',
				'gitignore',
				'c',
			},
			ignore_install = {},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-Space>',
					node_incremental = '<C-Space>',
					scope_incremental = false,
					node_decremental = '<bs>',
				},
			},
		})
	end,
}
