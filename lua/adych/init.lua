require("adych.remaps")
require("adych.settings")
require("adych.lazy_init")

local augroup = vim.api.nvim_create_augroup
local AdychGroup = augroup("Adych", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
        require("plenary.reload").reload_module(name)
end

vim.filetype.add({
        extension = {
                templ = 'templ',
        }
})

autocmd('TextYankPost', {
        group = yank_group,
        pattern = '*',
        callback = function()
                vim.highlight.on_yank({
                        higroup = 'IncSearch',
                        timeout = 40,
                })
        end,
})

-- Remove trailing whitespace from all lines
autocmd({"BufWritePre"}, {
        group = AdychGroup,
        pattern = "*",
        command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
        group = AdychGroup,
        callback = function(e)
                local opts = { buffer = e.buf }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        end
})
