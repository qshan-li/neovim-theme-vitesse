local M = {}

local cache_dir = vim.fn.stdpath 'data' .. '/vitesse'

function M.get_path()
  return cache_dir
end

function M.get_key(config)
  local parts = {
    config.theme or 'auto',
    tostring(config.transparent),
    tostring(config.dim_inactive),
    tostring(config.no_italic),
    tostring(config.no_bold),
    tostring(config.no_underline),
    tostring(config.no_undercurl),
  }
  -- include italics sub-keys
  if config.italics then
    for _, k in ipairs {
      'comments',
      'keywords',
      'functions',
      'strings',
      'variables',
    } do
      table.insert(parts, tostring(config.italics[k]))
    end
  end
  -- include styles sub-keys
  local style_keys = {
    'comments',
    'keywords',
    'functions',
    'strings',
    'variables',
    'numbers',
    'booleans',
    'types',
    'operators',
    'properties',
  }
  if config.styles then
    for _, k in ipairs(style_keys) do
      local s = config.styles[k]
      if s then
        table.insert(
          parts,
          k .. ':' .. tostring(s.italic) .. ':' .. tostring(s.bold)
        )
      end
    end
  end
  -- include integrations
  if config.integrations then
    local int_keys = {}
    for k in pairs(config.integrations) do
      table.insert(int_keys, k)
    end
    table.sort(int_keys)
    for _, k in ipairs(int_keys) do
      table.insert(
        parts,
        'int:' .. k .. ':' .. tostring(config.integrations[k])
      )
    end
  end
  local raw = table.concat(parts, '|')
  -- simple hash
  local hash = 0
  for i = 1, #raw do
    hash = (hash * 31 + string.byte(raw, i)) % 0x100000000
  end
  return string.format('%08x', hash)
end

function M.should_skip(config)
  if config.on_colors then
    return true
  end
  if config.on_highlights then
    return true
  end
  if type(config.overrides) == 'function' then
    return true
  end
  if type(config.overrides) == 'table' and next(config.overrides) then
    return true
  end
  return false
end

function M.load(key)
  local path = cache_dir .. '/' .. key .. '.lua'
  local ok, result = pcall(dofile, path)
  if ok and type(result) == 'table' then
    return result
  end
  return nil
end

function M.save(key, groups)
  vim.fn.mkdir(cache_dir, 'p')
  local path = cache_dir .. '/' .. key .. '.lua'
  local lines = { 'return {' }
  for group, params in pairs(groups) do
    local parts = {}
    for k, v in pairs(params) do
      if type(v) == 'string' then
        table.insert(parts, k .. ' = ' .. string.format('%q', v))
      elseif type(v) == 'boolean' then
        table.insert(parts, k .. ' = ' .. tostring(v))
      elseif type(v) == 'number' then
        table.insert(parts, k .. ' = ' .. tostring(v))
      end
    end
    local key_str = string.match(group, '^@')
        and ('[' .. string.format('%q', group) .. ']')
      or string.format('%q', group)
    table.insert(
      lines,
      '  ' .. key_str .. ' = {' .. table.concat(parts, ', ') .. '},'
    )
  end
  table.insert(lines, '}')
  local file = io.open(path, 'w')
  if file then
    file:write(table.concat(lines, '\n'))
    file:close()
  end
end

function M.clear()
  local files = vim.fn.glob(cache_dir .. '/*.lua', false, true)
  for _, f in ipairs(files) do
    os.remove(f)
  end
end

return M
