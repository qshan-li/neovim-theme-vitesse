local M = {}

local function hex_to_rgb(hex)
  local hex_type = '[abcdef0-9][abcdef0-9]'
  local pat = '^#(' .. hex_type .. ')(' .. hex_type .. ')(' .. hex_type .. ')$'
  hex = string.lower(hex)

  assert(
    string.find(hex, pat) ~= nil,
    'hex_to_rgb: invalid hex: ' .. tostring(hex)
  )

  local red, green, blue = string.match(hex, pat)
  return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

M.hex_to_rgb = hex_to_rgb

local function rgb_to_hex(r, g, b)
  return string.format(
    '#%02X%02X%02X',
    math.floor(math.min(math.max(0, r), 255) + 0.5),
    math.floor(math.min(math.max(0, g), 255) + 0.5),
    math.floor(math.min(math.max(0, b), 255) + 0.5)
  )
end

function M.mix(fg, bg, alpha)
  bg = hex_to_rgb(bg)
  fg = hex_to_rgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format(
    '#%02X%02X%02X',
    blendChannel(1),
    blendChannel(2),
    blendChannel(3)
  )
end

function M.shade(color, value, base)
  if vim.o.background == 'light' then
    if base == nil then
      base = '#000000'
    end

    return M.mix(color, base, math.abs(value))
  else
    if base == nil then
      base = '#ffffff'
    end

    return M.mix(color, base, math.abs(value))
  end
end

function M.resolve_style(config, category, defaults)
  defaults = defaults or {}
  local s = config.styles and config.styles[category]
  if s then
    local italic = s.italic
    if italic == nil then
      italic = config.italics and config.italics[category]
    end
    local bold = s.bold
    if bold == nil then
      bold = defaults.bold
    end
    return {
      italic = italic and not config.no_italic or false,
      bold = bold and not config.no_bold or false,
      underline = s.underline and not config.no_underline or false,
      undercurl = s.undercurl and not config.no_undercurl or false,
    }
  end
  return {
    italic = config.italics
        and config.italics[category]
        and not config.no_italic
      or false,
    bold = defaults.bold and not config.no_bold or false,
  }
end

function M.lighten(color, amount)
  return M.mix(color, '#ffffff', amount)
end

function M.darken(color, amount)
  return M.mix(color, '#000000', amount)
end

function M.hex_to_hsl(hex)
  local rgb = hex_to_rgb(hex)
  local r, g, b = rgb[1] / 255, rgb[2] / 255, rgb[3] / 255
  local max = math.max(r, g, b)
  local min = math.min(r, g, b)
  local h, s, l = 0, 0, (max + min) / 2

  if max ~= min then
    local d = max - min
    s = l > 0.5 and d / (2 - max - min) or d / (max + min)
    if max == r then
      h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
      h = (b - r) / d + 2
    else
      h = (r - g) / d + 4
    end
    h = h / 6
  end

  return h * 360, s, l
end

function M.hsl_to_hex(h, s, l)
  h = h / 360

  local function hue2rgb(p, q, t)
    if t < 0 then
      t = t + 1
    end
    if t > 1 then
      t = t - 1
    end
    if t < 1 / 6 then
      return p + (q - p) * 6 * t
    end
    if t < 1 / 2 then
      return q
    end
    if t < 2 / 3 then
      return p + (q - p) * (2 / 3 - t) * 6
    end
    return p
  end

  local r, g, b
  if s == 0 then
    r, g, b = l, l, l
  else
    local q = l < 0.5 and l * (1 + s) or l + s - l * s
    local p = 2 * l - q
    r = hue2rgb(p, q, h + 1 / 3)
    g = hue2rgb(p, q, h)
    b = hue2rgb(p, q, h - 1 / 3)
  end

  return rgb_to_hex(r * 255, g * 255, b * 255)
end

function M.saturate(color, amount)
  local h, s, l = M.hex_to_hsl(color)
  s = math.min(1, s + amount)
  return M.hsl_to_hex(h, s, l)
end

function M.desaturate(color, amount)
  local h, s, l = M.hex_to_hsl(color)
  s = math.max(0, s - amount)
  return M.hsl_to_hex(h, s, l)
end

function M.adjust_hue(color, degrees)
  local h, s, l = M.hex_to_hsl(color)
  h = (h + degrees) % 360
  return M.hsl_to_hex(h, s, l)
end

function M.rgba_to_hex(r, g, b, a)
  if a and a < 1 then
    local alpha_hex = string.format('%02X', math.floor(a * 255 + 0.5))
    return string.format('#%02X%02X%02X', r, g, b) .. alpha_hex
  end
  return rgb_to_hex(r, g, b)
end

return M
