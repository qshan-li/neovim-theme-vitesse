local M = {}

function M.highlights(c)
  return {
    DiagnosticError = { link = 'Error' },
    DiagnosticWarn = { link = 'WarningMsg' },
    DiagnosticInfo = { fg = c.syntaxFunction },
    DiagnosticHint = { fg = c.warningEmphasis },
    DiagnosticVirtualTextError = { link = 'DiagnosticError' },
    DiagnosticVirtualTextWarn = { link = 'DiagnosticWarn' },
    DiagnosticVirtualTextInfo = { link = 'DiagnosticInfo' },
    DiagnosticVirtualTextHint = { link = 'DiagnosticHint' },
    DiagnosticUnderlineError = { undercurl = true, link = 'DiagnosticError' },
    DiagnosticUnderlineWarn = { undercurl = true, link = 'DiagnosticWarn' },
    DiagnosticUnderlineInfo = { undercurl = true, link = 'DiagnosticInfo' },
    DiagnosticUnderlineHint = { undercurl = true, link = 'DiagnosticHint' },
    DiagnosticFloatingError = { link = 'DiagnosticError' },
    DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
    DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
    DiagnosticFloatingHint = { link = 'DiagnosticHint' },
    DiagnosticSignError = { fg = c.syntaxError },
    DiagnosticSignWarn = { fg = c.warningText },
    DiagnosticSignInfo = { fg = c.syntaxFunction },
    DiagnosticSignHint = { fg = c.warningEmphasis },
    DiagnosticDeprecated = { strikethrough = true },
  }
end

return M
