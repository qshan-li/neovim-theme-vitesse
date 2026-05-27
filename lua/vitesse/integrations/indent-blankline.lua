local colorscheme = require 'vitesse.colorscheme'
local utils = require 'vitesse.utils'

local M = {}

function M.highlights()
  local indent_guide =
    utils.mix(colorscheme.syntaxOperator, colorscheme.editorBackground, 0.22)

  return {
    IndentBlanklineChar = { fg = indent_guide, nocombine = true },
    IndentBlanklineContextChar = { fg = colorscheme.blue, nocombine = true },
    IndentBlanklineContextStart = {
      sp = colorscheme.blue,
      underline = true,
    },
    IblIndent = { fg = indent_guide, nocombine = true },
    IblWhitespace = { fg = indent_guide, nocombine = true },
    IblScope = { fg = colorscheme.blue, nocombine = true },
  }
end

return M
