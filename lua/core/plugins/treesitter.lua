return {
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = false,
        enabled = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                disable = { "markdown" },
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
    }
}
