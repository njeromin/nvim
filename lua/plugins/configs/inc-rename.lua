local ok, inc_rename = pcall(require, "inc_rename")
if not ok then return end

inc_rename.setup({
  show_message = false,
})

vim.keymap.set("n", "<leader>rn", function ()
---@diagnostic disable-next-line: missing-parameter
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
