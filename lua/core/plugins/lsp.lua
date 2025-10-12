return {
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        enabled = true,
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function ()
            require("mason").setup({})
            vim.diagnostic.config({
                virtual_text = true,
                virtual_line = true,
            })
        end,
    }
}
