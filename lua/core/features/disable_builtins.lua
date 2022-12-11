local defaults = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwFileHandlers",
  "vimball",
  "vimballPlugin",
}

local function module(opts)
  for k, v in pairs(opts or defaults) do
    vim.g[string.format("loaded_%s", v)] = 1
  end
end

return {
  module = module,
}
