return {
    {
        "everviolet/nvim",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            vim.cmd.colorscheme("evergarden-winter")
        end,
    }
}
