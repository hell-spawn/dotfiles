-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.filetype.add({
  filename = {
    ["docker-compose.yml"] = "yaml.docker-compose",
  },
})
