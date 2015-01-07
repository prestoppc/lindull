-- death trigger, script com base na video aula LUA #1
Script.respawnPoint = "" --entity "Respawn Point"

function Script:Collision(entity, position, normal, speed)
	if (entity:GetKeyValue("name") == "Player") then
		spawnPos = self.respawnPoint:GetPosition()
		entity:SetPosition(spawnPos)
	end
end
