local colours = require("theme.colours") or {}
local utils = require("utils.colours")
local masonbg = utils.darken(colours.bg.base, 5)
local fg_dark = utils.darken(colours.fg, 25)
return {
  MasonHeader = { fg = "#111111", bg = colours.red },
  MasonHighlight = { fg = colours.blue },
  MasonHighlightBlock = { fg = masonbg, bg = colours.green },
  MasonHighlightBlockBold = { fg = masonbg, bg = colours.green },
  MasonHeaderSecondary = { fg = masonbg, bg = colours.magenta },
  MasonMuted = { fg = fg_dark },
  MasonMutedBlock = { fg = fg_dark, bg = masonbg },
}
