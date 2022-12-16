local M = {}

local colours = {
  red = "#ffadad",
  orange = "#ffd6a5",
  yellow = "#fdffb6",
  green = "#caffbf",
  light_blue = "#9bf6ff",
  blue = "#a0c4ff",
  purple = "#bdb2ff",
  pink = "#ffc6ff",
}

M.theme = {
  colours = colours,

  background = {
    base = "#23272a",
  },
  foreground = {
    base = "#ffffff",
  },
  syntax = {
    string = colours.green,
    identifier = colours.blue,
    statement = colours.purple,
  },
}

M.custom_highlights = function (hl)

end

return M
