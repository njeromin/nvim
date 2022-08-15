-- bootstrapper
local packer_bootstrap = nil
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- autocmd to autocompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins/init.lua source <afile> | PackerCompile
  augroup end
]])

local ok, packer = pcall(require, "packer")
if not ok then return end

packer.startup({
  function (use, use_rocks)
    local p_ok, plugins = pcall(require, "plugins")

    plugins.rocks = plugins.rocks or {}
    plugins.nvim = plugins.nvim or {}

    if p_ok then
      for key, value in pairs(plugins.rocks) do
        table.insert(value, 1, key)
        use_rocks(value)
      end

      for key, value in pairs(plugins.nvim) do
        table.insert(value, 1, key)
        use(value)
      end
    end

    -- bootstrap if needed
    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = function ()
        return require("packer.util").float({ border = "single" })
      end
    }
  },
})
