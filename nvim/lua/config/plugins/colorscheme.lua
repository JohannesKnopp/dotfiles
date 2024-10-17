return {
    'polirritmico/monokai-nightasty.nvim',
    priority = 1000,
	config = function()
		require('monokai-nightasty').setup()
		vim.cmd('colorscheme monokai-nightasty')
	end,
}
