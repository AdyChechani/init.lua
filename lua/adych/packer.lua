-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd("packer.nvim")

local ensure_packer = function()
        local fn = vim.fn
        local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
                fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
                vim.cmd([[ packadd packer.nvim ]])
                return true
        end
        return false
end

local _ = ensure_packer()

return require("packer").startup(function(use)
        use("wbthomason/packer.nvim")

        use {
                "nvim-telescope/telescope.nvim", tag = "0.1.8",
                -- or                            , branch = "0.1.x",
                requires = { "nvim-lua/plenary.nvim" }
        }

        use("catppuccin/nvim")

        use {
                'nvim-treesitter/nvim-treesitter',
                run = function()
                        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                        ts_update()
                end,
        }

        use("mbbill/undotree")
        use("tpope/vim-fugitive")

        use {
                "nvim-tree/nvim-tree.lua",
                requires = { "nvim-tree/nvim-web-devicons" },
        }

        use {
                "VonHeikemen/lsp-zero.nvim",
                branch = "v1.x",
                requires = {
                        -- LSP Support
                        {"neovim/nvim-lspconfig"},
                        {"williamboman/mason.nvim"},
                        {"williamboman/mason-lspconfig.nvim"},

                        -- Autocompletion
                        {"hrsh7th/nvim-cmp"},
                        {"hrsh7th/cmp-buffer"},
                        {"hrsh7th/cmp-path"},
                        {"saadparwaiz1/cmp_luasnip"},
                        {"hrsh7th/cmp-nvim-lsp"},
                        {"hrsh7th/cmp-nvim-lua"},

                        -- Snippets
                        {"L3MON4D3/LuaSnip"},
                        {"rafamadriz/friendly-snippets"},
                }
        }
end)
