require("icon-picker").setup({
  disable_legacy_commands = true
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ip", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("n", "<leader>ipn", "<cmd>IconPickerNormal nerd_font<cr>", opts)
