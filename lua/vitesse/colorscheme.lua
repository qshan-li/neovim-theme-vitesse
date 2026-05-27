local config = require 'vitesse.config'
local utils = require 'vitesse.utils'

local dark_base = {
  mainText = '#dbd7caee',
  emphasisText = '#bfbaaa',
  commandText = '#dbd7caee',
  inactiveText = '#dedcd550',
  disabledText = '#dedcd510',
  lineNumberText = '#dedcd550',
  selectedText = '#bfbaaa',
  inactiveSelectionText = '#dedcd590',
  syntaxFunction = '#80a665',
  syntaxError = '#cb7676',
  syntaxKeyword = '#4d9375',
  errorText = '#cb7676',
  warningText = '#d4976c',
  linkText = '#4d9375',
  commentText = '#758575dd',
  stringText = '#c98a7d',
  successText = '#4d9375',
  warningEmphasis = '#e6cc77',
  specialKeyword = '#d9739f',
  syntaxOperator = '#666666',
  foregroundEmphasis = '#bfbaaa',
  terminalGray = '#777777',
  blue = '#6394bf',
  syntaxVariable = '#bd976a',
  syntaxNumber = '#4C9A91',
  syntaxConstant = '#c99076',
  syntaxClass = '#6872ab',
  syntaxInterface = '#5d99a9',
  syntaxType = '#5DA994',
  syntaxBuiltin = '#cb7676',
  syntaxProperty = '#b8a965',
  syntaxNamespace = '#db889a',
  syntaxDecorator = '#bd8f8f',
  syntaxRegex = '#c4704f',
  syntaxCyan = '#5eaab5',
  syntaxMagenta = '#d9739f',
}

local light_base = {
  mainText = '#393a34',
  emphasisText = '#4e4f47',
  commandText = '#393a34',
  inactiveText = '#393a3450',
  disabledText = '#393a3410',
  lineNumberText = '#393a3450',
  selectedText = '#4e4f47',
  inactiveSelectionText = '#393a3490',
  syntaxFunction = '#59873a',
  syntaxError = '#ab5959',
  syntaxKeyword = '#1e754f',
  errorText = '#ab5959',
  warningText = '#a65e2b',
  linkText = '#1c6b48',
  commentText = '#a0ada0',
  stringText = '#b56959',
  successText = '#1e754f',
  warningEmphasis = '#bda437',
  specialKeyword = '#a13865',
  syntaxOperator = '#999999',
  foregroundEmphasis = '#4e4f47',
  terminalGray = '#aaaaaa',
  blue = '#296aa3',
  syntaxVariable = '#b07d48',
  syntaxNumber = '#2f798a',
  syntaxConstant = '#a65e2b',
  syntaxClass = '#5a6aa6',
  syntaxInterface = '#2e808f',
  syntaxType = '#2e8f82',
  syntaxBuiltin = '#ab5959',
  syntaxProperty = '#998418',
  syntaxNamespace = '#b05a78',
  syntaxDecorator = '#bd8f8f',
  syntaxRegex = '#ab5e3f',
  syntaxCyan = '#2993a3',
  syntaxMagenta = '#a13865',
}

local palettes = {
  dark = vim.tbl_extend('force', dark_base, {
    editorBackground = '#121212',
    sidebarBackground = '#121212',
    popupBackground = '#181818',
    floatingWindowBackground = '#121212',
    menuOptionBackground = '#181818',
    windowBorder = '#191919',
    focusedBorder = '#181818',
    emphasizedBorder = '#181818',
  }),
  ['dark-soft'] = vim.tbl_extend('force', dark_base, {
    editorBackground = '#222222',
    sidebarBackground = '#222222',
    popupBackground = '#292929',
    floatingWindowBackground = '#222222',
    menuOptionBackground = '#292929',
    windowBorder = '#252525',
    focusedBorder = '#292929',
    emphasizedBorder = '#292929',
  }),
  black = vim.tbl_extend('force', dark_base, {
    editorBackground = '#000000',
    sidebarBackground = '#000000',
    popupBackground = '#121212',
    floatingWindowBackground = '#000000',
    menuOptionBackground = '#121212',
    windowBorder = '#191919',
    focusedBorder = '#121212',
    emphasizedBorder = '#121212',
    mainText = '#dbd7cacc',
    syntaxOperator = '#444444',
  }),
  light = vim.tbl_extend('force', light_base, {
    editorBackground = '#ffffff',
    sidebarBackground = '#ffffff',
    popupBackground = '#f7f7f7',
    floatingWindowBackground = '#ffffff',
    menuOptionBackground = '#f7f7f7',
    windowBorder = '#f0f0f0',
    focusedBorder = '#f7f7f7',
    emphasizedBorder = '#f7f7f7',
  }),
  ['light-soft'] = vim.tbl_extend('force', light_base, {
    editorBackground = '#F1F0E9',
    sidebarBackground = '#F1F0E9',
    popupBackground = '#e7e5db',
    floatingWindowBackground = '#F1F0E9',
    menuOptionBackground = '#e7e5db',
    windowBorder = '#e7e5db',
    focusedBorder = '#e7e5db',
    emphasizedBorder = '#e7e5db',
  }),
}

