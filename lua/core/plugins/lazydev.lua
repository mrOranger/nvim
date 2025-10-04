return {
    {
        "folke/lazydev.nvim",
        lazy = false,
        enabled = true,
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" }}
            },
        },
    },
}
