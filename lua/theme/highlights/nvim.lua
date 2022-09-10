local colours = require("theme.colours") or {}
local utils = require("utils.colours")
local splitbg = utils.darken(colours.bg.base, 10)
return {
  VertSplit = { fg = splitbg, bg = splitbg },
  WinSeparator = { fg = splitbg, bg = splitbg },

  FoldColumn = { fg = colours.syntax.comment, bg = colours.bg.base }
}
