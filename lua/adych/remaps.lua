vim.g.mapleader = " "

-- Function to comment selected lines
function CommentLines()
        local commentstring = vim.bo.commentstring
        local comment_prefix = commentstring:match("^%s*(.-)%s*%%s")
        if comment_prefix then
                vim.cmd(":'<,'>s/^/" .. comment_prefix .. " /")
        else
                print("No commentstring defined for this filetype")
        end
end

-- Function to uncomment selected lines
function UncommentLines()
        local commentstring = vim.bo.commentstring
        local comment_prefix = commentstring:match("^%s*(.-)%s*%%s")
        if comment_prefix then
                vim.cmd(":'<,'>s/^" .. comment_prefix .. "\\s\\?//")
        else
                print("No commentstring defined for this filetype")
        end
end

-- editor
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "gc", ":lua CommentLines()<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "gC", ":lua UncommentLines()<CR>", { noremap = true, silent = true })
vim.keymap.set("x", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("x", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- navigating
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- general remaps
vim.keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear the selection
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("v", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })
vim.keymap.set("n", "<C-Backspace>", "db")

local prev_buffer = nil
vim.keymap.set('n', '<leader>d', function()
        prev_buffer = vim.api.nvim_get_current_buf()
        local todo_path = vim.fn.expand('~/.dotfiles/personal/todo.md')
        local dir = vim.fn.fnamemodify(todo_path, ':h')
        if vim.fn.isdirectory(dir) == 0 then
                vim.fn.mkdir(dir, 'p')
        end
        vim.cmd('edit ' .. todo_path)
end)
vim.keymap.set('n', '<leader>bd', function()
        if prev_buffer and vim.api.nvim_buf_is_valid(prev_buffer) then
                vim.api.nvim_set_current_buf(prev_buffer)
        else
                print('No previous buffer available')
        end
end)

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Python3 interpreting
vim.keymap.set("n", "<C-CR>", ":!python3 % <CR>", { noremap = true, silent = false })

-- Vim pane navigating
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-\\>", "<C-w>p", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true })

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
