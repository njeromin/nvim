local attempt = require("attempt")

attempt.setup()

local function map(mode, l, r, opts)
    opts = opts or {}
    opts = vim.tbl_extend('force', { silent=true }, opts)
    vim.keymap.set(mode, l, r, opts)
end
