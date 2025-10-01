vim.g.mapleader = " " 

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Quit Without Save" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>w!", ":w!<CR>", { desc = "Force Write" })
vim.keymap.set("n", "<leader>x", ":qa<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>X", ":qa!<CR>", { desc = "Quite All Without Save" })

