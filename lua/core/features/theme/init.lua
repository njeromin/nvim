local function default_highlights(t, hl)
  local theme = t.theme

  hl.set("Normal", { bg = theme.background.base, fg = theme.foreground.base })
  hl.set("NormalNC", hl.get("Normal"))
  hl.set("NonText", { fg = theme.foreground.secondary })
  hl.set("CursorLine", { bg = theme.cursor_line })
  hl.set("Visual", { bg = theme.visual })
  hl.set("SignColumn", { bg = theme.background.base, fg = theme.sign_column })
  hl.set("CursorLineNr", { fg = theme.colours.blue, bold = true })
  hl.set("LineNr", { fg = theme.line_number })
  hl.set("Search", { fg = "#111111", bg = theme.colours.primary })
  hl.set("VertSplit", { fg = theme.background.tree, bg = theme.background.tree })

  hl.set("Pmenu", {  fg = theme.foreground.base, bg = theme.background.pmenu })
  hl.set("PmenuSbar", hl.get("Pmenu"))
  hl.set("PmenuSel", { bg = theme.background.tree })
  hl.set("PmenuThumb", { bg = theme.background.tree, fg = theme.background.tree })
  hl.set("FloatBorder", { fg = theme.background.pmenu, bg = theme.background.pmenu })

  hl.set("StatusLine", { bg = theme.background.tree, fg = theme.foreground.base })

  hl.set("DiffAdd", { bg = "NONE", fg = theme.git.diff_add })
  hl.set("DiffRemove", { bg = "NONE", fg = theme.git.diff_remove })
  hl.set("DiffDelete", hl.get("DiffRemove"))
  hl.set("DiffChange", { bg = "NONE", fg = theme.git.diff_change })

  hl.set("NeoTreeNormal", { fg = theme.foreground.base, bg = theme.background.tree })
  hl.set("NeoTreeNormalNC", hl.get("NeoTreeNormal"))
  hl.set("NeoTreeWinSeparator", { bg = theme.background.tree, fg = theme.background.tree })
  hl.set("NeoTreeVertSplit", hl.get("NeoTreeWinSeparator"))
  hl.set("NeoTreeDirectoryIcon", { fg = theme.colours.primary })
  hl.set("NeoTreeDirectoryName", hl.get("NeoTreeDirectoryIcon"))
  hl.set("BufferLineOffsetSeparator", hl.get("NeoTreeWinSeparator"))

  hl.set("IndentBlanklineChar", { fg = theme.colours.grey })
  hl.set("IndentBlanklineContextChar", { fg = theme.colours.light_grey })

  hl.set("BarbecueBasename", { fg = theme.colours.light_grey })
  hl.set("BarbecueContext", { fg = theme.colours.light_grey })
  hl.set("BarbecueDirname", { fg = theme.colours.light_grey })
  hl.set("BarbecueSeparator", { fg = theme.colours.grey })

  hl.set("TelescopeNormal", { bg = theme.telescope.background })
  hl.set("TelescopeTitle", { fg = "#111111", bg = theme.colours.blue })
  hl.set("TelescopeBorder", { fg = theme.telescope.background, bg = theme.telescope.background })
  hl.set("TelescopeSelection", { bg = theme.telescope.selection })
  hl.set("TelescopeSelectionCaret", { fg = theme.colours.primary, bg = theme.telescope.selection })
  hl.set("TelescopeResultsNormal", { bg = theme.telescope.results_background })
  hl.set("TelescopeResultsTitle", { fg = "#111111", bg = theme.colours.green })
  hl.set("TelescopePreviewNormal", { bg = theme.telescope.preview_background })
  hl.set("TelescopePreviewTitle", { fg = "#111111", bg = theme.colours.red })
  hl.set("TelescopePreviewBorder", { fg = theme.telescope.preview_background, bg = theme.telescope.preview_background })

  local syntax_overrides = {}
  for k, v in pairs(theme.syntax) do
    local highlight = { fg = v }
    if syntax_overrides[k] then highlight = vim.tbl_extend("keep", syntax_overrides[k], highlight) end
    hl.set(k, highlight)
  end

  local treesitter_overrides = {}
  for k, v in pairs(theme.treesitter) do
    local highlight = type(v) == "table" and v or { fg = v }
    if syntax_overrides[k] then highlight = vim.tbl_extend("keep", syntax_overrides[k], highlight) end
    hl.set(k, highlight)
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
