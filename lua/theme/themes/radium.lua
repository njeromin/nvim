local utils = require("theme.utils")

-- modified radium theme
return function (group, groups)
  local colours = {
    bg = "#101317",
    bg_dark = "#191d22",
    fg = "#d4d4d5",
    fg_dark = "#adadad",

    grey = "#45484c",
    red = "#f87070",
    blue = "#7ab0df",
    cyan = "#50cad2",
    purple = "#c397d8",
    green = "#37d99e",
    brown = "#f25f3a",
    orange = "#f0a988",
    yellow = "#ffe59e",
    primary = "#79dcaa",
  }

  -- syntax/treesitter
  group("Comment", { fg = colours.grey })
  group("Identifier", { fg = colours.blue })
  group("Special", { fg = colours.fg })
  group("@function", { fg = colours.blue })
  group("@function.builtin", { fg = colours.cyan })
  group("@function.macro", { fg = colours.orange })
  group("@keyword", { fg = colours.purple })
  group("@conditional", { fg = colours.purple })
  group("@structure", { fg = colours.purple })
  group("@constant", { fg = colours.purple })
  group("@constant.builtin", { fg = colours.orange })
  group("@constant.macro", { fg = colours.purple })
  group("@define", { fg = colours.purple })
  group("@macro", { fg = colours.purple })
  group("@preproc", { fg = colours.purple })
  group("@include", { fg = colours.purple })
  group("@string", { fg = colours.green })
  group("@string.escape", { fg = colours.orange })
  group("@number", { fg = colours.orange })
  group("@float", { fg = colours.orange })
  group("@boolean", { fg = colours.yellow })
  group("@parameter", { fg = colours.red })
  group("@field", { fg = colours.red })
  group("@repeat", { fg = colours.yellow })
  group("@label", { fg = colours.yellow })
  group("@type", { fg = colours.yellow })
  group("@exception", { fg = colours.yellow })
  group("@type.definition", { fg = colours.yellow })
  group("@storageclass", { fg = colours.yellow })
  group("@operator", { fg = colours.fg_dark })
  group("@punctuation", { fg = colours.fg })

  return colours
end
