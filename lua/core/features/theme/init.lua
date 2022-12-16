local function default_highlights(t, hl)
  local theme = t.theme

  hl.set("Normal", { bg = theme.background.base, fg = theme.foreground.base })
  hl.set("NormalNC", hl.get("Normal"))
  hl.set("CursorLine", { bg = theme.cursor_line })
  hl.set("Visual", { bg = theme.visual })
  hl.set("SignColumn", { bg = theme.background.base, fg = theme.sign_column })
  hl.set("CursorLineNr", { fg = theme.colours.blue })
  hl.set("LineNr", { fg = theme.line_number })

  hl.set("Pmenu", {  fg = theme.foreground.base, bg = theme.background.pmenu })
  hl.set("PmenuSbar", hl.get("Pmenu"))
  hl.set("PmenuSel", { bg = theme.background.tree })
  hl.set("PmenuThumb", { bg = theme.background.tree, fg = theme.background.tree })
  hl.set("FloatBorder", { fg = theme.background.pmenu, bg = theme.background.pmenu })

  hl.set("StatusLine", { bg = theme.background.tree, fg = theme.foreground.base })

  hl.set("DiffAdd", { bg = "NONE", fg = theme.git.diff_add })
  hl.set("DiffRemove", { bg = "NONE", fg = theme.git.diff_remove })
  hl.set("DiffChange", { bg = "NONE", fg = theme.git.diff_change })

  hl.set("NeoTreeNormal", { fg = theme.foreground.base, bg = theme.background.tree })
  hl.set("NeoTreeNormalNC", hl.get("NeoTreeNormal"))
  hl.set("NeoTreeWinSeparator", { bg = theme.background.tree, fg = theme.background.tree })
  hl.set("NeoTreeDirectoryIcon", { fg = theme.colours.primary })
  hl.set("NeoTreeDirectoryName", hl.get("NeoTreeDirectoryIcon"))
  hl.set("BufferLineOffsetSeparator", hl.get("NeoTreeWinSeparator"))

  hl.set("IndentBlanklineChar", { fg = theme.colours.grey })

  hl.set("BarbecueBasename", { fg = theme.colours.light_grey })
  hl.set("BarbecueContext", { fg = theme.colours.light_grey })
  hl.set("BarbecueDirname", { fg = theme.colours.light_grey })
  hl.set("BarbecueSeparator", { fg = theme.colours.grey })

  local syntax = {
    String = {},
    Character = {},
    Number = {},
    Float = {},
    Boolean = {},
    Type = {},
    Identifier = {},
    Constant = {},
    Function = {},
    Statement = {},
    PreProc = {},
    PreCondit = {},
    Include =  {},
    Keyword = {},
    Define = {},
    Typedef = {},
    Exception = {},
    Conditional = {},
    Repeat = {},
    Macro = {},
    Error = {},
    Label = {},
    Special = {},
    SpecialChar = {},
    Operator = {},
    Title = {},
    Tag = {},
    Comment = {},
    Delimiter = {},
    SpecialComment = {},
    Todo = {},
  }
  for k, v in pairs(syntax) do
    hl.set(k, vim.tbl_extend("keep", v or {}, { fg = theme.syntax[k] }))
  end
end

local function load_theme(opts)
  local hl_utils = require("core.features.theme.hl_utils")

  local ok, t = pcall(require, string.format("themes.%s", opts.name))
  if not ok then
    print(string.format("Failed to load theme '%s' : %s", opts.name, t))
    return
  end

  -- load theme into core global
  core.theme = t.theme

  -- load default highlights
  default_highlights(t, hl_utils)

  -- load custom highlights
  if vim.is_callable(t.custom_highlights) then t.custom_highlights(hl_utils) end
end

local function module(opts)
  -- default options
  local o = vim.tbl_deep_extend("keep", type(opts) == "table" and opts or {}, {
    name = "default",
  })
  load_theme(o)
end

return {
  module = module,
}
