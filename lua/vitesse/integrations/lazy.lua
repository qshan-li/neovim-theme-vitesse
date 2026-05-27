local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    LazyButton = {
      bg = colorscheme.menuOptionBackground,
      fg = colorscheme.mainText,
    },
    LazyButtonActive = {
      bg = colorscheme.syntaxFunction,
      fg = colorscheme.editorBackground,
      bold = true,
    },
    LazyComment = { fg = colorscheme.commentText },
    LazyCommit = { fg = colorscheme.syntaxOperator },
    LazyCommitIssue = { fg = colorscheme.warningText },
    LazyDimmed = { fg = colorscheme.inactiveText },
    LazyDir = { fg = colorscheme.linkText },
    LazyH1 = { fg = colorscheme.syntaxFunction, bold = true },
    LazyH2 = { fg = colorscheme.syntaxKeyword, bold = true },
    LazyLocal = { fg = colorscheme.syntaxFunction },
    LazyNoCond = { fg = colorscheme.inactiveText },
    LazyNormal = {
      fg = colorscheme.mainText,
      bg = colorscheme.floatingWindowBackground,
    },
    LazyProgressDone = { fg = colorscheme.syntaxFunction },
    LazyProgressTodo = { fg = colorscheme.inactiveText },
    LazyReasonCmd = { fg = colorscheme.syntaxFunction },
    LazyReasonEvent = { fg = colorscheme.warningText },
    LazyReasonFt = { fg = colorscheme.linkText },
    LazyReasonImport = { fg = colorscheme.mainText },
    LazyReasonKeys = { fg = colorscheme.syntaxKeyword },
    LazyReasonPlugin = { fg = colorscheme.syntaxError },
    LazyReasonRequire = { fg = colorscheme.specialKeyword },
    LazyReasonSource = { fg = colorscheme.syntaxFunction },
    LazyReasonStart = { fg = colorscheme.successText },
    LazySpecial = { fg = colorscheme.syntaxKeyword },
    LazyTaskOutput = { fg = colorscheme.mainText },
    LazyUrl = { fg = colorscheme.linkText, underline = true },
    LazyValue = { fg = colorscheme.syntaxFunction },
  }
end

return M
