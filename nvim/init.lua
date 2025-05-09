-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_user_command("ReloadConfig", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^user") or name:match("^plugins") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
end, {})
