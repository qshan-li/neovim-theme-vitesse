local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    MasonNormal = {
      fg = colorscheme.mainText,
      bg = colorscheme.floatingWindowBackground,
    },
    MasonHeader = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.syntaxFunction,
      bold = true,
    },
    MasonHeaderSecondary = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.syntaxKeyword,
      bold = true,
    },
    MasonHighlight = { fg = colorscheme.syntaxFunction },
    MasonHighlightBlock = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.syntaxFunction,
    },
    MasonHighlightBlockBold = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.syntaxFunction,
      bold = true,
    },
    MasonHighlightSecondary = { fg = colorscheme.syntaxKeyword },
    MasonMuted = { fg = colorscheme.inactiveText },
    MasonMutedBlock = {
      fg = colorscheme.inactiveText,
      bg = colorscheme.menuOptionBackground,
    },
  }
end

return M
