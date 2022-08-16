function SafeRequire(package_name, handler)
  local ok, package = pcall(require, package_name)

  if ok then
    if type(handler) == "function" then
      handler(package)
    end
  else
    vim.notify(string.format("Failed to require package '%s'", package_name))
  end
end

SafeRequire("impatient")

SafeRequire("core.options")
SafeRequire("core.packer")
