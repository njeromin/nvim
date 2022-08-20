local ok, feline = pcall(require, "feline")
if not ok then return end
local colours_ok, colours = pcall(require, "theme.colours")
if not colours_ok then return end
local lighten = require("utils.colours").lighten
local darken = require("utils.colours").darken

local buf_not_empty = function ()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
  return true
  end
  return false
end

local components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

-- left section
local vi_mode = require("plugins.configs.feline.vi_mode")
table.insert(components.active[1], vi_mode.component)

-- middle section
table.insert(components.active[2], {
  provider = "lsp_client_names",
})

-- right section
table.insert(components.active[3], {
  provider = "position",
  hl = {
    name = "StatusLinePosition",
    bg = lighten(colours.bg, 8),
    fg = lighten(colours.fg, 8),
  },
  left_sep = { "slant_left_2", "block" },
  right_sep = "block",
})

-- setup feline
local theme = {
  fg = colours.fg,
  bg = darken(colours.bg, 5),
  black = colours.black,
  skyblue = lighten(colours.blue, 5),
  cyan = colours.cyan,
  oceanblue = colours.blue,
  magenta = colours.magenta,
  orange = colours.orange,
  red = colours.red,
  violet = lighten(colours.magenta, 5),
  white = "#ffffff",
  yellow = colours.yellow,
}

feline.setup({
  theme = theme,
  force_inactive = {},
  bufypes = {},
  bufnames = {},
  components = components,
  vi_mode_colors = vi_mode.colours,
})
