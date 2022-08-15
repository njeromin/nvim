function SafeRequire(package_name, handler)
  local ok, package = pcall(require, package_name)

  if ok then
    if type(handler) ~= "function" then
      handler(package)
    end
  else
    vim.notify(string.format("failed to require package '%s'", package_name))
  end
end

SafeRequire("impatient")
SafeRequire("packer_compiled")

SafeRequire("core.packer")
SafeRequire("core.options")
