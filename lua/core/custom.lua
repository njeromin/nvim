local M = {}

--[[
Structure
=========

.nvim/init.lua => loads at bottom of base init.lua

.nvim/lsp_settings/{server_name} => adds returned table to the lsp handler for that server name
--]]

M.path = string.format("%s/.nvim", vim.fn.getcwd())

M.load_init = function ()
  local ok, _ = pcall(dofile, string.format("%s/init.lua", M.path))
  if ok then
    local nvim_path = vim.fn.stdpath("config")
    os.execute(string.format("cp \"%s/.stylua.toml\" \"%s/.stylua.toml\"", nvim_path, M.path))
    os.execute(string.format("cp \"%s/neovim.yml\" \"%s/neovim.yml\"", nvim_path, M.path))
    os.execute(string.format("cp \"%s/selene.toml\" \"%s/selene.toml\"", nvim_path, M.path))
  end
end

M.load_lsp_settings = function (server_name)
  return dofile(string.format("%s/lsp_settings/%s", M.path, server_name))
end

return M
