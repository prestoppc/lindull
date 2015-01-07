--[[
Iniciando scripts com base nas video aulas de Leadwerks com Lua
--]]
Script.name = "" -- string
Script.alive = false --bool
Script.mood = "Happy, Sad, Angry, Hungry, Normal" --choice
Script.monster = "Zombie, Skeleton, Mummy, Ghost, Ghoul, Lich, Golem" --choiceedit
Script.house = "Lin'Dul, Ordos, Harkonen, Shosuro, Loksley" --choiceedit
otherEntity = "" --entity

function Script:Start()

	if self.alive == false then
		self.entity:Hide()
	end

end


