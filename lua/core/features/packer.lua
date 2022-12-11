local function config()
  return {
    display = {
      open_fn = function ()
        return require("packer.util").float({ border = "single" })
      end,
    },
  }
end

local function setup(packer, requires_sync)
  packer.startup({
    function (use, use_rocks)
      -- allow packer to manage itself
      use("wbthomason/packer.nvim")

      for i, v in ipairs(core.plugins) do
        if type(v) == "string" then
          use(v)
          return
        end

        if type(v) == "table" then
          if not v.use_rocks then
            use(v)
          else
            use_rocks(v)
          end
        end
      end
      if requires_sync then packer.sync() end
    end,
    config = config(),
  })
end

local function bootstrap()
  local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd("packadd packer.nvim")
    local ok, packer = pcall(require, "packer")
    if not ok then
      print(string.format("Failed to load packer, %s", packer))
      return
    end
    setup(packer, true)
  end
end

local function module()
  local ok, packer = pcall(require, "packer")
  if not ok then packer = bootstrap() else setup(packer) end
end

return {
  module = module,
}
