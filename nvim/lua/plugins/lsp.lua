return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
  },

  settings = {
    ["rust-analyzer"] = {
      procMacro = { enabled = true },
    },
  },
}
