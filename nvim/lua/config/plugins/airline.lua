return {
	'vim-airline/vim-airline',
	dependencies = {
		'vim-airline/vim-airline-themes',
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		vim.g.airline_theme = 'base16_monokai'
		vim.g.airline_powerline_fonts = 1
		-- vim.g.airline_symbols = {}

		-- unicode symbols
		vim.g.airline_left_sep = '»'
		vim.g.airline_left_sep = '▶'
		vim.g.airline_right_sep = '«'
		vim.g.airline_right_sep = '◀'
		vim.g.airline_symbols.linenr = '␊'
		vim.g.airline_symbols.linenr = '␤'
		vim.g.airline_symbols.linenr = '¶'
		vim.g.airline_symbols.branch = '⎇'
		vim.g.airline_symbols.paste = 'ρ'
		vim.g.airline_symbols.paste = 'Þ'
		vim.g.airline_symbols.paste = '∥'
		vim.g.airline_symbols.whitespace = 'Ξ'

		-- airline symbols
		vim.g.airline_left_sep = ''
		vim.g.airline_left_alt_sep = ''
		vim.g.airline_right_sep = ''
		vim.g.airline_right_alt_sep = ''
		vim.g.airline_symbols.branch = ''
		vim.g.airline_symbols.readonly = ''
		vim.g.airline_symbols.linenr = ''
	end,
}
