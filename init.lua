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

-- load custom per-directory config
local custom_nvim_path = string.format("%s/.nvim", vim.fn.getcwd())
local ok, _ = pcall(dofile, string.format("%s/init.lua", custom_nvim_path))
if ok then
  local nvim_path = vim.fn.stdpath("config")
  os.execute(string.format("cp \"%s/.stylua.toml\" \"%s/.stylua.toml\"", nvim_path, custom_nvim_path))
  os.execute(string.format("cp \"%s/neovim.yml\" \"%s/neovim.yml\"", nvim_path, custom_nvim_path))
  os.execute(string.format("cp \"%s/selene.toml\" \"%s/selene.toml\"", nvim_path, custom_nvim_path))
end
