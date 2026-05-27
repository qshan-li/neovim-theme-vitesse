local M = {}

function M.highlights(c, config, utils)
  local resolve = utils.resolve_style
  local comment_style = resolve(config, 'comments')
  local keyword_style = resolve(config, 'keywords')
  local string_style = resolve(config, 'strings')
  local number_style = resolve(config, 'numbers', { bold = true })

  return {
    Comment = { fg = c.commentText, italic = comment_style.italic },
    Constant = { fg = c.syntaxConstant },
    String = { fg = c.stringText, italic = string_style.italic },
    Character = { fg = c.stringText },
    Number = {
      fg = c.syntaxNumber,
      bold = number_style.bold,
    },
    Boolean = { fg = c.syntaxFunction },
    Float = { link = 'Number' },
    Identifier = { fg = c.mainText },
    Function = { fg = c.syntaxKeyword },
    Method = { fg = c.syntaxKeyword },
    Property = { fg = c.syntaxFunction },
    Field = { link = 'Property' },
    Parameter = { fg = c.mainText },
    Statement = { fg = c.syntaxError },
    Conditional = { fg = c.syntaxError },
    Label = { fg = c.syntaxFunction },
    Operator = { fg = c.syntaxError },
    Keyword = {
      link = 'Statement',
      italic = keyword_style.italic,
    },
    Exception = { fg = c.syntaxError },
    PreProc = { link = 'Keyword' },
    Define = { fg = c.syntaxKeyword },
    Macro = { link = 'Define' },
    PreCondit = { fg = c.syntaxError },
    Type = { fg = c.syntaxType },
    Struct = { link = 'Type' },
    Class = { link = 'Type' },
    Attribute = { link = 'Character' },
    Punctuation = { fg = c.syntaxOperator },
    Special = { fg = c.syntaxOperator },
    SpecialChar = { fg = c.syntaxError },
    Tag = { fg = c.stringText },
    Regex = { fg = c.syntaxRegex },
    Delimiter = { fg = c.syntaxOperator },
    Debug = { fg = c.specialKeyword },
    Underlined = { underline = not config.no_underline },
    Bold = { bold = not config.no_bold },
    Italic = { italic = not config.no_italic },
    Ignore = { fg = c.editorBackground },
    Error = { link = 'ErrorMsg' },
    Todo = { fg = c.warningText, bold = not config.no_bold },
  }
end

return M
