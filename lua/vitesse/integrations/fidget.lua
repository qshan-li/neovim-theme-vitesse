local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    FidgetTitle = { fg = colorscheme.syntaxFunction, bold = true },
    FidgetTask = { fg = colorscheme.commentText },
  }
end

return M
