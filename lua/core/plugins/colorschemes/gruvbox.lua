return {
    {
        "morhetz/gruvbox",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            require("gruvbox").setup()
            vim.cmd.colorscheme("gruvbox")
        end,
    }
}
