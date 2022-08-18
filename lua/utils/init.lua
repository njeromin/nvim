local M = {}

M.combineTables = function (a, b)
  local result = {}

  for _,v in pairs ( a ) do
    table.insert( result, v )
  end

  for _,v in pairs ( b ) do
    table.insert( result, v )
  end

  return result
end

M.requirePluginConfig = function (configName, handler)
  SafeRequire(string.format("plugins.configs.%s", configName), handler)
end

M.readAll = function(file)
  local f = assert(io.open(file, "rb"))
  local content = f:read("*all")
  f:close()
  return content
end

return M
