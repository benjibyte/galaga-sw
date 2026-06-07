-- Enemies


-- Create Enemy waves
function enemies:createWave(waveSize, enemySprite, enemyTable)
	local wave = {}
	for i = 0, waveSize do
		newEnemy = { sprite = enemySprite, x = enemyX, y = enemyY, hit = false }
		table.insert(wave, newEnemy)
	end
	table.insert(enemyTable, wave)
	return enemyTable
end

-- Move an enemy
function enemies:move(enemyTable, enemyIndex, enemySpeed)
	if #enemyTable > 0 then
		for currentIndex, enemy in ipairs(enemyTable) do
			if currentIndex == enemyIndex then
				enemy.y = enemy.y + enemySpeed
			end
		end
	end
end

