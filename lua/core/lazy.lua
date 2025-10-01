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
        config = function ()
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                auto_install = true,
                highlight = {
                    enabled = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function ()
            require("nvim-treesitter.configs").setup({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
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
})
