local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        path,
    })
end

vim.opt.rtp:prepend(path)

require("lazy").setup({
    { 
        "rebelot/kanagawa.nvim",
        disabled = false,
        config = function ()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    {
        "catppuccin/nvim",
        disabled = true,
        config = function ()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                sync_install = true,
                highlight = { enabled = true, },
                indent = { enabled = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        disabled = false,
                        keymaps = {
                            ["fo"] = { query = "@function.outer", desc = "Select outer part of a function" },
                            ["fi"] = { query = "@function.inner", desc = "Select inner part of a function" },
                            ["co"] = { query = "@class.outer", desc = "Select outer part of a class" },
                            ["ci"] = { query = "@class.inner", desc = "Select inner part of a class" },
                        },
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            local builtin = require('telescope.builtin')

            vim.keymap.set("n", "<C-t>ff", builtin.find_files)
            vim.keymap.set("n", "<C-t>lg", builtin.live_grep)
            vim.keymap.set("n", "<C-t>c", builtin.colorscheme)        
            vim.keymap.set("n", "<C-t>gc", builtin.git_commits)
            vim.keymap.set("n", "<C-t>gb", builtin.git_branches)
        end,
    },
})
