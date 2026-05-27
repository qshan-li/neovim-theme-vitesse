local M = {}

function M.highlights(c, config, utils)
  local bg = c.transparentBg or c.editorBackground
  local diff_add_bg = utils.mix(c.successText, c.editorBackground, 0.18)
  local diff_delete_bg = utils.mix(c.syntaxError, c.editorBackground, 0.18)
  local diff_change_bg = utils.mix(c.syntaxFunction, c.editorBackground, 0.18)
  local diff_text_bg = utils.mix(c.syntaxFunction, c.editorBackground, 0.30)

  return {
    Normal = { fg = c.mainText, bg = bg },
    LineNr = { fg = c.lineNumberText },
    ColorColumn = {
      bg = utils.shade(c.linkText, 0.5, c.editorBackground),
    },
    Conceal = {},
    Cursor = { fg = c.editorBackground, bg = c.mainText },
    lCursor = { link = 'Cursor' },
    CursorIM = { link = 'Cursor' },
    CursorLine = { bg = c.popupBackground },
    CursorColumn = { link = 'CursorLine' },
    Directory = { fg = c.syntaxFunction },
    DiffAdd = { bg = diff_add_bg, fg = c.successText },
    DiffChange = { bg = diff_change_bg, fg = c.syntaxFunction },
    DiffDelete = { bg = diff_delete_bg, fg = c.syntaxError },
    DiffText = { bg = diff_text_bg, fg = c.syntaxFunction },
    EndOfBuffer = { fg = c.syntaxKeyword },
    TermCursor = { link = 'Cursor' },
    TermCursorNC = { link = 'Cursor' },
    ErrorMsg = { fg = c.syntaxError },
    VertSplit = { fg = c.windowBorder, bg = bg },
    Winseparator = { link = 'VertSplit' },
    SignColumn = { link = 'Normal' },
    Folded = { fg = c.mainText, bg = c.popupBackground },
    FoldColumn = { link = 'SignColumn' },
    IncSearch = {
      bg = utils.mix(c.syntaxFunction, c.editorBackground, 0.30),
      fg = c.editorBackground,
    },
    Substitute = { link = 'IncSearch' },
    CursorLineNr = { fg = c.commentText },
    MatchParen = { fg = c.syntaxError, bg = bg },
    ModeMsg = { link = 'Normal' },
    MsgArea = { link = 'Normal' },
    MoreMsg = { fg = c.syntaxFunction },
    NonText = { fg = utils.shade(c.editorBackground, 0.30) },
    NormalFloat = { bg = c.floatingWindowBackground },
    FloatBorder = { fg = c.windowBorder, bg = c.floatingWindowBackground },
    FloatTitle = {
      fg = c.syntaxFunction,
      bg = c.floatingWindowBackground,
      bold = true,
    },
    NormalNC = (function()
      if not config.dim_inactive then
        return { link = 'Normal' }
      end
      local ratio = type(config.dim_inactive) == 'number'
          and config.dim_inactive
        or 0.5
      return { fg = utils.shade(c.mainText, ratio), bg = bg }
    end)(),
    Pmenu = { link = 'NormalFloat' },
    PmenuSel = { bg = c.menuOptionBackground },
    PmenuSbar = {
      bg = utils.shade(c.syntaxFunction, 0.5, c.editorBackground),
    },
    PmenuThumb = { bg = utils.shade(c.editorBackground, 0.20) },
    Question = { fg = c.syntaxFunction },
    QuickFixLine = { fg = c.syntaxFunction },
    SpecialKey = { fg = c.syntaxOperator },
    StatusLine = { fg = c.mainText, bg = bg },
    StatusLineNC = { fg = c.inactiveText, bg = c.sidebarBackground },
    WinBar = { fg = c.selectedText, bg = bg },
    WinBarNC = { fg = c.inactiveText, bg = bg },
    TabLine = { bg = c.sidebarBackground, fg = c.inactiveText },
    TabLineFill = { link = 'TabLine' },
    TabLineSel = { bg = c.editorBackground, fg = c.emphasisText },
    Search = {
      bg = utils.shade(c.stringText, 0.40, c.editorBackground),
    },
    CurSearch = {
      bg = utils.mix(c.syntaxFunction, c.editorBackground, 0.30),
      fg = c.editorBackground,
    },
    SpellBad = {
      undercurl = not config.no_undercurl,
      underline = config.no_undercurl and not config.no_underline or nil,
      sp = c.syntaxError,
    },
    SpellCap = {
      undercurl = not config.no_undercurl,
      underline = config.no_undercurl and not config.no_underline or nil,
      sp = c.syntaxFunction,
    },
    SpellLocal = {
      undercurl = not config.no_undercurl,
      underline = config.no_undercurl and not config.no_underline or nil,
      sp = c.syntaxKeyword,
    },
    SpellRare = {
      undercurl = not config.no_undercurl,
      underline = config.no_undercurl and not config.no_underline or nil,
      sp = c.warningText,
    },
    Title = { fg = c.syntaxFunction },
    Visual = {
      bg = utils.shade(c.syntaxFunction, 0.40, c.editorBackground),
    },
    VisualNOS = { link = 'Visual' },
    WarningMsg = { fg = c.warningText },
    Whitespace = { fg = c.syntaxOperator },
    WildMenu = { bg = c.menuOptionBackground },
    MsgSeparator = { fg = c.windowBorder },
    RedrawDebugClear = { bg = c.warningEmphasis },
    RedrawDebugComposed = { bg = c.successText },
    RedrawDebugRecompose = { bg = c.syntaxError },
    healthSuccess = { fg = c.successText },
    healthWarning = { fg = c.warningText },
  }
end

return M
