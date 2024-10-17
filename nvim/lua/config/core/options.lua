local opt = vim.opt

-- numbers
opt.relativenumber = true
opt.number = true

-- enable mouse in all modes
opt.mouse = 'a'
-- opt.mousemoveevent = true

-- tabs
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true

-- default encodings to utf-8
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
-- opt.termencoding = 'utf-8' -- currently broken

-- folds
opt.foldmethod = 'indent'
opt.foldlevelstart = 99
opt.foldlevel = 1

-- search
opt.ignorecase = true
opt.smartcase = true

-- styling
opt.scrolloff = 5
opt.wrap = true
opt.showbreak = '++'
opt.breakindent = true
opt.linebreak = true
opt.termguicolors = true
