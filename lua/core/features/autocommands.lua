local function module(opts)
  -- packer
  local ok, packer = pcall(require, "packer")
  if ok and core.enabled_features["packer"] then
    
  end
end

return {
  module = module,
}
