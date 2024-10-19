return {
	'rmagatti/auto-session',
	lazy = false,
	config = function()
		local auto_session = require('auto-session')
		auto_session.setup({
			auto_save = false,
			auto_restore = false,
			post_restore_cmds = {
				function ()
					local buf_exists = function(bufname)
						for _, buf in ipairs(vim.fn.getbufinfo({ bufloaded = true })) do
							if buf.name:match(bufname) then
								return true
							end
						end
						return false
					end

					-- If NvimTree was opened when the session was saved, show it
					if buf_exists('NvimTree_') then
						require('nvim-tree.api').tree.open()
					end
				end
			}
		})

		local opts = { silent = true, noremap = true }

		local keymap = vim.keymap
		keymap.set('n', '<leader>ss', '<cmd>SessionSave<cr>', opts)
		keymap.set('n', '<leader>sq', '<cmd>SessionSave<cr><cmd>wa<cr><cmd>qa<cr>', opts)
		keymap.set('n', '<leader>sl', '<cmd>SessionSearch<cr>', opts)
		keymap.set('n', '<leader>sr', '<cmd>SessionRestore<cr>', opts)
		keymap.set('n', '<leader>sd', '<cmd>Autosession delete<cr>', opts)

		local function named_save()
			vim.ui.input({ prompt = 'Enter Session name: ' }, function(input)
				auto_session.SaveSession(input)
			end)
		end
		keymap.set('n', '<leader>sS', named_save, opts)

		local wk = require('which-key')
		wk.add({
			{ '<leader>s',  group = 'auto-session' },
			{ '<leader>ss', desc = 'SessionSave' },
			{ '<leader>sS', desc = 'NamedSessionSave' },
			{ '<leader>sq', desc = 'Save and Quit' },
			{ '<leader>sl', desc = 'SessionList (SessionSearch)'},
			{ '<leader>sr', desc = 'SessionRestore'},
			{ '<leader>sd', desc = 'SessionDelete'},
		})
	end,
}
