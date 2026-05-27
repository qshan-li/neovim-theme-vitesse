local colorscheme = require 'vitesse.colorscheme'
local utils = require 'vitesse.utils'

local M = {}

function M.highlights()
  return {
    MiniCompletionActiveParameter = { bg = colorscheme.menuOptionBackground },
    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },
    MiniIndentscopeSymbol = {
      fg = colorscheme.syntaxOperator,
      nocombine = true,
    },
    MiniIndentscopePrefix = { nocombine = true },
    MiniJump = {
      bg = colorscheme.syntaxFunction,
      fg = colorscheme.editorBackground,
    },
    MiniJump2dSpot = {
      fg = colorscheme.syntaxError,
      bold = true,
      nocombine = true,
    },
    MiniStarterCurrent = { fg = colorscheme.mainText },
    MiniStarterHeader = { fg = colorscheme.syntaxFunction },
    MiniStarterFooter = { fg = colorscheme.commentText },
    MiniStarterItem = { fg = colorscheme.mainText },
    MiniStarterItemBullet = { fg = colorscheme.syntaxOperator },
    MiniStarterItemPrefix = { fg = colorscheme.warningText },
    MiniStarterSection = { fg = colorscheme.syntaxKeyword, bold = true },
    MiniStarterQuery = { fg = colorscheme.syntaxFunction },
    MiniStatuslineDevinfo = {
      fg = colorscheme.mainText,
      bg = colorscheme.popupBackground,
    },
    MiniStatuslineFileinfo = {
      fg = colorscheme.mainText,
      bg = colorscheme.popupBackground,
    },
    MiniStatuslineFilename = {
      fg = colorscheme.mainText,
      bg = colorscheme.popupBackground,
    },
    MiniStatuslineInactive = {
      fg = colorscheme.inactiveText,
      bg = colorscheme.sidebarBackground,
    },
    MiniStatuslineModeNormal = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.syntaxFunction,
      bold = true,
    },
    MiniStatuslineModeInsert = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.syntaxError,
      bold = true,
    },
    MiniStatuslineModeVisual = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.syntaxKeyword,
      bold = true,
    },
    MiniStatuslineModeReplace = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.warningText,
      bold = true,
    },
    MiniStatuslineModeCommand = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.successText,
      bold = true,
    },
    MiniSurround = {
      bg = colorscheme.warningEmphasis,
      fg = colorscheme.editorBackground,
    },
    MiniTablineCurrent = {
      fg = colorscheme.mainText,
      bg = colorscheme.editorBackground,
    },
    MiniTablineFill = { bg = colorscheme.sidebarBackground },
    MiniTablineHidden = {
      fg = colorscheme.inactiveText,
      bg = colorscheme.sidebarBackground,
    },
    MiniTablineModifiedCurrent = {
      fg = colorscheme.warningText,
      bg = colorscheme.editorBackground,
    },
    MiniTablineModifiedHidden = {
      fg = colorscheme.warningText,
      bg = colorscheme.sidebarBackground,
    },
    MiniTablineTabpagesection = { bg = colorscheme.menuOptionBackground },
    MiniPickMatchCurrent = { bg = colorscheme.menuOptionBackground },
    MiniPickMatchMarked = {
      bg = utils.mix(
        colorscheme.syntaxFunction,
        colorscheme.editorBackground,
        0.30
      ),
    },
    MiniPickNormal = { fg = colorscheme.mainText },
    MiniPickPrompt = { fg = colorscheme.syntaxFunction },
  }
end

return M
