return {
    {
        "saghen/blink.cmp",
        lazy = false,
        enabled = true,
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = {
            keymap = { preset = "super-tab" },
            appearance = { nerd_font_variant = "mono" },
            completion = { documentation = { auto_show = true } },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offest = 100,
                    },
                },
            },
        },
        opts_extend = { "sources.default" },
    },
}
