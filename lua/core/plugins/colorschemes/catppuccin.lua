return {
    {
        "catppuccin/nvim",
        lazy = false,
        enabled = true,
        priority = 100,
        name = "catppuccin",
        config = function ()
            require("catppuccin").setup()
            vim.cmd.colorscheme("catppuccin")
        end,
    }
}
