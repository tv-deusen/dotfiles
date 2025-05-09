return {
  -- Register local colorscheme directory
  {
    dir = vim.fn.stdpath("config") .. "/lua/user/colors",
    name = "wez",
    lazy = false,
    priority = 1000,
  },
  -- Configure LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "wez",
    },
  },
}
