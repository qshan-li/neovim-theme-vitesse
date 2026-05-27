local colorscheme = require 'vitesse.colorscheme'
local config = require 'vitesse.config'
local utils = require 'vitesse.utils'

local diagnostic = require 'vitesse.groups.diagnostic'
local editor = require 'vitesse.groups.editor'
local lsp = require 'vitesse.groups.lsp'
local syntax = require 'vitesse.groups.syntax'
local treesitter = require 'vitesse.groups.treesitter'

local bufferline = require 'vitesse.integrations.bufferline'
local cmp = require 'vitesse.integrations.cmp'
local flash = require 'vitesse.integrations.flash'
local gitsigns = require 'vitesse.integrations.gitsigns'
local neo_tree = require 'vitesse.integrations.neo-tree'
local noice = require 'vitesse.integrations.noice'
local telescope = require 'vitesse.integrations.telescope'
local trouble = require 'vitesse.integrations.trouble'
local which_key = require 'vitesse.integrations.which-key'

local theme = {}

local function set_terminal_colors()
  vim.g.terminal_color_0 = colorscheme.editorBackground
  vim.g.terminal_color_1 = colorscheme.syntaxError
  vim.g.terminal_color_2 = colorscheme.successText
  vim.g.terminal_color_3 = colorscheme.warningEmphasis
  vim.g.terminal_color_4 = colorscheme.syntaxFunction
  vim.g.terminal_color_5 = colorscheme.syntaxKeyword
  vim.g.terminal_color_6 = colorscheme.linkText
  vim.g.terminal_color_7 = colorscheme.mainText
  vim.g.terminal_color_8 = colorscheme.inactiveText
  vim.g.terminal_color_9 = colorscheme.errorText
  vim.g.terminal_color_10 = colorscheme.stringText
  vim.g.terminal_color_11 = colorscheme.warningText
  vim.g.terminal_color_12 = colorscheme.syntaxOperator
  vim.g.terminal_color_13 = colorscheme.syntaxError
  vim.g.terminal_color_14 = colorscheme.stringText
  vim.g.terminal_color_15 = colorscheme.commentText
  vim.g.terminal_color_background = colorscheme.editorBackground
  vim.g.terminal_color_foreground = colorscheme.mainText
end

local function set_groups()
  local groups = vim.tbl_extend(
    'force',
    editor.highlights(colorscheme, config, utils),
    syntax.highlights(colorscheme, config, utils)
  )
  groups = vim.tbl_extend(
    'force',
    groups,
    treesitter.highlights(colorscheme, config, utils)
  )
  groups =
    vim.tbl_extend('force', groups, lsp.highlights(colorscheme, config, utils))
  groups = vim.tbl_extend('force', groups, diagnostic.highlights(colorscheme))

  -- built-in integrations (no toggle)
  groups = vim.tbl_extend('force', groups, cmp.highlights())

  -- toggleable integrations
  local integrations = {
    { name = 'telescope', mod = telescope },
    { name = 'gitsigns', mod = gitsigns },
    { name = 'which_key', mod = which_key },
    { name = 'neo_tree', mod = neo_tree },
    { name = 'trouble', mod = trouble },
    { name = 'noice', mod = noice },
    { name = 'flash', mod = flash },
  }
  for _, integration in ipairs(integrations) do
    if config.integrations and config.integrations[integration.name] then
      groups = vim.tbl_extend('force', groups, integration.mod.highlights())
    end
  end

  -- overrides
  groups = vim.tbl_extend(
    'force',
    groups,
    type(config.overrides) == 'function' and config.overrides()
      or config.overrides
  )

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

function theme.setup(values)
  setmetatable(
    config,
    { __index = vim.tbl_extend('force', config.defaults, values) }
  )

  colorscheme.refresh()

  theme.bufferline = { highlights = {} }
  theme.bufferline.highlights = bufferline.highlights(config)
end

function theme.colorscheme()
  if vim.version().minor < 8 then
    vim.notify(
      'Neovim 0.8+ is required for vitesse colorscheme',
      vim.log.levels.ERROR,
      { title = 'Min Theme' }
    )
    return
  end

  vim.api.nvim_command 'hi clear'
  if vim.fn.exists 'syntax_on' then
    vim.api.nvim_command 'syntax reset'
  end

  vim.g.VM_theme_set_by_colorscheme = true
  vim.o.termguicolors = true
  vim.g.colors_name = 'vitesse'

  colorscheme.refresh()
  if config.terminal_colors then
    set_terminal_colors()
  end
  set_groups()
end

function theme.get_colors()
  local colors = {}
  for k, v in pairs(colorscheme) do
    if type(v) == 'string' then
      colors[k] = v
    end
  end
  return colors
end

return theme
