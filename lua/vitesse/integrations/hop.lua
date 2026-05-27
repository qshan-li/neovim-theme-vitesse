local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    HopNextKey = { fg = colorscheme.syntaxError, bold = true },
    HopNextKey1 = { fg = colorscheme.syntaxFunction, bold = true },
    HopNextKey2 = { fg = colorscheme.syntaxKeyword },
    HopUnmatched = { fg = colorscheme.inactiveText },
    LeapMatch = { fg = colorscheme.syntaxFunction, bold = true },
    LeapLabelPrimary = { fg = colorscheme.syntaxError, bold = true },
    LeapLabelSecondary = { fg = colorscheme.syntaxKeyword, bold = true },
    LeapBackdrop = { fg = colorscheme.inactiveText },
  }
end

return M
