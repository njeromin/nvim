local function module(opts)
  if type(opts["__luacache_config"]) == "table" then
    _G.__luacache_config = opts["__luacache_config"]
  end

  local ok, impatient = pcall(require, "impatient")
  if not ok then return end

  if opts.profile == true then
    impatient.enable_profile()
  end
end

return {
  module = module,
  packer = {
    { "lewis6991/impatient.nvim" },
  },
}
