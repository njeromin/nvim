local M = {}

local types = {
  ["tri_left"] = "",
  ["tri_right"] = "",
  ["tri_left_inv"] = "",
  ["tri_right_inv"] = "",
}

M.sep = function (type, col_a, col_b, padding_l, padding_r)
  if not col_b then col_b = groups.StatusLine.bg end
  if types[type] == nil then return "" end
  local gr_a = string.format("@%s%s", type, col_a:sub(2))
  local gr_b = string.format("@%s%s", type, col_b:sub(2))
  group(gr_a, { bg = col_a, fg = col_b })
  group(gr_b, { bg = col_b })
  padding_l = padding_l or ""
  padding_r = padding_r or ""
  return padding_l.."%#"..gr_a.."#"..types[type].."%#"..gr_b.."#"..padding_r
end

return M
