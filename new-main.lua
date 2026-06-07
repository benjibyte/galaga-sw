-- Project: Galaga Star Wars
-- Author: benjibyte
-- Project start: May 26th, 2026
-- Project end:
local controls = require("controls")
local enemies = require("enemies")
local config = require("config")
local window = require("gameWindow")

-- upload all game assets into memory/runtime
function love.load()
	-- Load Window
	-- Load Sounds
	-- Load Enemies
	
	collectgarbage("count")
	print("jit: ", jit and jit.version or "no jit")
end

-- draw assets to the screen
function love.draw()
	
end
