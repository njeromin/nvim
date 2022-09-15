local colours = require("theme.colours") or {}
local utils = require("utils.colours")
local floatbg = utils.darken(colours.bg.base, 5)
local treebg = utils.darken(colours.bg.base, 10)
return {
  NeoTreeNormal = { bg = treebg },
  NeoTreeNormalNC = { bg = treebg },
  NeoTreeWinSeparator = { fg = treebg, bg = treebg },
  NeoTreeFloatBorder = { fg = floatbg, bg = floatbg },
  NeoTreeFloatTitle = { fg = colours.heading.h2, bg = floatbg },
  NeoTreeDirectoryIcon = { fg = colours.blue, },
  NeoTreeDirectoryName = { fg = colours.blue },

  BufferLineOffsetSeparator = { fg = treebg, bg = treebg },
}
