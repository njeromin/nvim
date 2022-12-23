local mode_names = {
  n = "NOR",
  no = "OPE",
  nov = "OPE",
  noV = "OPE",
  ["noCTRL-V"] = "OPE",
  niI = "NOR",
  niR = "NOR",
  niV = "NOR",
  nt = "NOR",
  ntT = "NOR",
  v = "VIS",
  vs = "VIS",
  V = "VIS",
  Vs = "VIS",
  ["CTRL-V"] = "VIS",
  ["CTRL-Vs"] = "VIS",
  s = "SEL",
  S = "SEL",
  ["CTRL-S"] = "SEL",
  i = "INS",
  ic = "INS",
  ix = "INS",
  R = "REP",
  Rc = "REP",
  Rx = "REP",
  Rv = "REP",
  Rvc = "REP",
  Rvx = "REP",
  c = "CMD",
  cv = "CMD",
  t = "TER",
}

local mode_colours = {
  NOR = core.theme.colours.green,
  OPP = core.theme.colours.light_green,
  VIS = core.theme.colours.purple,
  SEL = core.theme.colours.pink,
  INS = core.theme.colours.blue,
  REP = core.theme.colours.light_pink,
  CMD = core.theme.colours.orange,
  TER = core.theme.colours.yellow,
}

return function (win, buf)
  local mode_text = mode_names[vim.fn.mode()] or "NOR"
  local ok, hl = pcall(require, "core.features.theme.hl_utils")
  if ok then
    hl.set("el_mode", {
      fg = "#111111",
      bg = mode_colours[mode_text],
      bold = true,
    })
  end
  return string.format("%s %s %s", "%#el_mode#", mode_text, "%#StatusLine#")
end
