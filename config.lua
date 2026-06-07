local config = {}

function config.setupWindow()
	local windowScale = 3
	local windowW = 240 * windowScale
	local windowH = 320 * windowScale
	local tileSize = 16
	
	love.window.setMode(windowW, windowH, flags)
	love.window.setTitle("Galaga - Star Wars")
	-- Line 12 makes sure both X and Y scaling of Pixel Art is nice and sharp
	love.graphics.setDefaultFilter("nearest", "nearest")
end

function config.loadSprites()
	local spritesTable = {}
	
	local playerSprite = love.graphics.newImage("assets/img/player-ship.png")
	table.insert(spritesTable, playerSprite)
	local playerBullet = love.graphics.newImage("assets/img/player-bullet.png")
	table.insert(spritesTable, playerBullet)
	local backgroundSprite = love.graphics.newImage("assets/img/space-background.png")
	table.insert(spritesTable, backgroundSprite)
	local enemySprite = love.graphics.newImage("assets/img/enemy-ship.png")
	table.insert(spritesTable, enemySprite)
	
	return spritesTable
end

function config.loadSounds()
	local soundsTable = {}
	
	local playerFire = love.audio.newSource("assets/sound/lazer.ogg", "static")
	table.insert(soundsTable, playerFire)
	
	return soundsTable
end

return config
