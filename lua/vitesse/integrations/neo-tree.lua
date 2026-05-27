local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    NeoTreeNormal = {
      fg = colorscheme.mainText,
      bg = colorscheme.sidebarBackground,
    },
    NeoTreeNormalNC = {
      fg = colorscheme.mainText,
      bg = colorscheme.sidebarBackground,
    },
    NeoTreeDimText = { fg = colorscheme.inactiveText },
    NeoTreeDirectoryName = { fg = colorscheme.mainText },
    NeoTreeDirectoryIcon = { fg = colorscheme.syntaxFunction },
    NeoTreeFileName = { fg = colorscheme.mainText },
    NeoTreeFileNameOpened = { fg = colorscheme.syntaxFunction },
    NeoTreeGitAdded = { fg = colorscheme.successText },
    NeoTreeGitConflict = { fg = colorscheme.errorText },
    NeoTreeGitDeleted = { fg = colorscheme.errorText },
    NeoTreeGitModified = { fg = colorscheme.warningText },
    NeoTreeGitUntracked = { fg = colorscheme.warningEmphasis },
    NeoTreeIndentMarker = { fg = colorscheme.syntaxOperator },
    NeoTreeRootName = { fg = colorscheme.syntaxFunction, bold = true },
    NeoTreeFloatBorder = {
      fg = colorscheme.windowBorder,
      bg = colorscheme.floatingWindowBackground,
    },
    NeoTreeFloatTitle = {
      fg = colorscheme.syntaxFunction,
      bold = true,
    },
    NeoTreeTitleBar = {
      fg = colorscheme.editorBackground,
      bg = colorscheme.syntaxFunction,
    },
  }
end

return M
