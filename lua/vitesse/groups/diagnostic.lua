local M = {}

function M.highlights(c, config)
  local underline_style = {
    undercurl = not config.no_undercurl,
    underline = config.no_undercurl and not config.no_underline or nil,
  }

  return {
    DiagnosticError = { link = 'Error' },
    DiagnosticWarn = { link = 'WarningMsg' },
    DiagnosticInfo = { fg = c.syntaxFunction },
    DiagnosticHint = { fg = c.warningEmphasis },
    DiagnosticVirtualTextError = { link = 'DiagnosticError' },
    DiagnosticVirtualTextWarn = { link = 'DiagnosticWarn' },
    DiagnosticVirtualTextInfo = { link = 'DiagnosticInfo' },
    DiagnosticVirtualTextHint = { link = 'DiagnosticHint' },
    DiagnosticUnderlineError = vim.tbl_extend(
      'force',
      { link = 'DiagnosticError' },
      underline_style
    ),
    DiagnosticUnderlineWarn = vim.tbl_extend(
      'force',
      { link = 'DiagnosticWarn' },
      underline_style
    ),
    DiagnosticUnderlineInfo = vim.tbl_extend(
      'force',
      { link = 'DiagnosticInfo' },
      underline_style
    ),
    DiagnosticUnderlineHint = vim.tbl_extend(
      'force',
      { link = 'DiagnosticHint' },
      underline_style
    ),
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
