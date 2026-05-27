# Vitesse Neovim Theme

A Neovim colorscheme port of [antfu/vscode-theme-vitesse](https://github.com/antfu/vscode-theme-vitesse), featuring a green/teal-accented palette with 4 variants.

## Features

- 4 theme variants: `dark`, `dark-soft`, `light`, `light-soft`
- 400+ highlight groups covering core Neovim UI, Treesitter, LSP semantic tokens, and diagnostics
- 24+ plugin integrations (telescope, gitsigns, neo-tree, nvim-cmp, which-key, trouble, noice, flash, nvim-notify, render-markdown, indent-blankline, lspsaga, lazy.nvim, mason.nvim, dashboard-nvim, oil.nvim, nvim-dap, mini.nvim, fidget.nvim, nvim-navic, vim-illuminate, hop/leap, copilot, aerial.nvim, snacks.nvim)
- Terminal colors (16 ANSI colors)
- Lualine theme
- Treesitter query extensions for 15 languages (C, C++, Elixir, Go, Java, JavaScript, Kotlin, Lua, PHP, Python, Ruby, Rust, Swift, TypeScript, Zig)

## Requirements

- Neovim 0.8+

## Installation

### lazy.nvim

```lua
{
  'vitesse/vitesse.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('vitesse').setup({
      -- optional config
    })
    vim.cmd.colorscheme 'vitesse'
  end,
}
```

### packer.nvim

```lua
use {
  'vitesse/vitesse.nvim',
  config = function()
    require('vitesse').setup({})
    vim.cmd.colorscheme 'vitesse'
  end,
}
```

## Configuration

All keys are optional. The following shows every available option with its default:

```lua
require('vitesse').setup({
  theme = 'auto',           -- 'auto' | 'dark' | 'dark-soft' | 'light' | 'light-soft'
  transparent = false,      -- enable transparent background
  dim_inactive = false,     -- dim inactive windows
  terminal_colors = true,   -- set terminal colors
  no_italic = false,        -- disable all italics
  no_bold = false,          -- disable all bold
  no_underline = false,     -- disable all underlines
  no_undercurl = false,     -- disable all undercurls

  italics = {               -- per-category italic control
    comments = true,
    keywords = true,
    functions = true,
    strings = true,
    variables = true,
    bufferline = false,
  },

  styles = {                -- per-category style control
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    types = {},
    operators = {},
    properties = {},
  },

  on_colors = nil,          -- function(colors) callback to modify palette
  on_highlights = nil,      -- function(highlights, colors) callback to modify highlights
  overrides = {},           -- table or function returning highlight overrides

  integrations = {          -- enable/disable integrations
    telescope = true,
    gitsigns = true,
    which_key = true,
    neo_tree = true,
    trouble = true,
    noice = true,
    flash = true,
    notify = true,
    render_markdown = true,
    indent_blankline = true,
    lspsaga = true,
    lazy = true,
    mason = true,
    dashboard = true,
    oil = true,
    dap = true,
    mini = true,
    fidget = true,
    navic = true,
    illuminate = true,
    hop = true,
    copilot = true,
    aerial = true,
    snacks = true,
  },
})
```

### Bufferline.nvim

To use the theme with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim):

```lua
require('bufferline').setup({
  highlights = require('vitesse').bufferline.highlights,
})
```

### Lualine

The lualine theme is auto-discovered by path convention. No extra configuration needed -- just set your lualine theme to `'vitesse'`.

## Palette

The theme uses 30 semantic color keys:

| Key | Description |
|-----|-------------|
| `editorBackground` | Main editor background |
| `sidebarBackground` | Sidebar background |
| `popupBackground` | Popup menu background |
| `floatingWindowBackground` | Floating window background |
| `menuOptionBackground` | Selected menu option background |
| `mainText` | Primary text color |
| `emphasisText` | Emphasized text |
| `commandText` | Command-line text |
| `inactiveText` | Inactive/dimmed text |
| `disabledText` | Disabled text |
| `lineNumberText` | Line numbers |
| `selectedText` | Selected text |
| `inactiveSelectionText` | Inactive selection |
| `windowBorder` | Window borders |
| `focusedBorder` | Focused window border |
| `emphasizedBorder` | Emphasized border |
| `syntaxFunction` | Functions (green) |
| `syntaxError` | Errors, constants (red) |
| `syntaxKeyword` | Keywords, types (teal) |
| `errorText` | Error text |
| `warningText` | Warning text |
| `linkText` | Links (teal) |
| `commentText` | Comments |
| `stringText` | Strings |
| `successText` | Success indicators |
| `warningEmphasis` | Warning emphasis (yellow) |
| `specialKeyword` | Special keywords (pink) |
| `syntaxOperator` | Operators, punctuation (gray) |
| `foregroundEmphasis` | Foreground emphasis |
| `terminalGray` | Terminal gray |
| `blue` | Blue accent |

Some palette entries use 9-character hex (`#RRGGBBAA`) and are alpha-blended against the background at load time.

## Integrations

**Built-in** (always active): bufferline.nvim, nvim-cmp

**Toggleable** via `config.integrations` (all enabled by default):

| Plugin | Key |
|--------|-----|
| telescope.nvim | `telescope` |
| gitsigns.nvim | `gitsigns` |
| which-key.nvim | `which_key` |
| neo-tree.nvim | `neo_tree` |
| trouble.nvim | `trouble` |
| noice.nvim | `noice` |
| flash.nvim | `flash` |
| nvim-notify | `notify` |
| render-markdown.nvim | `render_markdown` |
| indent-blankline.nvim | `indent_blankline` |
| lspsaga.nvim | `lspsaga` |
| lazy.nvim | `lazy` |
| mason.nvim | `mason` |
| dashboard-nvim | `dashboard` |
| oil.nvim | `oil` |
| nvim-dap | `dap` |
| mini.nvim | `mini` |
| fidget.nvim | `fidget` |
| nvim-navic | `navic` |
| vim-illuminate | `illuminate` |
| hop.nvim / leap.nvim | `hop` |
| copilot.vim | `copilot` |
| aerial.nvim | `aerial` |
| snacks.nvim | `snacks` |

## API

```lua
local theme = require('vitesse')

-- Setup configuration (call before colorscheme)
theme.setup({ ... })

-- Apply colorscheme
theme.colorscheme()

-- Get resolved palette colors
local colors = theme.get_colors()
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Format code with StyLua: `stylua .`
4. Test all 4 variants load without errors
5. Submit a pull request

The dev environment uses [direnv](https://direnv.net/) + Nix. Entering the project directory activates the shell automatically. The root `init.lua` bootstraps lazy.nvim and loads the theme for live testing.

## Acknowledgements

This project is a Neovim port of [antfu/vscode-theme-vitesse](https://github.com/antfu/vscode-theme-vitesse), a Visual Studio Code theme created by [Anthony Fu](https://github.com/antfu). The color palette and design language are derived from his original work.

## License

[MIT](LICENSE)
