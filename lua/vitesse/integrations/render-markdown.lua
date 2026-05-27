local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    RenderMarkdownCode = { fg = colorscheme.mainText, bg = 'NONE' },
    RenderMarkdownCodeBorder = { bg = 'NONE' },
    RenderMarkdownCodeInfo = { fg = colorscheme.inactiveText, bg = 'NONE' },
    RenderMarkdownCodeFallback = { bg = 'NONE' },
    RenderMarkdownCodeInline = { fg = colorscheme.mainText, bg = 'NONE' },
    RenderMarkdownInlineHighlight = { bg = 'NONE' },
  }
end

return M
