local colorscheme = require 'vitesse.colorscheme'
local utils = require 'vitesse.utils'

local M = {}

function M.highlights()
  return {
    DapBreakpoint = { fg = colorscheme.syntaxError },
    DapBreakpointCondition = { fg = colorscheme.warningText },
    DapLogPoint = { fg = colorscheme.linkText },
    DapStopped = { fg = colorscheme.warningEmphasis },
    DapStoppedLine = {
      bg = utils.mix(
        colorscheme.warningEmphasis,
        colorscheme.editorBackground,
        0.15
      ),
    },
    DapUIPlayPause = { fg = colorscheme.successText },
    DapUIRestart = { fg = colorscheme.warningText },
    DapUIStepInto = { fg = colorscheme.syntaxFunction },
    DapUIStepOver = { fg = colorscheme.syntaxFunction },
    DapUIStepOut = { fg = colorscheme.syntaxFunction },
    DapUIStepBack = { fg = colorscheme.syntaxFunction },
    DapUIStop = { fg = colorscheme.syntaxError },
    DapUIUnavailable = { fg = colorscheme.inactiveText },
    DapUIWatchesEmpty = { fg = colorscheme.inactiveText },
    DapUIWatchesError = { fg = colorscheme.syntaxError },
    DapUIWatchesValue = { fg = colorscheme.mainText },
    DapUIScope = { fg = colorscheme.syntaxFunction, bold = true },
    DapUIType = { fg = colorscheme.syntaxKeyword },
    DapUIValue = { fg = colorscheme.mainText },
    DapUIModifiedValue = { fg = colorscheme.warningText },
    DapUIDecoration = { fg = colorscheme.syntaxOperator },
    DapUIThread = { fg = colorscheme.successText },
    DapUISource = { fg = colorscheme.linkText },
    DapUILineNumber = { fg = colorscheme.lineNumberText },
    DapUIFloatBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.floatingWindowBackground,
    },
    DapUIFloatNormal = {
      fg = colorscheme.mainText,
      bg = colorscheme.floatingWindowBackground,
    },
    DapUIBreakpointsPath = { fg = colorscheme.linkText },
    DapUIBreakpointsInfo = { fg = colorscheme.mainText },
    DapUIBreakpointsCurrentLine = {
      fg = colorscheme.warningEmphasis,
      bold = true,
    },
    DapUIBreakpointsLine = { fg = colorscheme.lineNumberText },
  }
end

return M
