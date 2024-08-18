-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 0

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 1
vim.opt.softtabstop = 1
vim.shiftwidth = 1
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.smartindent = true -- for C and C++

-- cursor
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.hlsearch = true -- highlights search permanently
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- overrides the ignorecase when searching with uppercase letter

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.signcolumn = "yes" -- for errormarkers, breakpoints, git status, etc.

-- backspace
vim.opt.backspace = "indent,eol,start"

-- yank to copy to clipboard
vim.opt.clipboard:append("unnamedplus") -- clipboard in unix is called unnamedplus

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- extras
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
