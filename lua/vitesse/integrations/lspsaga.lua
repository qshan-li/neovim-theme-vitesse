local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    SagaNormal = { fg = colorscheme.mainText, bg = colorscheme.popupBackground },
    SagaBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.popupBackground,
    },
    HoverNormal = { link = 'SagaNormal' },
    HoverBorder = { link = 'SagaBorder' },
    ActionPreviewNormal = { link = 'SagaNormal' },
    ActionPreviewBorder = { link = 'SagaBorder' },
    DiagnosticNormal = { link = 'SagaNormal' },
    DiagnosticBorder = { link = 'SagaBorder' },
    DiagnosticShowNormal = { link = 'SagaNormal' },
    DiagnosticShowBorder = { link = 'SagaBorder' },
    TerminalNormal = { link = 'SagaNormal' },
    TerminalBorder = { link = 'SagaBorder' },
  }
end

return M
