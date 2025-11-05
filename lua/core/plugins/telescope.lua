return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        enabled = true,
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            local builtin = require("telescope.builtin")
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local actions = require("telescope.actions")
            local state = require("telescope.actions.state")
            local conf = require("telescope.config").values

            local custom_commands = {
                {
                    name = "w!",
                    cmd = "w!",
                    description = "Force to save the current buffer",
                },
                {
                    name = "wa!",
                    cmd = "wa!",
                    description = "Force to save all buffers",
                },
                {
                    name = "q!",
                    cmd = "q!",
                    description = "Force to close current buffer",
                },
                {
                    name = "qa!",
                    cmd = "qa!",
                    description = "Force to close all buffers",
                },
                {
                    name = "wq!",
                    cmd = "wq!",
                    description = "Force to save and close current buffer",
                },
                {
                    name = "wqa!",
                    cmd = "wqa!",
                    description = "Force to save and close all buffers",
                },
                {
                    name = "InspectTr",
                    cmd = "InspectTr",
                    description = "Display TreeSitter abstract syntax tree",
                },
                {
                    name = "Telescope colorscheme",
                    cmd = "Telescope colorscheme",
                    description = "Change current colorscheme",
                },
                {
                    name = "Telescope find_files",
                    cmd = "Telescope find_files",
                    description = "Open Telescope file finder",
                },
                {
                    name = "Telescope Fuzzy Find",
                    cmd = "Telescope current_buffer_fuzzy_find",
                    description = "Open Telescope finder function",
                },
                {
                    name = "Harpoon list():add()",
                    cmd = "lua require('harpoon').setup():list():add()",
                    description = "Select current file with Harpoon",
                },
                {
                    name = "Harpoon list():remove()",
                    cmd = "lua require('harpoon').setup():list():remove()",
                    description = "Remove current file from Harpoon selected ones",
                },
                {
                    name = "Harpoon quick_menu",
                    cmd = "lua require('harpoon').ui:toggle_quick_menu(harpoon:list())",
                    description = "Show Harpoon selected files",
                },
            }

            local function run ()

                local function attach (prompt_bufnr)
                    actions.select_default:replace(function()
                        local selection = state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        vim.cmd(selection.value.cmd)
                    end)
                    return true
                end

                local finder = finders.new_table({
                    results = custom_commands,
                    entry_maker = function(entry)
                        return {
                            value = entry,
                            ordinal = entry.name .. " " .. entry.description,
                            display = function (table)
                                local displayer = require("telescope.pickers.entry_display").create({
                                    separator = " │ ",
                                    items = {
                                        { width = 25 },
                                        { remaining = true },
                                    },
                                })
                                return displayer({
                                    table.value.name,
                                    { table.value.description, "TelescopeResultsComment" },
                                })
                            end,
                        }
                    end,
                })

                local picker_opts = {
                    prompt_title = "Run Commands",
                    finder = finder,
                    sorter = conf.generic_sorter({}),
                    attach_mappings = attach,
                    layout_strategy = "center",
                    layout_config = {
                        width = 0.4,
                        height = 0.4,
                        preview_cutoff = 1,
                    },
                }

                local new_picker = pickers.new({}, picker_opts)
                new_picker:find()

            end

            vim.keymap.set("n", "<C-p>", run)

            vim.keymap.set("n", "<C-t>ff", builtin.find_files)
            vim.keymap.set("n", "<C-t>lg", builtin.live_grep)
            vim.keymap.set("n", "<C-t>c", builtin.colorscheme)
            vim.keymap.set("n", "<C-t>gc", builtin.git_commits)
            vim.keymap.set("n", "<C-t>gb", builtin.git_branches)
            vim.keymap.set("n", "<C-t>sd", builtin.diagnostics)

        end,
    },

}
