local utils = require("theme.utils")

-- TODO: fix treesitter highlights

-- https://camo.githubusercontent.com/410b3ab80570bcd5b470a08d84f93caa5b4962ccd994ebceeb3d1f78364c2120/687474703a2f2f692e696d6775722e636f6d2f776136363678672e706e67
return function (group, groups)
  local colours = {
    bg = "#282828",
    bg_dark = "#1d2021", -- bg0_h
    fg = "#ebdbb2",
    fg_dark = "#d5c4a1", --grubox fg2

    grey = "#a89984",
    red = "#fb4934",
    blue = "#83a598",
    cyan = "#8ec07c", -- gruvbox aqua
    purple = "#d3869b",
    green = "#98971a",
    brown = "#d65d0e", -- gruvbox dark orange
    orange = "#fe8019",
    yellow = "#b8bb26",
    primary = "#689d6a", --gruvbox dark aqua
  }

  -- syntax/treesitter
  group("Comment", { fg = colours.grey })
  group("Identifier", { fg = colours.blue })
  group("@function", { fg = colours.blue })
  group("@function.builtin", { fg = colours.cyan })
  group("@function.macro", { fg = colours.orange })
  group("@keyword", { fg = colours.red })
  group("@conditional", { fg = colours.red })
  group("@structure", { fg = colours.red })
  group("@constant", { fg = colours.red })
  group("@constant.builtin", { fg = colours.orange })
  group("@constant.macro", { fg = colours.red })
  group("@define", { fg = colours.cyan })
  group("@macro", { fg = colours.cyan })
  group("@preproc", { fg = colours.cyan })
  group("@include", { fg = colours.cyan })
  group("@string", { fg = colours.green })
  group("@string.escape", { fg = colours.orange })
  group("@number", { fg = colours.orange })
  group("@float", { fg = colours.orange })
  group("@boolean", { fg = colours.yellow })
  group("@parameter", { fg = colours.purple })
  group("@field", { fg = colours.purple })
  group("@repeat", { fg = colours.yellow })
  group("@label", { fg = colours.yellow })
  group("@type", { fg = colours.yellow })
  group("@exception", { fg = colours.yellow })
  group("@type.definition", { fg = colours.yellow })
  group("@storageclass", { fg = colours.yellow })
  group("@operator", { fg = colours.fg_dark })
  group("@punctuation", { fg = colours.fg_dark })

  return colours
end
