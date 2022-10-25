import("user.vimopts", function (vo)
  for k, v in pairs (vo) do vim.opt[k] = v end
end)
