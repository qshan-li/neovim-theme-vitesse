local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    CopilotSuggestion = { fg = colorscheme.inactiveText, italic = true },
    CopilotAnnotation = { fg = colorscheme.commentText },
  }
end

return M
