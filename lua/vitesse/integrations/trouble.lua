local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    TroubleNormal = {
      fg = colorscheme.mainText,
      bg = colorscheme.sidebarBackground,
    },
    TroubleCount = { fg = colorscheme.syntaxFunction, bold = true },
    TroubleError = { fg = colorscheme.errorText },
    TroubleWarning = { fg = colorscheme.warningText },
    TroubleHint = { fg = colorscheme.warningEmphasis },
    TroubleInformation = { fg = colorscheme.syntaxFunction },
    TroubleTextError = { fg = colorscheme.errorText },
    TroubleTextWarning = { fg = colorscheme.warningText },
    TroubleTextHint = { fg = colorscheme.warningEmphasis },
    TroubleTextInformation = { fg = colorscheme.syntaxFunction },
    TroubleLocation = { fg = colorscheme.commentText },
    TroubleFile = { fg = colorscheme.syntaxFunction },
    TroubleCode = { fg = colorscheme.commentText },
    TroubleSource = { fg = colorscheme.syntaxKeyword },
  }
end

return M
