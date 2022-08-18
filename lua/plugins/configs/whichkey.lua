local wk = require("which-key")

wk.register({
  ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle Bufferline" },
})

wk.register({
  f = {
    name = "  Find",

    f = { "<cmd>Telescope find_files<cr>", "  Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "  Grep" },
    n = { "<cmd>Telescope notify<cr>", "  Notifications" } 
  },

  p = {
    name = "  Packer",

    s = { function() require("packer").sync() end, "Sync" },
    i = { function() require("packer").status() end, "Status" },
  },

  m = { "<cmd>Mason<cr>", "  Open Mason" },
  e = { function () require("nvim-tree").focus() end, "פּ  Focus Tree" },
}, { prefix = "<leader>" })
