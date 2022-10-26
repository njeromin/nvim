import("user.options", function (opts)
  vim.g.mapleader = opts.keymapping.leader
end)
