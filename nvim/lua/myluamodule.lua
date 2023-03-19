-- Map Ctrl+Backspace to delete previous word in insert mode
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true})
-- Map Ctrl+Delete to delete next word in insert mode
vim.api.nvim_set_keymap('i', '<C-Del>', '<C-o>dw', {noremap = true})
