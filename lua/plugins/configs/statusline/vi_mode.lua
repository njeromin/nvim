local colours_ok, colours = pcall(require, "theme.colours")
if not colours_ok then return end
local vi_mode_utils = require("feline.providers.vi_mode")

local vi_mode_colours = {
    NORMAL = colours.green,
    INSERT = colours.blue,
    VISUAL = colours.magenta,
    OP = colours.green,
    BLOCK = colours.blue,
    REPLACE = colours.red,
    ['V-REPLACE'] = colours.red,
    ENTER = colours.cyan,
    MORE = colours.cyan,
    SELECT = colours.orange,
    COMMAND = require("utils.colours").lighten(colours.magenta, 5),
    SHELL = colours.green,
    TERM = colours.blue,
    NONE = colours.yellow,
}

local vi_mode_text = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  [''] = "V-BLOCK",
  V = "V-LINE",
  c = "COMMAND",
  no = "UNKNOWN",
  s = "UNKNOWN",
  S = "UNKNOWN",
  ic = "UNKNOWN",
  R = "REPLACE",
  Rv = "UNKNOWN",
  cv = "UNKWON",
  ce = "UNKNOWN",
  r = "REPLACE",
  rm = "UNKNOWN",
  t = "INSERT",
}

local component = {
  provider = function ()
    return " "..vi_mode_text[vim.fn.mode() or "n"].." "
  end,
  hl = function ()
    return {
      name = vi_mode_utils.get_mode_highlight_name(),
      fg = colours.bg.base,
      bg = vi_mode_utils.get_mode_color(),
      style = "bold",
    }
  end,
  right_sep ="slant_right_2",
}

return {
    component = component,
    colours = vi_mode_colours,
}
