return {
	'goolord/alpha-nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	event = 'VimEnter',
	config = function()
		local alpha = require('alpha')
		local startify = require('alpha.themes.startify')

		-- startify.section.header.val = {
		-- 	'░▒▓███████▓▒░ ░▒▓████████▓▒░░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓██████████████▓▒░ ',
		-- 	'░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
		-- 	'░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
		-- 	'░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
		-- 	'░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
		-- 	'░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▓█▓▒░  ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
		-- 	'░▒▓█▓▒░░▒▓█▓▒░░▒▓████████▓▒░░▒▓██████▓▒░    ░▒▓██▓▒░   ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
		-- 	'																					'
		-- }

		alpha.setup(startify.opts)

		local alpha_start_group = vim.api.nvim_create_augroup('AlphaStart', { clear = true })
		vim.api.nvim_create_autocmd('TabNewEntered', {
			callback = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local bufname = vim.api.nvim_buf_get_name(bufnr)

				-- Start alpha if no file associated with buffer
				if bufname == '' then
					alpha.start()
				end
			end,
			group = alpha_start_group
		})

		-- vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end
}
