local config = {
  defaults = {
    theme = 'auto',
    transparent = false,
    dim_inactive = false,
    terminal_colors = true,
    italics = {
      comments = true,
      keywords = true,
      functions = true,
      strings = true,
      variables = true,
      bufferline = false,
    },
    on_colors = nil,
    integrations = {
      telescope = true,
      gitsigns = true,
      which_key = true,
      neo_tree = true,
      trouble = true,
      noice = true,
      flash = true,
    },
    overrides = {},
  },
}

setmetatable(config, { __index = config.defaults })

return config
