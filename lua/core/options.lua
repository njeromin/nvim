local options = _G.config.options or {}

-- set indent width
local indent_width = options.indent_width or 2
vim.opt.shiftwidth = indent_width
vim.opt.tabstop = indent_width
vim.opt.softtabstop = indent_width

-- set map leader
vim.g.mapleader = _G.config.options.mapleader

SafeRequire("user.vimopts", function (vimopts)
  -- set vim opts for all entries in returned table
	for k, v in pairs(vimopts) do
		vim.opt[k] = v
	end
end)
