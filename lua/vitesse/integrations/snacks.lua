local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    SnacksNormal = {
      fg = colorscheme.mainText,
      bg = colorscheme.floatingWindowBackground,
    },
    SnacksNormalNC = {
      fg = colorscheme.inactiveText,
      bg = colorscheme.sidebarBackground,
    },
    SnacksDashboardHeader = { fg = colorscheme.syntaxFunction },
    SnacksDashboardFooter = { fg = colorscheme.commentText },
    SnacksDashboardDir = { fg = colorscheme.linkText },
    SnacksDashboardFile = { fg = colorscheme.mainText },
    SnacksDashboardIcon = { fg = colorscheme.syntaxFunction },
    SnacksDashboardKey = { fg = colorscheme.warningText },
    SnacksDashboardDesc = { fg = colorscheme.mainText },
    SnacksDashboardShortcut = { fg = colorscheme.warningText },
    SnacksIndent = { fg = colorscheme.syntaxOperator, nocombine = true },
    SnacksIndentScope = { fg = colorscheme.blue, nocombine = true },
    SnacksPickerDir = { fg = colorscheme.linkText },
    SnacksPickerFile = { fg = colorscheme.mainText },
    SnacksPickerMatch = { fg = colorscheme.successText, bold = true },
    SnacksPickerPrompt = { fg = colorscheme.syntaxFunction },
    SnacksPickerTitle = { fg = colorscheme.syntaxFunction, bold = true },
    SnacksScratchDesc = { fg = colorscheme.commentText },
    SnacksScratchFile = { fg = colorscheme.mainText },
    SnacksNotifierInfo = { fg = colorscheme.syntaxFunction },
    SnacksNotifierWarn = { fg = colorscheme.warningText },
    SnacksNotifierError = { fg = colorscheme.syntaxError },
    SnacksNotifierDebug = { fg = colorscheme.syntaxOperator },
    SnacksNotifierTrace = { fg = colorscheme.linkText },
    SnacksZen = {
      fg = colorscheme.mainText,
      bg = colorscheme.floatingWindowBackground,
    },
    SnacksZenNC = {
      fg = colorscheme.inactiveText,
      bg = colorscheme.sidebarBackground,
    },
    SnacksInputNormal = {
      fg = colorscheme.mainText,
      bg = colorscheme.floatingWindowBackground,
    },
    SnacksInputBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.floatingWindowBackground,
    },
    SnacksInputPrompt = { fg = colorscheme.syntaxFunction },
  }
end

return M
