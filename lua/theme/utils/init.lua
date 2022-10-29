local hsluv = require("theme.utils.hsluv")

local M = {}

M.groups = {}

M.group = function (name, hl)
  for k, v in pairs(hl) do
    if type(v) == "table" then
      hl[k] = hsluv.hsluv_to_hex(v)
    end
  end
  M.groups[name] = hl
  vim.api.nvim_set_hl(0, name, hl)
end

M.darken = function (val, percent)
  local hsl
  if type(val) == "string" then
    hsl = hsluv.hex_to_hsluv(val)
  else
    hsl = val
  end

  hsl[3] = math.max(hsl[3] - percent, 0)

  return hsluv.hsluv_to_hex(hsl)
end

M.lighten = function (val, percent)
  local hsl
  if type(val) == "string" then
    hsl = hsluv.hex_to_hsluv(val)
  else
    hsl = val
  end

  hsl[3] = math.min(hsl[3] + percent, 100)

  return hsl
end

return M
