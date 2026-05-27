local cache = require 'vitesse.cache'
local colorscheme = require 'vitesse.colorscheme'
local config = require 'vitesse.config'
local utils = require 'vitesse.utils'

local diagnostic = require 'vitesse.groups.diagnostic'
local editor = require 'vitesse.groups.editor'
local lsp = require 'vitesse.groups.lsp'
local syntax = require 'vitesse.groups.syntax'
local treesitter = require 'vitesse.groups.treesitter'

local aerial = require 'vitesse.integrations.aerial'
local bufferline = require 'vitesse.integrations.bufferline'
local cmp = require 'vitesse.integrations.cmp'
local copilot = require 'vitesse.integrations.copilot'
local dap = require 'vitesse.integrations.dap'
local dashboard = require 'vitesse.integrations.dashboard'
local fidget = require 'vitesse.integrations.fidget'
local flash = require 'vitesse.integrations.flash'
local gitsigns = require 'vitesse.integrations.gitsigns'
local hop = require 'vitesse.integrations.hop'
local illuminate = require 'vitesse.integrations.illuminate'
local indent_blankline = require 'vitesse.integrations.indent-blankline'
local lazy = require 'vitesse.integrations.lazy'
local lspsaga = require 'vitesse.integrations.lspsaga'
local mason = require 'vitesse.integrations.mason'
local mini = require 'vitesse.integrations.mini'
local navic = require 'vitesse.integrations.navic'
local neo_tree = require 'vitesse.integrations.neo-tree'
local noice = require 'vitesse.integrations.noice'
local notify = require 'vitesse.integrations.notify'
local oil = require 'vitesse.integrations.oil'
local render_markdown = require 'vitesse.integrations.render-markdown'
local snacks = require 'vitesse.integrations.snacks'
local telescope = require 'vitesse.integrations.telescope'
local trouble = require 'vitesse.integrations.trouble'
local which_key = require 'vitesse.integrations.which-key'

local theme = {}

local function deep_merge(base, override)
  local result = {}
  for k, v in pairs(base) do
    result[k] = v
  end
  for k, v in pairs(override) do
    if type(v) == 'table' and type(result[k]) == 'table' then
      result[k] = deep_merge(result[k], v)
    else
      result[k] = v
    end
  end
  return result
end

local function deep_copy(t)
  if type(t) ~= 'table' then
    return t
  end
  local copy = {}
  for k, v in pairs(t) do
    copy[k] = deep_copy(v)
  end
  return copy
end

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

local function compute_groups()
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
  groups =
    vim.tbl_extend('force', groups, diagnostic.highlights(colorscheme, config))

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
    { name = 'notify', mod = notify },
    { name = 'render_markdown', mod = render_markdown },
    { name = 'indent_blankline', mod = indent_blankline },
    { name = 'lspsaga', mod = lspsaga },
    { name = 'lazy', mod = lazy },
    { name = 'mason', mod = mason },
    { name = 'dashboard', mod = dashboard },
    { name = 'oil', mod = oil },
    { name = 'dap', mod = dap },
    { name = 'mini', mod = mini },
    { name = 'fidget', mod = fidget },
    { name = 'navic', mod = navic },
    { name = 'illuminate', mod = illuminate },
    { name = 'hop', mod = hop },
    { name = 'copilot', mod = copilot },
    { name = 'aerial', mod = aerial },
    { name = 'snacks', mod = snacks },
  }
  for _, integration in ipairs(integrations) do
    local integ_config = config.integrations
      and config.integrations[integration.name]
    local enabled = integ_config == true
      or (type(integ_config) == 'table' and integ_config.enabled ~= false)
    if enabled then
      groups = vim.tbl_extend('force', groups, integration.mod.highlights())
    end
  end

  return groups
end

local function apply_groups(groups)
  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

local function set_groups()
  local use_cache = not cache.should_skip(config)
  local groups
  local key

  if use_cache then
    key = cache.get_key(config)
    groups = cache.load(key)
  end

  if not groups then
    groups = compute_groups()
    if use_cache then
      cache.save(key or cache.get_key(config), groups)
    end
  end

  -- overrides (always applied, even with cache)
  groups = vim.tbl_extend(
    'force',
    groups,
    type(config.overrides) == 'function' and config.overrides()
      or config.overrides
  )

  -- on_highlights callback (always applied)
  if config.on_highlights then
    config.on_highlights(groups, colorscheme)
  end

  apply_groups(groups)
  return true
end

function theme.setup(values)
  local merged = deep_copy(config.defaults)
  merged = deep_merge(merged, values or {})

  -- normalize italics -> styles (single source of truth)
  if merged.italics then
    for _, k in ipairs {
      'comments',
      'keywords',
      'functions',
      'strings',
      'variables',
    } do
      if merged.italics[k] ~= nil then
        merged.styles[k] = merged.styles[k] or {}
        if merged.styles[k].italic == nil then
          merged.styles[k].italic = merged.italics[k]
        end
        merged.italics[k] = nil
      end
    end
    -- remove italics table if empty
    if not next(merged.italics) then
      merged.italics = nil
    end
  end

  setmetatable(config, { __index = merged })

  -- register cache clear command (once)
  if vim.fn.exists ':VitesseCacheClear' == 0 then
    vim.api.nvim_create_user_command('VitesseCacheClear', function()
      cache.clear()
      vim.notify(
        'vitesse cache cleared',
        vim.log.levels.INFO,
        { title = 'vitesse' }
      )
    end, { desc = 'Clear vitesse colorscheme cache' })
  end

  colorscheme.refresh()

  theme.bufferline = { highlights = {} }
  theme.bufferline.highlights = bufferline.highlights(config)
end

function theme.colorscheme()
  local v = vim.version()
  if v.major == 0 and v.minor < 8 then
    vim.notify(
      'Neovim 0.8+ is required for vitesse colorscheme',
      vim.log.levels.ERROR,
      { title = 'vitesse' }
    )
    return false
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

  return set_groups()
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
