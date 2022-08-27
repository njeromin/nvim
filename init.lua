-- load impatient
pcall(require, "impatient")
pcall(require, "plugin.packer_compiled")

function SafeRequire(package_name, handler)
  local ok, package = pcall(require, package_name)

  if ok then
    if type(handler) == "function" then
      handler(package)
    end
  else
    local n_ok, n = pcall(require, "notify")
    if n_ok then
      ---@diagnostic disable-next-line: redundant-parameter
      n(package, "error", { title = string.format("Failed to load '%s'", package_name) })
    end
  end
end

SafeRequire("core.options")
SafeRequire("core.packer")
