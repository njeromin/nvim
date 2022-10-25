local ok, packer = pcall(require, "packer")
if not ok then
  local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  ---@diagnostic disable-next-line: missing-parameter
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd("packadd packer.nvim")
    require("core.packer")
  end
  return
end

packer.startup({
  function (use, use_rocks)
    -- allow packer to manage itself
    use("wbthomason/packer.nvim")
    -- caching
    use("lewis6991/impatient.nvim")
    -- safe require
    use("miversen33/import.nvim")
  
    -- plugins entrypoint
    import("plugins", function (fn)
      if type(fn) == "function" then
        fn(use, use_rocks)
      end
    end)
  end,
  config = {
    display = {
      open_fn = function ()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
