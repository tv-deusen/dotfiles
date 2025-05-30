return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- load immediately
    priority = 1000, -- load before other colorschemes
    opts = {
      style = "night", -- or "storm", "day", "moon"
      transparent = false,
      -- any other tokyonight options here
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
