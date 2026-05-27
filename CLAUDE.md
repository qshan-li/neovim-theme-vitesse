# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Pure Lua Neovim colorscheme plugin implementing the Vitesse palette (green/teal-accented). Four variants: `dark`, `dark-soft`, `light`, `light-soft`. No build step — Neovim loads the Lua files directly via `rtp`.

This is a Neovim port of [antfu/vscode-theme-vitesse](https://github.com/antfu/vscode-theme-vitesse).

## Development

No build, test, or lint commands beyond formatting. The dev environment uses direnv + Nix:

- Enter the project directory (direnv activates automatically)
- Open Neovim — the root `init.lua` bootstraps lazy.nvim and loads the theme for live testing
- Format Lua with **StyLua**: `stylua .` (config in `.stylua.toml`: 80-col, 2-space indent, single quotes)

## Architecture

**Entry point flow:** `colors/vitesse.lua` → `require("vitesse").colorscheme()` → clears highlights → resolves palette → applies colors → sets all highlight groups.

**Key modules:**

- `lua/vitesse/colorscheme.lua` — Singleton color store. Holds 4 palette tables (`dark`, `dark-soft`, `light`, `light-soft`), each with 30 semantic color keys (hex). `refresh()` resolves which palette to use and populates the module table. Some palette entries use 9-char hex (`#RRGGBBAA`) — `apply_palette()` alpha-blends these against the background via `utils.mix()` at load time. All other modules require this and read colors from it.

- `lua/vitesse/init.lua` — Main module. `theme.setup(values)` merges user config and calls `colorscheme.refresh()`. `theme.colorscheme()` is the `:colorscheme` entry point. Contains all base highlight groups in `set_groups()` (tree-sitter `@` captures, LSP semantic tokens, diagnostics, UI groups) plus plugin integrations (indent-blankline, nvim-notify, render-markdown, lspsaga).

- `lua/vitesse/config.lua` — Default config table with `setmetatable` for user value overlay. Keys: `theme`, `transparent`, `italics` (comments/keywords/strings/functions/variables), `overrides`.

- `lua/vitesse/utils.lua` — `mix(fg, bg, alpha)` for alpha blending, `shade(color, value, base)` for light/dark-aware shading.

- `lua/vitesse/integrations/` — Plugin-specific highlight tables for bufferline.nvim and nvim-cmp.

- `lua/lualine/themes/vitesse.lua` — Standalone lualine theme (discovered by path convention).

- `after/queries/` — Treesitter query extensions for Elixir, JavaScript, TypeScript.

**Color resolution:** `resolve_theme()` checks `config.theme` (`'auto'`/`'dark'`/`'dark-soft'`/`'light'`/`'light-soft'`), falls back to `vim.o.background`.

**User overrides:** `config.overrides` (table or function returning table) is merged last via `vim.tbl_extend('force', ...)`, allowing any highlight group to be overridden.

## Conventions

- All plugin code is Lua; treesitter queries are Scheme (`.scm`)
- Use single quotes for Lua strings (StyLua `AutoPreferSingle`)
- Tree-sitter highlight groups use bracket syntax: `['@variable'] = { ... }`
- Colors reference the `colorscheme` module singleton, never hardcoded hex values in highlight definitions
- New plugin integrations go in `lua/vitesse/integrations/` and are merged in `set_groups()` or exposed via `theme.bufferline`
