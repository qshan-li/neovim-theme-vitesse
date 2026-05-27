local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    TelescopeNormal = {
      fg = colorscheme.mainText,
      bg = colorscheme.floatingWindowBackground,
    },
    TelescopeSelection = {
      fg = colorscheme.mainText,
      bg = colorscheme.menuOptionBackground,
    },
    TelescopeSelectionCaret = {
      fg = colorscheme.syntaxFunction,
      bg = colorscheme.menuOptionBackground,
    },
    TelescopeMultiSelection = {
      fg = colorscheme.syntaxKeyword,
      bg = colorscheme.menuOptionBackground,
    },
    TelescopeMatching = { fg = colorscheme.successText, bold = true },
    TelescopeBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.floatingWindowBackground,
    },
    TelescopePromptBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.floatingWindowBackground,
    },
    TelescopeResultsBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.floatingWindowBackground,
    },
    TelescopePreviewBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.floatingWindowBackground,
    },
    TelescopeTitle = { fg = colorscheme.syntaxFunction, bold = true },
    TelescopePromptTitle = { fg = colorscheme.syntaxFunction, bold = true },
    TelescopeResultsTitle = { fg = colorscheme.syntaxKeyword, bold = true },
    TelescopePreviewTitle = { fg = colorscheme.linkText, bold = true },
    TelescopePromptPrefix = { fg = colorscheme.syntaxFunction },
    TelescopePromptNormal = {
      fg = colorscheme.mainText,
      bg = colorscheme.floatingWindowBackground,
    },
  }
end

return M
