local defaults = {"python3", "ruby", "perl", "node"}

local function module(opts)
  for i, v in ipairs(opts or defaults) do
    vim.g[string.format("loaded_%s_provider", defaults)] = 1
  end
end

return {
  module = module,
}
