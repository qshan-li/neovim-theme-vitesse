# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- 14 new plugin integrations: lazy.nvim, mason.nvim, dashboard-nvim, oil.nvim, nvim-dap, mini.nvim, fidget.nvim, nvim-navic, vim-illuminate, hop.nvim/leap.nvim, copilot, aerial.nvim, snacks.nvim
- Integration code refactored: nvim-notify, render-markdown, indent-blankline, lspsaga now in separate integration files with toggle support
- LSP semantic token coverage: 15 new @lsp.type.*, 11 new @lsp.typemod.*, 3 new @lsp.mod.*, LspInfo highlights
- Global style switches: no_italic, no_bold, no_underline, no_undercurl
- `on_highlights` callback for post-processing highlight groups
- `dim_inactive` now accepts number (0.0-1.0) for custom dimming ratio
- `styles` config table for per-category style control
- Per-plugin sub-options (integrations can be tables with `enabled` key)
- Color utility functions: saturate, desaturate, adjust_hue, hex_to_hsl, hsl_to_hex, rgba_to_hex
- Exposed `hex_to_rgb` in utils module
- Treesitter query extensions for 12 languages: Python, Rust, Go, Lua, C, C++, Java, Ruby, PHP, Swift, Kotlin, Zig
- CI/CD: GitHub Actions workflow, selene config, basic test suite
- Issue and PR templates

### Changed
- Palette deduplication: dark/dark-soft and light/light-soft now share base color tables
- Compilation cache for faster subsequent loads

### Fixed
- Version check now validates major version
- `colorscheme()` returns success/failure status
