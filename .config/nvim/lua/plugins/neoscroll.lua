-- ~/.config/nvim/lua/plugins/neoscroll.lua
return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy", -- lazy-load after startup
  config = function()
    local neoscroll = require("neoscroll")
    -- 1) Global setup
    neoscroll.setup({
      -- Default options (see :help neoscroll-options)
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = true,
      cursor_scrolls_alone = true, -- old 'move_cursor'
      duration_multiplier = 1.0,
      easing = "cubic", -- default easing when not overridden
    }) -- :contentReference[oaicite:2]{index=2}

    -- 2) Helper for scroll function
    local scroll = neoscroll.scroll -- signature: scroll(lines, opts) :contentReference[oaicite:3]{index=3}

    -- 3) Map mouse wheel to smooth scroll
    local opts = { noremap = true, silent = true }
    -- Scroll down by 3 lines over 120ms with cubic easing
    vim.keymap.set("n", "<ScrollWheelDown>", function()
      scroll(3, { duration = 120, easing = "cubic", cursor_scrolls_alone = true })
    end, opts)
    -- Scroll up by 3 lines over 120ms with cubic easing
    vim.keymap.set("n", "<ScrollWheelUp>", function()
      scroll(-3, { duration = 120, easing = "cubic", cursor_scrolls_alone = true })
    end, opts)

    -- 4) (Optional) Map keyboard scrolling too
    -- Example: smooth <C-u> and <C-d>
    vim.keymap.set("n", "<C-u>", function()
      neoscroll.ctrl_u({ duration = 200, easing = "sine" })
    end, opts)
    vim.keymap.set("n", "<C-d>", function()
      neoscroll.ctrl_d({ duration = 200, easing = "sine" })
    end, opts)
  end,
}
