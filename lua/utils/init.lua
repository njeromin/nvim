local M = {}

M.requirePluginConfig = function (configName, handler)
  SafeRequire(string.format("plugins.configs.%s", configName), handler)
end

return M
