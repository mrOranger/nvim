return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        enabled = false,
        priority = 100,
        config = function ()
            require("onedark").load()
            vim.cmd.colorscheme("onedark")
        end,
    },
}
