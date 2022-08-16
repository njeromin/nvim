local config = require("utils").loadConfig()
local options = config.options or {}
local vimopts = config.vimopts or {}

-- set indent width
local indent_width = options.indent_width or 2
vim.opt.shiftwidth = indent_width
vim.opt.tabstop = indent_width
vim.opt.softtabstop = indent_width

-- set rest of options
for k,v in pairs(vimopts) do
  -- add append helper
  if require("utils.string").starts(v, "{+=}") then
    v = vim.opt[k]:append(v:sub(4)) -- append value without the prefix
  end

  vim.opt[k] = v
end
