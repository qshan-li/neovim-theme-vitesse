local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    NavicText = { fg = colorscheme.mainText },
    NavicSeparator = { fg = colorscheme.syntaxOperator },
    NavicIconsFile = { fg = colorscheme.mainText },
    NavicIconsModule = { fg = colorscheme.syntaxKeyword },
    NavicIconsNamespace = { fg = colorscheme.syntaxKeyword },
    NavicIconsPackage = { fg = colorscheme.syntaxKeyword },
    NavicIconsClass = { fg = colorscheme.syntaxKeyword },
    NavicIconsMethod = { fg = colorscheme.syntaxFunction },
    NavicIconsProperty = { fg = colorscheme.syntaxFunction },
    NavicIconsField = { fg = colorscheme.syntaxFunction },
    NavicIconsConstructor = { fg = colorscheme.syntaxFunction },
    NavicIconsEnum = { fg = colorscheme.syntaxKeyword },
    NavicIconsInterface = { fg = colorscheme.syntaxKeyword },
    NavicIconsFunction = { fg = colorscheme.syntaxFunction },
    NavicIconsVariable = { fg = colorscheme.mainText },
    NavicIconsConstant = { fg = colorscheme.syntaxError },
    NavicIconsString = { fg = colorscheme.stringText },
    NavicIconsNumber = { fg = colorscheme.foregroundEmphasis },
    NavicIconsBoolean = { fg = colorscheme.syntaxFunction },
    NavicIconsArray = { fg = colorscheme.syntaxKeyword },
    NavicIconsObject = { fg = colorscheme.syntaxKeyword },
    NavicIconsKey = { fg = colorscheme.warningText },
    NavicIconsNull = { fg = colorscheme.syntaxOperator },
    NavicIconsEnumMember = { fg = colorscheme.syntaxFunction },
    NavicIconsStruct = { fg = colorscheme.syntaxKeyword },
    NavicIconsEvent = { fg = colorscheme.warningText },
    NavicIconsOperator = { fg = colorscheme.syntaxError },
    NavicIconsTypeParameter = { fg = colorscheme.syntaxKeyword },
  }
end

return M
