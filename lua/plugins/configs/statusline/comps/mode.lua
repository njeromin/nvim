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
  COMMAND = colours.cyan,
  SHELL = colours.green,
  TERM = colours.blue,
  UNKNOWN = colours.red,
  NONE = colours.yellow,
}

local vi_mode_text = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  [''] = "BLOCK",
  V = "VISUAL",
  c = "COMMAND",
  no = "UNKNOWN",
  s = "UNKNOWN",
  S = "UNKNOWN",
  ic = "UNKNOWN",
  R = "REPLACE",
  Rv = "UNKNOWN",
  cv = "UNKNOWN",
  ce = "UNKNOWN",
  r = "REPLACE",
  rm = "UNKNOWN",
  t = "INSERT",
}

return function (win, buf)
  local mode = vim.fn.mode()
  local txt = vi_mode_text[mode] or "NORMAL"
  local hl = string.format("SL_mode_%s", txt)
  group(hl, {
    bg = vi_mode_colours[txt],
    fg = "#111111",
    bold = true,
  })
  return "%#"..hl.."# "..txt.." %#StatusLine#"
end
