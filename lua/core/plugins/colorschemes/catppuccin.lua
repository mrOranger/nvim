return {
    {
        "catppuccin/nvim",
        lazy = false,
        enabled = false,
        config = function ()
            require("catppuccin").setup({ flavor = "mocha", transparent_background = true, })
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    }
}
