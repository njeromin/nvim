local colours = require("theme.colours") or {}
local utils = require("utils.colours")
local floatbg = utils.darken(colours.bg.base, 5)
return {
  Float = { fg = colours.fg, bg = floatbg },
  FloatBorder = { fg = floatbg, bg = floatbg },
  FloatTitle = { fg = "#111111", bg = colours.orange },
  NormalFloat = { bg = floatbg },
  WhichKeyFloat = { bg = floatbg },
}
