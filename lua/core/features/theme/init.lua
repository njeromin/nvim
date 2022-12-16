local function default_highlights(t, hl)
  local theme = t.theme

  hl.set("Normal", { bg = theme.background.base, fg = theme.foreground.base })
  hl.set("NormalNC", hl.get("Normal"))

  hl.set("String", { fg = theme.syntax.string })
  hl.set("Identifier", { fg = theme.syntax.identifier })
  hl.set("Statement", { fg = theme.syntax.statement })
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
