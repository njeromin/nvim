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

M.readAll = function(file)
  local f = assert(io.open(file, "rb"))
  local content = f:read("*all")
  f:close()
  return content
end

M.loadConfig = function ()
  local ok, toml = pcall(require, "lua-toml")
  if not ok then return {} end

  return toml.parse(M.readAll(vim.fn.stdpath("config").."/config.toml"))
end

return M
