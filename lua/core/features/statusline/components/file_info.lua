local subscribe = require("el.subscribe")
local builtin = require("el.builtin")
local extensions = require("el.extensions")

return function (s)
  table.insert(s, " ")
  table.insert(s,
    subscribe.buf_autocmd(
      "el_file_icon",
      "BufRead",
      function (_, buf)
        return extensions.file_icon(_, buf)
      end
    )
  )
  table.insert(s, " ")
  table.insert(s, builtin.tail_file)
  table.insert(s, builtin.modified)
  table.insert(s, " ")
  table.insert(s, "%#StatusLine#")

  return s
end
