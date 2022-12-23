local builtin = require("el.builtin")

return function (win, buf)
  return string.format("%s %s:%s %s", "%#el_mode#", builtin.column_number, builtin.line_number, "%#StatusLine#")
end
