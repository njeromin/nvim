pcall(require, "impatient")

-- set up import global
_G.import = function (pkg_name, pkg_handler)
  local ok, pkg = pcall(require, pkg_name)
  if ok then
    pkg_handler(pkg)
  end
end
import("import", function (imp) _G.import = imp.import end)

-- require core
require("core.options")
require("core.packer")

-- load neovide config if needed
if vim.g.neovide then
  require("core.neovide")
end
