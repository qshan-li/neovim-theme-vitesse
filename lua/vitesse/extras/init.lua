local M = {}

local palette_keys = {
  'editorBackground',
  'mainText',
  'syntaxError',
  'successText',
  'warningEmphasis',
  'syntaxFunction',
  'syntaxKeyword',
  'linkText',
  'commentText',
  'inactiveText',
  'errorText',
  'stringText',
  'warningText',
  'syntaxOperator',
  'foregroundEmphasis',
  'blue',
}

local variants = { 'dark', 'dark-soft', 'light', 'light-soft' }

function M.get_palette(variant)
  -- load colorscheme fresh for each variant
  local config = require 'vitesse.config'
  setmetatable(config, { __index = config.defaults })
  config.theme = variant
  local colorscheme = require 'vitesse.colorscheme'
  colorscheme.refresh()
  local colors = {}
  for _, k in ipairs(palette_keys) do
    colors[k] = colorscheme[k]
  end
  return colors
end

function M.generate(name, template_fn)
  for _, variant in ipairs(variants) do
    local colors = M.get_palette(variant)
    local content = template_fn(colors, variant)
    local suffix = variant == 'dark' and '' or ('-' .. variant)
    local dir = 'extras/' .. name
    vim.fn.mkdir(dir, 'p')
    local path = dir .. '/' .. name .. suffix
    local file = io.open(path, 'w')
    if file then
      file:write(content)
      file:close()
      print('Generated: ' .. path)
    end
  end
end

function M.generate_all()
  local extras = {
    'alacritty',
    'kitty',
    'wezterm',
    'foot',
    'ghostty',
    'tmux',
    'fish',
    'starship',
    'fzf',
    'bat',
    'delta',
    'lazygit',
    'windows-terminal',
  }
  for _, name in ipairs(extras) do
    local ok, mod = pcall(require, 'vitesse.extras.' .. name)
    if ok and mod.template then
      M.generate(name, mod.template)
    else
      print('Skip: ' .. name .. ' (no template)')
    end
  end
end

return M
