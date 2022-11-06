local utils = require("theme.utils")

return function (group, groups)
  local colours = {
    bg = "#252931",
    bg_dark = "#1d2025",
    fg = "#cccccc",
    fg_dark = "#abb2bf",

    grey = "#7f848e",
    red = "#e06c75",
    blue = "#61afef",
    cyan = "#56b6c2",
    purple = "#c678dd",
    green = "#98c379",
    brown = "#be5046",
    orange = "#d19a66",
    yellow = "#e5c07b",
    primary = "#528bff",
  }

  -- syntax/treesitter
  group("Comment", { fg = colours.grey })
  group("Identifier", { fg = colours.blue })
  group("Statement", { fg = colours.purple })
  group("Special", { fg = colours.fg })
  group("Constant", { fg = colours.purple })
  group("String", { fg = colours.green })
  group("Boolean", { fg = colours.orange })
  group("Number", { fg = colours.orange })
  group("Conditional", { fg = colours.yellow })

  group("@function", { fg = colours.blue })
  group("@function.builtin", { fg = colours.cyan })
  group("@function.macro", { fg = colours.orange })
  group("@keyword", { fg = colours.purple })
  group("@conditional", { fg = colours.purple })
  group("@structure", { fg = colours.purple })
  group("@variable", { fg = colours.red })
  group("@constant", { fg = colours.orange })
  group("@constant.builtin", { fg = colours.yellow })
  group("@constant.macro", { fg = colours.purple })
  group("@define", { fg = colours.purple })
  group("@macro", { fg = colours.purple })
  group("@preproc", { fg = colours.purple })
  group("@include", { fg = colours.purple })
  group("@namespace", { fg = colours.purple })
  group("@string", { fg = colours.green })
  group("@string.escape", { fg = colours.orange })
  group("@string.special", { fg = colours.orange })
  group("@number", { fg = colours.orange })
  group("@float", { fg = colours.orange })
  group("@boolean", { fg = colours.orange })
  group("@parameter", { fg = colours.red })
  group("@field", { fg = colours.red })
  group("@repeat", { fg = colours.yellow })
  group("@label", { fg = colours.yellow })
  group("@type", { fg = colours.yellow })
  group("@exception", { fg = colours.yellow })
  group("@type.definition", { fg = colours.yellow })
  group("@storageclass", { fg = colours.yellow })
  group("@constructor", { fg = colours.yellow })
  group("@operator", { fg = colours.fg_dark })
  group("@punctuation", { fg = colours.fg })

  return colours
end
