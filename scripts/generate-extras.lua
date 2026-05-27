-- Run with: nvim --headless -l scripts/generate-extras.lua
package.path = './lua/?.lua;' .. package.path

local extras = require 'vitesse.extras'
extras.generate_all()
print 'Done generating extras.'
