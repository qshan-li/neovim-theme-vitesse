local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    NotifyBackground = { bg = colorscheme.floatingWindowBackground },
    NotifyINFOIcon = { fg = colorscheme.syntaxFunction },
    NotifyINFOTitle = { fg = colorscheme.syntaxFunction },
    NotifyINFOBody = { fg = colorscheme.mainText },
    NotifyWARNIcon = { fg = colorscheme.warningText },
    NotifyWARNTitle = { fg = colorscheme.warningText },
    NotifyWARNBody = { fg = colorscheme.mainText },
    NotifyERRORIcon = { fg = colorscheme.syntaxError },
    NotifyERRORTitle = { fg = colorscheme.syntaxError },
    NotifyERRORBody = { fg = colorscheme.mainText },
    NotifyDEBUGIcon = { fg = colorscheme.syntaxOperator },
    NotifyDEBUGTitle = { fg = colorscheme.syntaxOperator },
    NotifyDEBUGBody = { fg = colorscheme.mainText },
    NotifyTRACEIcon = { fg = colorscheme.linkText },
    NotifyTRACETitle = { fg = colorscheme.linkText },
    NotifyTRACEBody = { fg = colorscheme.mainText },
  }
end

return M
