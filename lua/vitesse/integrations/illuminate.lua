local colorscheme = require 'vitesse.colorscheme'

local M = {}

function M.highlights()
  return {
    IlluminatedWordText = { bg = colorscheme.menuOptionBackground },
    IlluminatedWordRead = { bg = colorscheme.menuOptionBackground },
    IlluminatedWordWrite = { bg = colorscheme.menuOptionBackground },
  }
end

return M
