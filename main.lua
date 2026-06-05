-- Project: Galaga Star Wars
-- Author: benjibyte
-- Project start: May 26th, 2026
-- Project end:

-- Variable Declaration
local player_x = 125 -- spawn in the center and on the bottom of the screen, with (0,0) in the top left corner
local player_y = 280
local player_speed = 2
Lazers = {}
LazerSpeed = 6

-- Enemies
EnemyCount = 10
Enemies = {}
enemy_renderX = 48
enemy_renderY = 100
EnemySpeed = 1
-- Game Window Variables
WindowScale = 3
ScrollY = 0 -- initial spot to render the background sprite Scaled to fit the window
ScrollPower = 3
WindowW, WindowH = 240 * WindowScale, 320 * WindowScale
TileSize = 16
-- 240, and 320, are the actual pixel art constraints that I have chosen
love.window.setMode(WindowW, WindowH, window_flags)

-- The love.load function runs once at bootup
function love.load()
	love.window.setTitle("Galaga - Star Wars")

	-- Set scaling filter to nearest
	love.graphics.setDefaultFilter("nearest", "nearest")
	-- Load Graphics
	ShipSprite = love.graphics.newImage("assets/img/galaga-player.png")
	ShipLazerSprite = love.graphics.newImage("assets/img/galaga-player-bullet.png")
	BackgroundSprite = love.graphics.newImage("assets/img/galaga-background.png")
	Enemy1Sprite = love.graphics.newImage("assets/img/galaga-enemy1.png")

	-- Load Sounds
	LazerFireSound = love.audio.newSource("assets/sound/lazer.ogg", "static")

	-- Load enemies
	new_wave(Enemies, EnemyCount)

	-- Print Memory footprint in Kilobytes
	print("Mem KB: ", collectgarbage("count"))
	print("jit: ", jit and jit.version or "no jit")
end

-- Enemey waves
function new_wave(enemy_table, wave_size)
	for i = 0, wave_size do
		new_enemy = { sprite = Enemy1Sprite, x = enemy_renderX, y = enemy_renderY, hit = false }
		table.insert(Enemies, new_enemy)
	end
	return enemy_table
end

-- Fire Lazers (create them and their /variables)
function love.keypressed(key)
	-- fire lazer
	if key == "space" then
		-- Only make lazer if Lazers table is empty. Recylcling old Lazers

		new_lazer = { x = player_x, y = player_y }
		table.insert(Lazers, new_lazer)
		LazerFireSound:stop()
		LazerFireSound:play()
		print("Mem KB: ", collectgarbage("count"))
	end
end
-- Render enemy



-- This is the game for drawing images to the screen
function love.draw()
	love.graphics.scale(WindowScale, WindowScale)

	love.graphics.draw(BackgroundSprite, 0, ScrollY - (WindowH / WindowScale))
	love.graphics.draw(BackgroundSprite, 0, ScrollY)
	-- reset scroll
	if ScrollY > (WindowH / WindowScale) then
		ScrollY = 0
	end

	-- The Player Ship
	love.graphics.draw(ShipSprite, player_x, player_y)
	for index, lazer in ipairs(Lazers) do
		love.graphics.draw(ShipLazerSprite, lazer.x, lazer.y)
		if lazer.y < 0 then
			table.remove(Lazers, index)
		end
	end
	
	-- Render Enemies
	for index, enemy in ipairs(Enemies) do
		if enemy.hit == false then
			love.graphics.draw(enemy.sprite, enemy.x, enemy.y)
		else
			table.remove(Enemies, index)
		end
		
		--enemy.x = enemy.x + TileSize
		if enemy == 5 then
			enemy.y = enemy.y - TileSize
			enemy.x = enemy.x - (TileSize * enemy)
		end
	end
end


-- This is the game loop for updating values
function love.update(dt)
	-- Horizontal movement
	if love.keyboard.isDown("right") then
		player_x = player_x + player_speed
	end
	if love.keyboard.isDown("left") then
		player_x = player_x - player_speed
	end

	-- speed up the background a little just for "game juice"
	if love.keyboard.isDown("up") then
		while ScrollPower < 5 do
			ScrollPower = ScrollPower + (ScrollPower / 3)
			EnemySpeed = EnemySpeed - (EnemySpeed / 3)
		end
	else
		while ScrollPower > 3 do
			ScrollPower = ScrollPower - 0.5
			EnemySpeed = EnemySpeed + 0.5
		end
	end

	-- lazer fly upwards
	if #Lazers > 0 then
		for index, lazer in ipairs(Lazers) do
			lazer.y = lazer.y - LazerSpeed
			if lazer.y < 0 then
				table.remove(Lazers, index)
			end
		end
	end
	
	if #Enemies > 0 then
		for index, enemy in ipairs(Enemies) do
			enemy.y = enemy.y + EnemySpeed
			
			-- collisions with lazers
			local enemy_box_y = enemy.y + TileSize
			local enemy_box_x = enemy.x + TileSize
			
			for lazer_index, lazer in ipairs(Lazers) do
				if (lazer.x > enemy.x and lazer.y > enemy.y) and (lazer.x < enemy_box_x and lazer.y < enemy_box_y) then
					enemy.hit = true
				end
			end
		end
	end

	-- Basic Background Movement
	ScrollY = ScrollY + ScrollPower
end
