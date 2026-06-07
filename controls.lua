local controls = {} -- Export All the functions in this file to main.lua

local playerX = 125 -- spawn in the center and on the bottom of the screen, with (0,0) in the top left corner
local playerY = 280
local playerSpeed = 2
lazers = {}
lazerSpeed = 6

function controls:move(playerX, playerSpeed)
	if love.keyboard.isDown("right") then
		playerX = playerX + playerSpeed
	end
	if love.keyboard.isDown("left") then
		playerX = playerX - playerSpeed
	end

	return playerX
end

function controls:fire(keyPressed, firedFrom, projectilesTable)
	if key == "space" then
		-- add a new instance of the projectile to the projectiles table
		projectilePosition = { x = firedFrom.x, y = firedFrom.y }
		if #projectilesTable < 8 then
			table.insert(projectilesTable, projectilePosition)
		end
		return projectilesTable
	end
end

--function love.keypressed(key)
	-- fire lazer
	--if key == "space" then
		-- Only make lazer if Lazers table is empty. Recylcling old Lazers

		--new_lazer = { x = player_x, y = player_y }
		--table.insert(Lazers, new_lazer)
		--LazerFireSound:stop()
		--LazerFireSound:play()
--		print("Mem KB: ", collectgarbage("count"))
	--end
--end




return controls
