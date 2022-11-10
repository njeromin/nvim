return function ()
  local colours = {
    bg = "#24292e",
    bg_dark = "#1f2428",
    fg = "#c9d1d9",
    fg_dark = "#c9d1d9",

    grey = "#6a737d",
    red = "#ea4a5a",
    blue = "#2188ff",
    cyan = "#39c5cf",
    purple = "#b392f0",
    green = "#34d058",
    brown = "#694209",
    orange = "#d18616",
    yellow = "#ffea7f",
    primary = "#2188ff",
  }

  -- https://github.com/projekt0n/github-nvim-theme/blob/main/lua/github-theme/theme.lua

  -- default syntax
  group("Comment", { fg = colours.grey })
  group("Constant", { })

  return colours
end
