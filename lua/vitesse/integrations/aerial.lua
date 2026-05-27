local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    AerialNormal = { fg = colorscheme.mainText },
    AerialGuide = { fg = colorscheme.syntaxOperator },
    AerialLine = { bg = colorscheme.menuOptionBackground },
    AerialArrayIcon = { fg = colorscheme.syntaxKeyword },
    AerialBooleanIcon = { fg = colorscheme.syntaxFunction },
    AerialClassIcon = { fg = colorscheme.syntaxKeyword },
    AerialConstantIcon = { fg = colorscheme.syntaxError },
    AerialConstructorIcon = { fg = colorscheme.syntaxFunction },
    AerialEnumIcon = { fg = colorscheme.syntaxKeyword },
    AerialEnumMemberIcon = { fg = colorscheme.syntaxFunction },
    AerialEventIcon = { fg = colorscheme.warningText },
    AerialFieldIcon = { fg = colorscheme.syntaxFunction },
    AerialFileIcon = { fg = colorscheme.mainText },
    AerialFunctionIcon = { fg = colorscheme.syntaxFunction },
    AerialInterfaceIcon = { fg = colorscheme.syntaxKeyword },
    AerialKeyIcon = { fg = colorscheme.warningText },
    AerialMethodIcon = { fg = colorscheme.syntaxFunction },
    AerialModuleIcon = { fg = colorscheme.syntaxKeyword },
    AerialNamespaceIcon = { fg = colorscheme.syntaxKeyword },
    AerialNullIcon = { fg = colorscheme.syntaxOperator },
    AerialNumberIcon = { fg = colorscheme.foregroundEmphasis },
    AerialObjectIcon = { fg = colorscheme.syntaxKeyword },
    AerialOperatorIcon = { fg = colorscheme.syntaxError },
    AerialPackageIcon = { fg = colorscheme.syntaxKeyword },
    AerialPropertyIcon = { fg = colorscheme.syntaxFunction },
    AerialStringIcon = { fg = colorscheme.stringText },
    AerialStructIcon = { fg = colorscheme.syntaxKeyword },
    AerialTypeParameterIcon = { fg = colorscheme.syntaxKeyword },
    AerialVariableIcon = { fg = colorscheme.mainText },
  }
end

return M
