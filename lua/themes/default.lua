local M = {}

local colours = {
  primary = "#4895ef",
  red = "#ff6961",
  orange = "#ffb347",
  yellow = "#fdfd96",
  light_green = "#d9ed92",
  green = "#90be6d",
  teal = "#34a0a4",
  blue = "#4895ef",
  purple = "#9c89b8",
  pink = "#f0a6ca",
  grey = "#5b6571",
  light_grey = "#7c8c9c",
}

M.theme = {
  colours = colours,

  background = {
    base = "#21252b",
    tree = "#1b1e23",
    pmenu = "#16191d",
  },
  foreground = {
    base = "#e9ecef",
    secondary = "#ced4da",
  },
  syntax = {
    String = colours.green,
    Character = colours.orange,
    Number = colours.orange,
    Float = colours.orange,
    Boolean = colours.orange,
    Type = colours.yellow,
    Identifier = colours.red,
    Constant = colours.teal,
    Function = colours.blue,
    Statement = colours.purple,
    PreProc = colours.purple,
    PreCondit = colours.purple,
    Include = colours.purple,
    Keyword = colours.purple,
    Define = colours.purple,
    Typedef = colours.purple,
    Exception = colours.purple,
    Conditional = colours.purple,
    Repeat = colours.purple,
    Macro = colours.red,
    Error = colours.purple,
    Label = colours.purple,
    Special = colours.red,
    SpecialChar = colours.red,
    Operator = colours.purple,
    Title = colours.teal,
    Tag = colours.green,
    Comment = colours.grey,
    Delimiter = colours.light_grey,
    SpecialComment = colours.grey,
    Todo = colours.red,
  },
  git = {
    diff_add = colours.green,
    diff_remove = colours.red,
    diff_change = colours.orange,
  },
  cursor_line = "#262a31",
  visual = "#2a2f37",
  sign_column = colours.grey,
  line_number = colours.light_grey,
}

M.custom_highlights = function (hl)

end

return M
