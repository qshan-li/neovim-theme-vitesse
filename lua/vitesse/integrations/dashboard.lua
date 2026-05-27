local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    DashboardHeader = { fg = colorscheme.syntaxFunction },
    DashboardFooter = { fg = colorscheme.commentText },
    DashboardProjectTitle = { fg = colorscheme.syntaxKeyword, bold = true },
    DashboardProjectTitleIcon = { fg = colorscheme.syntaxFunction },
    DashboardProjectIcon = { fg = colorscheme.syntaxFunction },
    DashboardMruTitle = { fg = colorscheme.syntaxKeyword, bold = true },
    DashboardMruIcon = { fg = colorscheme.syntaxFunction },
    DashboardShortCut = { fg = colorscheme.warningText },
    DashboardShortCutIcon = { fg = colorscheme.warningText },
    DashboardCenter = { fg = colorscheme.mainText },
    DashboardKey = { fg = colorscheme.syntaxFunction },
    DashboardDesc = { fg = colorscheme.mainText },
    DashboardIcon = { fg = colorscheme.syntaxFunction },
  }
end

return M
