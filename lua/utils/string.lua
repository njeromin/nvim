local M = {}

M.starts = function (str,start)
   return string.sub(str, 1, string.len(start)) == start
end

return M
