return {
    {
        "vague2k/vague.nvim",
        lazy = false,
        enabled = true,
        priority = 100,
        config = function ()
            require("vague").setup({
                transparent = true,
                bold = false,
                italic = false,
            })
            vim.cmd.colorscheme("vague")
        end,
    }
}
