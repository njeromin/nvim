local M = {}

M.interfaces = {
  ["options"] = require("interface.options")
}

M.open = function (name)
  M.interfaces[name].open()
end

M.close = function (name)
  M.interfaces[name].close()
end

return M
