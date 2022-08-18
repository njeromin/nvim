-- load impatient
pcall(require, "impatient")
pcall(require, "plugin.packer_compiled")

function SafeRequire(package_name, handler)
  local ok, package = pcall(require, package_name)

  if ok then
    if type(handler) == "function" then
      handler(package)
	  end
  elseif packer_plugins["nvim-notify"] then
    require("notify")(tostring(package), "error", {
      title = string.format("Failed to require '%s'", package_name)
    })
  end
end

SafeRequire("toml", function (toml)
	_G.config = toml.decode(require("utils").readAll(string.format("%s/lua/user/config.toml", vim.fn.stdpath("config"))))
end)
if type(_G.config) ~= "table" then _G.config = {} end

SafeRequire("core.options")
SafeRequire("core.packer")
