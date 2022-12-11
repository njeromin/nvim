local function module(opts_in)
  vim.g.mapleader = core.options.editor.mapping.leader

  local opts = vim.tbl_extend("keep", opts_in or {}, {
    path = "user.options.mappings"
  })

  pcall(require, opts.path)
end

return {
  module = module,
}
