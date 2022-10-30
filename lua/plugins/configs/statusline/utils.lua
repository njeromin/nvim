local M = {}

local types = {
  ["tri_left"] = "",
  ["tri_right"] = "",
  ["tri_left_inv"] = "",
  ["tri_right_inv"] = "",
}

M.sep = function (type, hl_name)
  local t = types[type]
  if not t then return " " end
  return string.format("%s%s", "%#"..hl_name.."#", t)
end

M.reset = function ()
  return "%#StatusLine#"
end

return M
