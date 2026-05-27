local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    FlashLabel = {
      bg = colorscheme.syntaxError,
      fg = colorscheme.editorBackground,
      bold = true,
    },
    FlashMatch = {
      bg = colorscheme.menuOptionBackground,
      fg = colorscheme.mainText,
    },
    FlashCurrent = {
      bg = colorscheme.syntaxFunction,
      fg = colorscheme.editorBackground,
    },
    FlashBackdrop = { fg = colorscheme.inactiveText },
  }
end

return M
