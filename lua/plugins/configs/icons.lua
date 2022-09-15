local ok, icons = pcall(require, "nvim-web-devicons")
if not ok then return end

icons.set_icon({
  astro = {
    icon = "",
    color = "#ffffff",
    cterm_color = "15",
    name = "Astro",
  },
})
