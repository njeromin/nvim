local utils = require("theme.utils")

-- TODO: fix treesitter highlights

-- https://camo.githubusercontent.com/410b3ab80570bcd5b470a08d84f93caa5b4962ccd994ebceeb3d1f78364c2120/687474703a2f2f692e696d6775722e636f6d2f776136363678672e706e67
return function (group, groups)
  local colours = {
    bg = "#282828",
    bg_dark = "#1f1f1f", -- bg0_h
    fg = "#ebdbb2",
    fg_dark = "#d5c4a1", --grubox fg2

    grey = "#a89984",
    red = "#fb4934",
    blue = "#83a598",
    cyan = "#8ec07c", -- gruvbox aqua
    purple = "#d3869b",
    green = "#b8bb26",
    brown = "#d65d0e", -- gruvbox dark orange
    orange = "#fe8019",
    yellow = "#fabd2f",
    primary = "#689d6a", --gruvbox dark aqua
  }

  -- syntax/treesitter
  group("Comment", { fg = colours.grey })
  group("Identifier", { fg = colours.blue })
  group("Statement", { fg = colours.red })
  group("Special", { fg = colours.fg })
  group("Constant", { fg = colours.fg })
  group("String", { fg = colours.cyan })
  group("Boolean", { fg = colours.purple })
  group("Number", { fg = colours.purple })
  group("Conditional", { fg = colours.red })

  group("@annotation", { fg = colours.purple })
  group("@attribute", { fg = colours.purple })
  group("@boolean", { fg = colours.purple })
  group("@character", { fg = colours.aqua })
  group("@comment", { fg = colours.grey })
  group("@conditional", { fg = colours.red })
  group("@constant.builtin", { fg = colours.blue, italic = true })
  group("@constant.macro", { fg = colours.blue, italic = true })
  group("@constant", { fg = colours.fg })
  group("@constructor", { fg = colours.brown })
  group("@exception", { fg = colours.red })
  group("@field", { fg = colours.green })
  group("@float", { fg = colours.purple })
  group("@function.builtin", { fg = colours.green, bold = true })
  group("@function.macro", {  fg = colours.green, bold = true })
  group("@include", { fg = colours.red })
  group("@keyword", { fg = colours.red })
  group("@keyword.function", { fg = colours.red })
  group("@keyword.operator", { fg = colours.orange })
  group("@label", { fg = colours.orange })
  group("@method", { fg = colours.green, bold = true })
  group("@namespace", { fg = colours.yellow, italic = true })
  group("@none", { fg = colours.fg })
  group("@number", { fg = colours.purple })
  group("@operator", { fg = colours.orange })
  group("@parameter", { fg = colours.fg })
  group("@parameter.reference", { fg = colours.fg })
  group("@property", { fg = colours.fg })
  group("@punctuation", { fg = colours.fg })
  group("@punctuation.bracket", { fg = colours.fg })
  group("@punctuation.delimiter", { fg = colours.grey })
  group("@punctuation.special", { fg = colours.blue })
  group("@repeat", { fg = colours.red })
  group("@storageclass", { fg = colours.orange })
  group("@string", { fg = colours.cyan })
  group("@string.escape", { fg = colours.green })
  group("@string.special", { fg = colours.green })
  group("@string.regex", { fg = colours.green })
  group("@symbol", { fg = colours.fg })
  group("@tag", { fg = colours.orange })
  group("@tag.delimiter", { fg = colours.green })
  group("@text", { fg = colours.green })
  group("@strike", { fg = colours.grey })
  group("@math", { fg = colours.blue })
  group("@type", { fg = colours.yellow })
  group("@type.builtin", { fg = colours.yellow, italic = true })
  group("@uri", { fg = colours.blue, underline = true })
  group("@variable", { fg = colours.fg })
  group("@variable.builtin", { fg = colours.blue, italic = true })
  group("@structure", { fg = colours.red })

  return colours
end
