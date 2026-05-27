local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    WhichKey = { fg = colorscheme.syntaxFunction },
    WhichKeyDesc = { fg = colorscheme.mainText },
    WhichKeyGroup = { fg = colorscheme.syntaxKeyword },
    WhichKeySeparator = { fg = colorscheme.commentText },
    WhichKeyFloat = { bg = colorscheme.floatingWindowBackground },
    WhichKeyBorder = { fg = colorscheme.windowBorder },
    WhichKeyTitle = { fg = colorscheme.syntaxFunction, bold = true },
    WhichKeyValue = { fg = colorscheme.commentText },
  }
end

return M
