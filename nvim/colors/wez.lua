--- Ghostty Wez theme for Neovim (LazyVim compatible)
--- Place this file in ~/.config/nvim/colors/wez.lua

--- Helper: darken a hex color by fraction
local function darken(hex, amount)
  hex = hex:gsub("^#", "")
  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)
  local function clamp(x)
    return math.max(0, math.min(255, x))
  end
  r = clamp(math.floor(r * (1 - amount) + 0.5))
  g = clamp(math.floor(g * (1 - amount) + 0.5))
  b = clamp(math.floor(b * (1 - amount) + 0.5))
  return string.format("#%02x%02x%02x", r, g, b)
end

-- Palette from Ghostty Wez theme
local palette = {
  "#000000",
  "#cc5555",
  "#55cc55",
  "#cdcd55",
  "#5555cc",
  "#cc55cc",
  "#7acaca",
  "#cccccc",
  "#555555",
  "#ff5555",
  "#55ff55",
  "#ffff55",
  "#5555ff",
  "#ff55ff",
  "#55ffff",
  "#ffffff",
}
local bg = "#000000"
local fg = "#b3b3b3"
local cursor = "#53ae71"
local cursortxt = "#000000"
local sel_bg = "#4d52f8"
local sel_fg = "#000000"

-- Apply the theme
vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "wez"

-- Terminal ANSI colors
vim.g.terminal_ansi_colors = palette

local set = vim.api.nvim_set_hl

-- Core highlights
set(0, "Normal", { fg = fg, bg = bg })
set(0, "NormalNC", { fg = fg, bg = bg })
set(0, "SignColumn", { bg = bg })
set(0, "NonText", { fg = palette[9], bg = bg })
set(0, "EndOfBuffer", { fg = bg })
set(0, "Cursor", { fg = cursor, bg = cursortxt })
set(0, "CursorLine", { bg = darken(bg, 0.07) })
set(0, "CursorColumn", { bg = darken(bg, 0.07) })
set(0, "Visual", { fg = sel_fg, bg = sel_bg })
set(0, "ColorColumn", { bg = darken(bg, 0.10) })

-- Line numbers
set(0, "LineNr", { fg = palette[9], bg = bg }) -- bright red
set(0, "CursorLineNr", { fg = palette[10], bg = darken(bg, 0.07), bold = true })

-- Window separators + statusline
set(0, "VertSplit", { fg = darken(bg, 0.2), bg = bg })
set(0, "StatusLine", { fg = fg, bg = darken(bg, 0.1) })
set(0, "StatusLineNC", { fg = palette[8], bg = bg })

-- Float windows
set(0, "NormalFloat", { fg = fg, bg = bg })
set(0, "FloatBorder", { fg = fg, bg = bg })

-- Popup menu
set(0, "Pmenu", { fg = fg, bg = palette[9] })
set(0, "PmenuSel", { fg = sel_fg, bg = sel_bg })
set(0, "PmenuSbar", { bg = palette[9] })
set(0, "PmenuThumb", { bg = palette[10] })

-- Search
set(0, "Search", { fg = sel_fg, bg = palette[4] })
set(0, "IncSearch", { fg = bg, bg = palette[12] })

-- Comments & matching
set(0, "Comment", { fg = palette[8], italic = true })
set(0, "MatchParen", { fg = palette[13], bg = palette[1], bold = true })

-- Diagnostics
set(0, "DiagnosticError", { fg = palette[2] })
set(0, "DiagnosticWarn", { fg = palette[4] })
set(0, "DiagnosticInfo", { fg = palette[5] })
set(0, "DiagnosticHint", { fg = palette[7] })

-- Treesitter basics
set(0, "@keyword", { fg = palette[6], bold = true })
set(0, "@string", { fg = palette[3] })
set(0, "@function", { fg = palette[5] })
set(0, "@type", { fg = palette[13], italic = true })
set(0, "@constant", { fg = palette[14] })

-- End of colorscheme file
