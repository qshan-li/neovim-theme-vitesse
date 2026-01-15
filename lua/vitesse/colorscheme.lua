local config = require 'vitesse.config'
local utils = require 'vitesse.utils'

local palettes = {
  dark = {
    editorBackground = '#121212',
    sidebarBackground = '#121212',
    popupBackground = '#181818',
    floatingWindowBackground = '#121212',
    menuOptionBackground = '#181818',
    mainText = '#dbd7caee',
    emphasisText = '#bfbaaa',
    commandText = '#dbd7caee',
    inactiveText = '#dedcd550',
    disabledText = '#dedcd510',
    lineNumberText = '#dedcd550',
    selectedText = '#bfbaaa',
    inactiveSelectionText = '#dedcd590',
    windowBorder = '#191919',
    focusedBorder = '#181818',
    emphasizedBorder = '#181818',
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
  },
  ['dark-soft'] = {
    editorBackground = '#222222',
    sidebarBackground = '#222222',
    popupBackground = '#292929',
    floatingWindowBackground = '#222222',
    menuOptionBackground = '#292929',
    mainText = '#dbd7caee',
    emphasisText = '#bfbaaa',
    commandText = '#dbd7caee',
    inactiveText = '#dedcd550',
    disabledText = '#dedcd510',
    lineNumberText = '#dedcd550',
    selectedText = '#bfbaaa',
    inactiveSelectionText = '#dedcd590',
    windowBorder = '#252525',
    focusedBorder = '#292929',
    emphasizedBorder = '#292929',
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
  },
  light = {
    editorBackground = '#ffffff',
    sidebarBackground = '#ffffff',
    popupBackground = '#f7f7f7',
    floatingWindowBackground = '#ffffff',
    menuOptionBackground = '#f7f7f7',
    mainText = '#393a34',
    emphasisText = '#4e4f47',
    commandText = '#393a34',
    inactiveText = '#393a3450',
    disabledText = '#393a3410',
    lineNumberText = '#393a3450',
    selectedText = '#4e4f47',
    inactiveSelectionText = '#393a3490',
    windowBorder = '#f0f0f0',
    focusedBorder = '#f7f7f7',
    emphasizedBorder = '#f7f7f7',
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
  },
  ['light-soft'] = {
    editorBackground = '#F1F0E9',
    sidebarBackground = '#F1F0E9',
    popupBackground = '#e7e5db',
    floatingWindowBackground = '#F1F0E9',
    menuOptionBackground = '#e7e5db',
    mainText = '#393a34',
    emphasisText = '#4e4f47',
    commandText = '#393a34',
    inactiveText = '#393a3450',
    disabledText = '#393a3410',
    lineNumberText = '#393a3450',
    selectedText = '#4e4f47',
    inactiveSelectionText = '#393a3490',
    windowBorder = '#e7e5db',
    focusedBorder = '#e7e5db',
    emphasizedBorder = '#e7e5db',
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
  },
}

local function resolve_theme()
  local theme = config.theme or 'auto'
  if theme == 'auto' then
    return vim.o.background == 'light' and 'light' or 'dark'
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

  colorscheme.editorBackground =
    config.transparent and 'none' or palette.editorBackground
  colorscheme.sidebarBackground = premix(palette.sidebarBackground)
  colorscheme.popupBackground = premix(palette.popupBackground)
  colorscheme.floatingWindowBackground = premix(palette.floatingWindowBackground)
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
end

function colorscheme.refresh()
  local palette = palettes[resolve_theme()]
  apply_palette(palette)
  return colorscheme
end

colorscheme.refresh()

return colorscheme
