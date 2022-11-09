return function ()
  local colours = {
    bg = "#262626",
    bg_dark = "#1e1e1e",
    fg = "#ffffff",
    fg_dark = "#fcfcfc",

    grey = "#c0bfbc",
    red = "#f66151",
    blue = "#99c1f1",
    cyan = "#93ddc2",
    purple = "#dc8add",
    violet = "#7D8AC7",
    green = "#8ff0a4",
    brown = "#cda88f",
    orange = "#ffbe6f",
    yellow = "#f9f06b",
    primary = "#ffa348",
  }

  -- default syntax
  group("Comment", { fg = colours.grey })
  group("Constant", { fg = colours.violet })
  group("String", { fg = colours.cyan })
  group("Character", { fg = colours.cyan })
  group("Number", { fg = colours.violet })
  group("Boolean", { fg = colours.violet })
  group("Float", { fg = colours.violet })
  group("Identifier", { fg = colours.orange })
  group("Function", { fg = colours.blue })
  group("Statement", { fg = colours.purple })
  group("Conditional", { fg = colours.orange, bold = true })
  group("Repeat", { fg = colours.purple })
  group("Label", { fg = colours.purple })
  group("Operator", { fg = colours.fg_dark })
  group("Keyword", { fg = colours.orange, bold = true })
  group("Exception", { fg = colours.orange })
  group("PreProc", { fg = colours.violet })
  group("Include", { fg = colours.orange, bold = true })
  group("Define", { fg = colours.yellow })
  group("Macro", { fg = colours.yellow })
  group("Type", { fg = colours.cyan, bold = true })
  group("StorageClass", { fg = colours.cyan, bold = true })
  group("Typedef", { fg = colours.cyan, bold = true })
  group("Structure", { fg = colours.cyan })
  group("Special", { fg = colours.red })
  group("SpecialChar", { fg = colours.red })
  group("Tag", { fg = colours.cyan })
  group("Delimiter", { fg = colours.fg_dark })
  group("SpecialComment", { fg = colours.bg })
  group("Debug", { fg = colours.fg_dark })
  group("Underline", { fg = colours.fg_dark })
  group("Conceal", { fg = colours.fg_dark })
  group("Ignore", { fg = colours.fg_dark })
  group("Error", { fg = colours.red, undercurl = true })
  group("Todo", { fg = colours.fg_dark })
  group("SpellBad", { fg = colours.red, undercurl = true })
  group("SpellCap", { fg = colours.red, undercurl = true })
  group("SpellRare", { fg = colours.red, undercurl = true })
  group("SpellLocal", { fg = colours.red, undercurl = true })
  group("Whitespace", { fg = colours.bg_dark })

  -- treesitter
  group("@punctuation.bracket", { fg = colours.fg_dark })
  group("@punctuation.special", { fg = colours.red })
  group("@constant", { fg = colours.violet })
  group("@constant.builtin", { fg = colours.violet })
  group("@constant.macro", { fg = colours.cyan })
  group("@string.regex", { fg = colours.cyan })
  group("@string", { fg = colours.cyan })
  group("@character", { fg = colours.cyan })
  group("@number", { fg = colours.violet })
  group("@boolean", { fg = colours.violet })
  group("@float", { fg = colours.violet })
  group("@annotation", { fg = colours.yellow })
  group("@attribute", { fg = colours.orange })
  group("@namespace", { fg = colours.orange })
  group("@function.builtin", { fg = colours.blue })
  group("@function.macro", { fg = colours.blue })
  group("@function", { fg = colours.blue })
  group("@parameter", { fg = colours.fg_dark })
  group("@paramter.reference", { fg = colours.fg_dark })
  group("@method", { fg = colours.blue })
  group("@field", { fg = colours.primary })
  group("@property", { fg = colours.fg_dark })
  group("@constructor", { fg = colours.blue })
  group("@conditional", { fg = colours.orange, bold = true })
  group("@repeat", { fg = colours.purple })
  group("@label", { fg = colours.purple })
  group("@operator", { fg = colours.fg_dark })
  group("@keyword", { fg = colours.orange, bold = true })
  group("@keyword.function", { fg = colours.orange, bold = true })
  group("@keyword.operator", { fg = colours.orange, bold = true })
  group("@exception", { fg = colours.orange })
  group("@type", { fg = colours.cyan, bold = true })
  group("@type.builtin", { fg = colours.cyan, bold = true })
  group("@structure", { fg = colours.cyan, bold = true })
  group("@include", { fg = colours.orange, bold = true })
  group("@variable", { fg = colours.fg_dark })
  group("@variable.builtin", { fg = colours.fg_dark })
  group("@text", { fg = colours.cyan })
  group("@underline", { fg = colours.fg_dark })
  group("@tag", { fg = colours.cyan })
  group("@tag.delimiter", { fg = colours.cyan })
  group("@title", { fg = colours.cyan })
  group("@emphasis", { italic = true })
  group("@strong", { bold = true })
  group("@uri", { fg = colours.blue })
  group("@text.reference", { fg = colours.red })
  group("@punctuation.delimiter", { fg = colours.fg_dark })
  group("@string.escape", { fg = colours.cyan })
  group("@note", { fg = colours.blue })
  group("@warning", { fg = colours.yellow })
  group("@error", { fg = colours.red })

  return colours
end
