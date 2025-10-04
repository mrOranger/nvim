return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        enabled = false,
        config = function ()
            require("onedark").load()
            vim.cmd.colorscheme("onedark")
        end,
    },
}
