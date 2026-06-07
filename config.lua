local config = {}

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
