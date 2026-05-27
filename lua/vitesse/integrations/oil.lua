local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    OilDir = { fg = colorscheme.syntaxFunction, bold = true },
    OilFile = { fg = colorscheme.mainText },
    OilCreate = { fg = colorscheme.successText },
    OilDelete = { fg = colorscheme.syntaxError },
    OilMove = { fg = colorscheme.warningText },
    OilCopy = { fg = colorscheme.syntaxKeyword },
    OilChange = { fg = colorscheme.warningEmphasis },
    OilRestore = { fg = colorscheme.linkText },
    OilPurge = { fg = colorscheme.errorText },
  }
end

return M
