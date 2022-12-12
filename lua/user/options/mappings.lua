vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal filesystem<cr>", { silent = true })
vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { silent = true })
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "t" }, "<A-f>", "<cmd>ToggleTerm<cr>", { silent = true })
