local colorscheme = require 'vitesse.colorscheme'
local config = require 'vitesse.config'

local function make_theme()
  local bg = config.transparent and 'NONE' or colorscheme.editorBackground

  return {
    normal = {
      a = {
        bg = colorscheme.blue,
        fg = colorscheme.editorBackground,
        gui = 'bold',
      },
      b = { bg = bg, fg = colorscheme.commentText },
      c = { bg = bg, fg = colorscheme.editorBackground },
    },
    insert = {
      a = {
        bg = colorscheme.syntaxError,
        fg = colorscheme.editorBackground,
        gui = 'bold',
      },
      b = { bg = bg, fg = colorscheme.commentText },
    },
    terminal = {
      a = {
        bg = colorscheme.successText,
        fg = colorscheme.editorBackground,
        gui = 'bold',
      },
      b = { bg = bg, fg = colorscheme.commentText },
    },
    command = {
      a = {
        bg = colorscheme.successText,
        fg = colorscheme.editorBackground,
        gui = 'bold',
      },
      b = { bg = bg, fg = colorscheme.commentText },
    },
    visual = {
      a = {
        bg = colorscheme.syntaxKeyword,
        fg = colorscheme.editorBackground,
        gui = 'bold',
      },
      b = { bg = bg, fg = colorscheme.commentText },
    },
    replace = {
      a = {
        bg = colorscheme.warningText,
        fg = colorscheme.editorBackground,
        gui = 'bold',
      },
      b = { bg = bg, fg = colorscheme.commentText },
    },
    inactive = {
      a = { bg = colorscheme.commentText, fg = colorscheme.editorBackground },
      b = { bg = bg, fg = colorscheme.warningText, gui = 'bold' },
      c = { bg = bg, fg = colorscheme.warningText },
    },
  }
end

-- Lazy evaluation: lualine calls this function to get the theme table,
-- so colors are resolved after setup() has been called.
return setmetatable({}, {
  __index = function(_, key)
    local theme = make_theme()
    return theme[key]
  end,
  __call = function()
    return make_theme()
  end,
})
