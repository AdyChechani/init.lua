return {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
                require("nvim-tree").setup({
                        disable_netrw = false,
                        hijack_netrw = false,
                        update_cwd = true,
                        git = {
                                enable = true,
                                ignore = false,
                        },
                        renderer = {
                                highlight_git = true, -- highlights git changes
                                icons = {
                                        show = {
                                                git = true,
                                                folder = true,
                                                file = true,
                                                folder_arrow = true,
                                        },
                                        glyphs = {
                                                folder = {
                                                        arrow_closed = "→",
                                                        arrow_open = "↓",
                                                },
                                        },
                                },
                        },
                        actions = {
                                open_file = {
                                        quit_on_open = false, -- don't close the tree when opening a file
                                },
                        },
                        view = {
                                width = 35,
                                side = "left",
                        },
                })
        end,
}
