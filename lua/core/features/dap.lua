local function module()
  local mason_dap = require("mason-nvim-dap")
  mason_dap.setup()
  mason_dap.setup_handlers({
    function (sname)
      local ok, handler = pcall(require, string.format("dap_settings.%s", sname))
      local auto_setup = require("mason-nvim-dap.automatic_setup")
      if ok then
        pcall(handler, auto_setup)
      else
        auto_setup(sname)
      end
    end
  })
end

return {
  loads_self = true,
  packer = {
    {
      "jay-babu/mason-nvim-dap.nvim",
    },
    {
      "mfussenegger/nvim-dap",
      config = module,
    }
  },
}
