local keymap = vim.keymap


local opts = { noremap = true, silent = true }

-- INSERT MODE

-- map `ctrl + backspace` to delete previous word in insert mode
keymap.set('i', '<C-H>', '<C-W>', opts)

-- map `ctrl + delete` to delete next word in insert mode
keymap.set('i', '<C-Del>', '<C-o>dw', opts)


-- NORMAL MODE

-- navigate in visual linewraps
keymap.set('n', 'k', 'gk', opts)
keymap.set('n', 'j', 'gj', opts)
keymap.set('n', '<UP>', 'gk', opts)
keymap.set('n', '<DOWN>', 'gj', opts)


-- COMMANDS

-- print current working directory
vim.api.nvim_create_user_command('Cwd', function() print(vim.fn.getcwd()) end, {})
