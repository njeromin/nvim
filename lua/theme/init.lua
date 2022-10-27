local Color, colors, Group, groups, styles = require("colorbuddy").setup()
local Colour, colours = Color, colors

local theme_name = require("user.options").theme

import("theme.themes."..theme_name, function (t)
  if type(t) == "function" then
    Colour.new("background", "#252931")
    Colour.new("foreground", "#cccccc")

    Colour.new("grey", "#abb2bf")
    Colour.new("red", "#e06c75")
    Colour.new("purple", "#c678dd")
    Colour.new("green", "#98c379")
    Colour.new("brown", "#be5046")
    Colour.new("orange", "#d19a66")
    Colour.new("yellow", "#e5c07b")
    Colour.new("blue", "#61afef")
    Colour.new("cyan", "#56b6c2")
    Colour.new("primary", "#528bff")

    colours.TS_Comment = colours.grey
    colours.TS_Function = colours.blue
    colours.TS_FunctionBuiltin = colours.cyan
    colours.TS_Keyword = colours.purple
    colours.TS_String = colours.green
    colours.TS_Number = colours.orange
    colours.TS_Boolean = colours.yellow
    colours.TS_Punctuation = colours.brown
    colours.TS_Parameter = colours.red
    colours.TS_Field = colours.primary

    -- vim
    Group.new("Normal", colours.foreground, colours.background)
    Group.new("NormalNC", groups.Normal, groups.Normal)

    -- lsp
    Group.new("Error", colours.red)

    -- treesitter
    Group.new("@comment", colours.TS_Comment)
    Group.new("@function", colours.TS_Function)
    Group.new("@function.builtin", colours.TS_FunctionBuiltin)
    Group.new("@keyword", colours.TS_Keyword)
    Group.new("@conditional", colours.TS_Keyword)
    Group.new("@structure", colours.TS_Keyword)
    Group.new("@constant", colours.TS_Keyword)
    Group.new("@string", colours.TS_String)
    Group.new("@number", colours.TS_Number)
    Group.new("@float", colours.TS_Number)
    Group.new("@boolean", colours.TS_Boolean)
    Group.new("@punctuation", colours.TS_Punctuation)
    Group.new("@parameter", colours.TS_Parameter)
    Group.new("@field", colours.TS_Field)

    -- tree
    Group.new("NeoTreeNormal", colours.foreground, colours.background)
    Group.new("NeoTreeNormalNC", groups.NeoTreeNormal, groups.NeoTreeNormal)
  end
end)
