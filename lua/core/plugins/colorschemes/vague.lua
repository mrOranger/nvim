return {
    {
        "vague2k/vague.nvim",
        lazy = false,
        enabled = false,
        config = function ()
            require("vague").setup()
            vim.cmd.colorscheme("vague")
        end,
    }
}
