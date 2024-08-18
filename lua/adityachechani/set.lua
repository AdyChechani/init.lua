vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

-- For C and C++
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false -- disable highlights after search command
vim.opt.incsearch = true -- realtime highlighting for search

-- Terminal color
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
