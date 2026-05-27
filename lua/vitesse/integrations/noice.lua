local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    NoiceCmdline = { fg = colorscheme.mainText },
    NoiceCmdlineIcon = { fg = colorscheme.syntaxFunction },
    NoiceCmdlineIconSearch = { fg = colorscheme.warningEmphasis },
    NoiceCmdlinePopup = {
      bg = colorscheme.floatingWindowBackground,
    },
    NoiceCmdlinePopupBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.floatingWindowBackground,
    },
    NoiceCmdlinePopupBorderSearch = {
      fg = colorscheme.warningEmphasis,
      bg = colorscheme.floatingWindowBackground,
    },
    NoiceConfirm = { bg = colorscheme.floatingWindowBackground },
    NoiceConfirmBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.floatingWindowBackground,
    },
    NoiceMini = { bg = colorscheme.sidebarBackground },
    NoiceFormatProgressDone = {
      bg = colorscheme.syntaxFunction,
      fg = colorscheme.editorBackground,
    },
    NoiceFormatProgressTodo = {
      bg = colorscheme.syntaxOperator,
      fg = colorscheme.mainText,
    },
    NoiceLspProgressTitle = { fg = colorscheme.mainText },
    NoiceLspProgressClient = { fg = colorscheme.syntaxKeyword },
    NoiceLspProgressSpinner = { fg = colorscheme.syntaxFunction },
  }
end

return M
