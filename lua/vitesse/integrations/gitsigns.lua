local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    GitSignsAdd = { fg = colorscheme.successText },
    GitSignsChange = { fg = colorscheme.warningText },
    GitSignsDelete = { fg = colorscheme.errorText },
    GitSignsCurrentLineBlame = { fg = colorscheme.commentText },
  }
end

return M