local function resolve_theme()
  local theme = config.theme or 'auto'
  if theme == 'auto' then
    theme = vim.g.vitesse_theme
      or (vim.o.background == 'light' and 'light' or 'dark')
  end
  if palettes[theme] then
    return theme
  end
  return vim.o.background == 'light' and 'light' or 'dark'
end

local colorscheme = {
  standardWhite = '#ffffff',
  standardBlack = '#121212',
}

local function apply_palette(palette)
  local blend_base = palette.editorBackground

  local function premix(color)
    if type(color) ~= 'string' then
      return color
    end
    if #color == 9 then
      local base = color:sub(1, 7)
      local alpha_hex = color:sub(8, 9)
      local alpha = tonumber(alpha_hex, 16) / 255
      return utils.mix(base, blend_base, alpha)
    end
    return color
  end

  colorscheme.editorBackground = palette.editorBackground
  colorscheme.transparentBg = config.transparent and 'none' or nil
  colorscheme.sidebarBackground = premix(palette.sidebarBackground)
  colorscheme.popupBackground = premix(palette.popupBackground)
  colorscheme.floatingWindowBackground =
    premix(palette.floatingWindowBackground)
  colorscheme.menuOptionBackground = premix(palette.menuOptionBackground)

  colorscheme.mainText = premix(palette.mainText)
  colorscheme.emphasisText = premix(palette.emphasisText)
  colorscheme.commandText = premix(palette.commandText)
  colorscheme.inactiveText = premix(palette.inactiveText)
  colorscheme.disabledText = premix(palette.disabledText)
  colorscheme.lineNumberText = premix(palette.lineNumberText)
  colorscheme.selectedText = premix(palette.selectedText)
  colorscheme.inactiveSelectionText = premix(palette.inactiveSelectionText)

  colorscheme.windowBorder = premix(palette.windowBorder)
  colorscheme.focusedBorder = premix(palette.focusedBorder)
  colorscheme.emphasizedBorder = premix(palette.emphasizedBorder)

  colorscheme.syntaxFunction = premix(palette.syntaxFunction)
  colorscheme.syntaxError = premix(palette.syntaxError)
  colorscheme.syntaxKeyword = premix(palette.syntaxKeyword)
  colorscheme.errorText = premix(palette.errorText)
  colorscheme.warningText = premix(palette.warningText)
  colorscheme.linkText = premix(palette.linkText)
  colorscheme.commentText = premix(palette.commentText)
  colorscheme.stringText = premix(palette.stringText)
  colorscheme.successText = premix(palette.successText)
  colorscheme.warningEmphasis = premix(palette.warningEmphasis)
  colorscheme.specialKeyword = premix(palette.specialKeyword)
  colorscheme.syntaxOperator = premix(palette.syntaxOperator)
  colorscheme.foregroundEmphasis = premix(palette.foregroundEmphasis)
  colorscheme.terminalGray = premix(palette.terminalGray)
  colorscheme.blue = premix(palette.blue)

  colorscheme.syntaxVariable = premix(palette.syntaxVariable)
  colorscheme.syntaxNumber = premix(palette.syntaxNumber)
  colorscheme.syntaxConstant = premix(palette.syntaxConstant)
  colorscheme.syntaxClass = premix(palette.syntaxClass)
  colorscheme.syntaxInterface = premix(palette.syntaxInterface)
  colorscheme.syntaxType = premix(palette.syntaxType)
  colorscheme.syntaxBuiltin = premix(palette.syntaxBuiltin)
  colorscheme.syntaxProperty = premix(palette.syntaxProperty)
  colorscheme.syntaxNamespace = premix(palette.syntaxNamespace)
  colorscheme.syntaxDecorator = premix(palette.syntaxDecorator)
  colorscheme.syntaxRegex = premix(palette.syntaxRegex)
  colorscheme.syntaxCyan = premix(palette.syntaxCyan)
  colorscheme.syntaxMagenta = premix(palette.syntaxMagenta)
end

function colorscheme.refresh()
  local palette = palettes[resolve_theme()]

  if config.on_colors then
    config.on_colors(palette)
  end

  apply_palette(palette)
  return colorscheme
end

colorscheme.refresh()

return colorscheme
