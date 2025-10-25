return {
    {
        "catppuccin/nvim",
        lazy = false,
        enabled = false,
        priority = 100,
        name = "catppuccin",
        config = function ()
            require("catppuccin").setup({
                transparent_background = true
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    }
}
