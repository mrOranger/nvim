return {
    {
        "morhetz/gruvbox",
        lazy = false,
        enabled = false,
        config = function ()
            require("gruvbox").setup()
            vim.cmd.colorscheme("gruvbox")
        end,
    }
}
