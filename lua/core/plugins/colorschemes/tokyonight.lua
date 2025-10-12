return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            vim.cmd.colorscheme("tokyonight")
        end,
    }
}
