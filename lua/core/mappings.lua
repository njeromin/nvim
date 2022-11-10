import("user.options", function (opts)
  vim.g.mapleader = opts.keymapping.leader

  local wk = require("which-key")
  wk.setup()

  wk.register({
    f = {
      name = "  Find",

      f = { "<cmd>Telescope find_files<cr>", "  Find file" },
      r = { "<cmd>Telescope oldfiles<cr>", " Recent files" },
      g = { "<cmd>Telescope live_grep<cr>", "  Grep" },
      n = { "<cmd>Telescope notify<cr>", "  Notifications" },
    },

    p = {
      name = "  Packer",

      s = { function() require("packer").sync() end, "Sync" },
      i = { function() require("packer").status() end, "Status" },
    },

    i = { "<cmd>IconPickerNormal<cr>", "  Pick icon" },
    m = { "<cmd>Mason<cr>", "  Open mason" },
    t = { "<cmd>TroubleToggle<cr>", "  Toggle trouble" },
    e = { "<cmd>Neotree reveal<cr>",  "פּ  Focus tree" },
    c = { ":e $MYVIMRC | :cd %:p:h<cr>", "  Edit config" },
  }, { prefix = "<leader>" })
end)
