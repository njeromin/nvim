local colours = require("theme.colours") or {}
local utils = require("utils.colours")

local function kindHighlight(colour)
  return { fg = "#ffffff", bg = colour }
end

local kind_1 = kindHighlight(colours.red)
local kind_2 = kindHighlight(colours.green)
local kind_3 = kindHighlight(colours.yellow)
local kind_4 = kindHighlight(colours.magenta)
local kind_5 = kindHighlight(utils.darken(colours.fg, 20))
local kind_6 = kindHighlight(colours.orange)
local kind_7 = kindHighlight(colours.blue)
local kind_8 = kindHighlight(colours.cyan)

return {
  CmpNormal = { fg = colours.fg, bg = utils.lighten(colours.bg.base, 6) },
  CmpCursor = { fg = "NONE", bg = utils.lighten(colours.bg.base, 12) },

  CmpItemAbbrDeprecated = { fg = colours.fg2, bg = "NONE", strikethrough = true },
  CmpItemAbbrMatch = { fg = colours.blue, bg = "NONE", bold = true },
  CmpItemAbbrMatchFuzzy = { fg = colours.blue, bg = "NONE", bold = true },
  CmpItemMenu = { fg = colours.fg2, bg = "NONE", italic = true },

  CmpItemKindField = kind_1,
  CmpItemKindProperty = kind_1,
  CmpItemKindEvent = kind_1,

  CmpItemKindText = kind_2,
  CmpItemKindEnum = kind_2,
  CmpItemKindKeyword = kind_2,

  CmpItemKindConstant = kind_3,
  CmpItemKindConstructor = kind_3,
  CmpItemKindReference = kind_3,

  CmpItemKindFunction = kind_4,
  CmpItemKindStruct = kind_4,
  CmpItemKindClass = kind_4,
  CmpItemKindModule = kind_4,
  CmpItemKindOperator = kind_4,

  CmpItemKindVariable = kind_5,
  CmpItemKindFile = kind_5,

  CmpItemKindUnit = kind_6,
  CmpItemKindSnippet = kind_6,
  CmpItemKindFolder = kind_6,

  CmpItemKindMethod = kind_7,
  CmpItemKindValue = kind_7,
  CmpItemKindEnumMember = kind_7,
  
  CmpItemKindInterface = kind_8,
  CmpItemKindColor = kind_8,
  CmpItemKindTypeParameter = kind_8,
}
