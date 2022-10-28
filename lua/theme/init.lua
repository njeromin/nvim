local utils = require("theme.utils")
local groups = utils.groups
local group = utils.group

local theme_name = require("user.options").theme

import("theme.themes."..theme_name, function (t)
  if type(t) == "function" then
    local colours = t(group, groups)
    
    -- vim
    group("Normal", { fg = colours.fg, bg = colours.bg })
    group("NormalNC", { fg = groups.Normal.fg, bg = groups.Normal.bg })
  end
end)
