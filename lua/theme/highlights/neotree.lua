local colours = require("theme.colours") or {}
local utils = require("utils.colours")
local floatbg = utils.darken(colours.bg.base, 5)
local treebg = utils.darken(colours.bg.base, 10)
return {
  NeoTreeNormal = { bg = treebg },
  NeoTreeNormalNC = { bg = treebg },
  --NeoTreeRootName = { fg = colours.orange },
  NeoTreeWinSeparator = { fg = treebg, bg = treebg },
  NeoTreeFloatBorder = { fg = floatbg, bg = floatbg },
  NeoTreeFloatTitle = { fg = colours.heading.h2, bg = floatbg },
}
