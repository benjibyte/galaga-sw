-- Project: Galaga Star Wars
-- Author: benjibyte
-- Project start: May 26th, 2026
-- Project end:
local controls = require("controls")
local enemies = require("enemies")


-- Load Game files, assets, and list Memory Usage
function love.load()
	-- Load Window
	-- Load Sounds
	-- Load enemies

	-- Print Memory footprint in Kilobytes
	print("Mem KB: ", collectgarbage("count"))
	print("jit: ", jit and jit.version or "no jit")
end


-- Create Game Frames
function love.draw()
	love.graphics.scale(WindowScale, WindowScale)

	-- Draw Scrolling Background
	love.graphics.draw(BackgroundSprite, 0, ScrollY - (WindowH / WindowScale))
	love.graphics.draw(BackgroundSprite, 0, ScrollY)
	if ScrollY > (WindowH / WindowScale) then
		ScrollY = 0
	end

	-- Drawing The Player Ship
	love.graphics.draw(ShipSprite, player_x, player_y)
	for index, lazer in ipairs(Lazers) do
		love.graphics.draw(ShipLazerSprite, lazer.x, lazer.y)
		if lazer.y < 0 then
			table.remove(Lazers, index)
		end
	end
	
	-- Draw Enemies
	for index, enemy in ipairs(Enemies) do
		if enemy.hit == false then
			love.graphics.draw(enemy.sprite, enemy.x, enemy.y)
		else
			table.remove(Enemies, index)
		end
	end
end


-- This is the game loop for updating values
function love.update(dt)
	-- Horizontal movement

	-- lazer fly upwards
	if #Lazers > 0 then
		for index, lazer in ipairs(Lazers) do
			lazer.y = lazer.y - LazerSpeed
			if lazer.y < 0 then
				table.remove(Lazers, index)
			end
		end
	end
end
