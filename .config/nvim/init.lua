-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Disable spell checking globally
vim.opt.spell = false

-- Create an autocommand to disable spell checking for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "txt", "md", "log", "norg" }, -- Add other file types as needed
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.spelllang = "en_us"
  end,
})

vim.api.nvim_create_user_command("ReloadConfig", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^user") or name:match("^plugins") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
end, {})
