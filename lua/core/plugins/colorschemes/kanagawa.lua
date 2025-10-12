return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            vim.cmd.colorscheme("kanagawa")
        end,
    }
}

