-- return {
--   "folke/trouble.nvim",
--   opts = function(_, opts)
--     -- Merge only `win` settings into whatever `opts.win` already has:
--     opts.win = vim.tbl_deep_extend("force", opts.win or {}, { type = "split", position = "right" })
--   end,
-- }

return {
  "folke/trouble.nvim",
  opts = function(_, opts)
    -- Deep-merge only our `win` overrides into LazyVim’s default opts:
    opts.win = vim.tbl_deep_extend("force", opts.win or {}, {
      type = "split", -- vertical split
      position = "right", -- on the right side
      size = 50, -- either 0.3 for 30% or an integer like 50 columns
    })
  end,
}
