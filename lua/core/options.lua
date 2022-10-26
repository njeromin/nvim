import("user.options", function (opts)
  -- vim opts
  for k, v in pairs(opts.vim) do vim.opt[k] = v end
end)
