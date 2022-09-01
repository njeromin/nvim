local ok, feline = pcall(require, "feline")
if not ok then return end
local colours_ok, colours = pcall(require, "theme.colours")
if not colours_ok then return end
local lighten = require("utils.colours").lighten
local darken = require("utils.colours").darken

local components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

-- left section
local vi_mode = require("plugins.configs.feline.vi_mode")
table.insert(components.active[1], vi_mode.component)

table.insert(components.active[1], {
  provider = "file_info",
  enabled = function () return vim.bo.buftype ~= "nofile" end,
  left_sep = " ",
})

table.insert(components.active[1], {
  provider = "file_size",
  enabled = function () return vim.bo.buftype ~= "nofile" end,
  hl = {
    fg = colours.orange,
  },
  left_sep = " ",
})

local git_utils = require("feline.providers.git")
table.insert(components.active[1], {
  provider = "git_branch",
  enabled = function () return git_utils.git_info_exists() end,
  truncate_hide = true,
  hl = {
    bg = lighten(colours.bg, 8),
    fg = lighten(colours.fg, 8),
  },
  left_sep = { " ", "slant_left", "block" },
  right_sep = { "block", "slant_right" },
})

-- right section
local lsp_utils = require("feline.providers.lsp")
table.insert(components.active[3], {
  provider = "diagnostic_errors",
  enabled = function () return lsp_utils.diagnostics_exist("error") end,
  hl = {
    fg = colours.red,
  },
})
table.insert(components.active[3], {
  provider = "diagnostic_warnings",
  enabled = function () return lsp_utils.diagnostics_exist("warn") end,
  hl = {
    fg = colours.yellow,
  },
})
table.insert(components.active[3], {
  provider = "diagnostic_hints",
  enabled = function () return lsp_utils.diagnostics_exist("hint") end,
  hl = {
    fg = colours.cyan,
  },
})

table.insert(components.active[3], {
  provider = "diagnostic_info",
  enabled = function () return lsp_utils.diagnostics_exist("info") end,
  hl = {
    fg = colours.blue,
  },
})
table.insert(components.active[3], {
  provider = "lsp_client_names",
  left_sep = " ",
  right_sep = " ",
})

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
