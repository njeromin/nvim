-- bootstrapper
local packer_bootstrap = nil
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- autocmd to autocompile
vim.api.nvim_create_augroup("packer_user_config", { clear = false })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "packer_user_config",
  pattern = string.format("%s/lua/plugins/*", vim.fn.stdpath("config")),
  callback = function ()
    pcall(require, string.format("%s/lua/core/packer.lua", vim.fn.stdpath("config")))
    SafeRequire("packer", function (packer) packer.compile() end)
  end
})

local ok, packer = pcall(require, "packer")
if not ok then return end

packer.startup({
  function (use, use_rocks)
		-- allow packer to manage itself
		use("wbthomason/packer.nvim")

		local plugins = require("plugins")

    for key, value in pairs(plugins.rocks) do
      table.insert(value, 1, key)
      use_rocks(value)
    end

    for key, value in pairs(plugins.nvim) do
      table.insert(value, 1, key)
      use(value)
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
