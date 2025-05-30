return {
  {
    "IndianBoy42/tree-sitter-just",
    ft = "just",
    config = function()
      -- Register the parser with nvim-treesitter
      require("tree-sitter-just").setup({})
    end,
  },
}
