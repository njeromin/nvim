require("hlslens").setup()

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", opts)
map("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", opts)

map("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", opts)
map("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", opts)
map("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", opts)
map("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", opts)

map("n", "<Leader>l", ":noh<CR>", opts) 
