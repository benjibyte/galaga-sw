local gameWindow = {}

function gameWindow.setupWindow()
	local windowScale = 3
	local windowW = 240 * windowScale
	local windowH = 320 * windowScale
	local tileSize = 16
	
	love.window.setMode(windowW, windowH, flags)
	love.window.setTitle("Galaga - Star Wars")
	-- Line 12 makes sure both X and Y scaling of Pixel Art is nice and sharp
	love.graphics.setDefaultFilter("nearest", "nearest")
end

function gameWindow.drawWindow(scaledX, scaledY)
	love.graphics.scale(scaledX, scaledY)
end

function gameWindow.setupWindow()
	local windowScale = 3
	local windowW = 240 * windowScale
	local windowH = 320 * windowScale
	local tileSize = 16
	
	love.window.setMode(windowW, windowH, flags)
	love.window.setTitle("Galaga - Star Wars")
	-- Line 12 makes sure both X and Y scaling of Pixel Art is nice and sharp
	love.graphics.setDefaultFilter("nearest", "nearest")
end

function gameWindow.drawWindow(scaledX, scaledY)
	love.graphics.scale(scaledX, scaledY)
end 


return gameWindow
