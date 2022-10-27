local Color, colors, Group, groups, styles = require("colorbuddy").setup()
local Colour, colours = Color, colors

local theme_name = require("user.options").theme

import("theme.themes."..theme_name, function (t)
  if type(t) == "function" then
    t(Colour, colours, Group, groups)

    -- vim
    Group.new("Normal", colours.t_fg, colours.t_bg)
    Group.new("NormalNC", groups.Normal, groups.Normal)
    Group.new("CursorLine", nil, colours.t_bg:light())
    Group.new("Pmenu", colours.t_fg_dark, colours.t_bg_dark)
    Group.new("PmenuSel", colours.t_fg, colours.t_bg)
    Group.new("SignColumn", groups.Normal, groups.Normal)
    Group.new("LineNr", colours.grey, groups.Normal)
    Group.new("CursorLineNr", colours.t_fg, groups.Normal)

    -- git
    Group.new("DiffAdd", colours.green, groups.Normal)
    Group.new("DiffChange", colours.orange, groups.Normal)
    Group.new("DiffDelete", colours.red, groups.Normal)

    -- lsp
    Group.new("DiagnosticError", colours.red)
    Group.new("DiagnosticHint", colours.cyan)
    Group.new("DiagnosticInfo", colours.blue)
    Group.new("DiagnosticWarn", colours.yellow)

    -- tree
    Group.new("NeoTreeNormal", colours.t_fg, colours.t_bg_dark)
    Group.new("NeoTreeNormalNC", groups.NeoTreeNormal, groups.NeoTreeNormal)
    Group.new("NeoTreeWinSeparator", colours.t_bg_dark, groups.NeoTreeNormal)
    Group.new("NeoTreeDirectoryIcon", colours.primary)
    Group.new("NeoTreeDirectoryName", colours.primary)

    -- bufferline
    Group.new("BufferLineOffsetSeparator", groups.NeoTreeNormal, groups.NeoTreeNormal)

    -- indent blankline
    Group.new("IndentBlanklineChar", colours.grey:dark())
    Group.new("IndentBlanklineSpaceChar", groups.IndentBlanklineChar)
    Group.new("IndentBlanklineSpaceCharBlankline", groups.IndentBlanklineChar)
    Group.new("IndentBlanklineContextChar", colours.grey:light())
    Group.new("IndentBlanklineContextStart", nil, nil)
  end
end)
