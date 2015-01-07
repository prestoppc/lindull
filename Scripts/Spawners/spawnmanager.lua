-- script com base na video aula lua #3
Script.spawnObject = "" --entity "Spawn Object"
Script.spawnTime = 1.5 
Script.Timer= 0

function Script:UpdateWorld()
	self.Timer = self.Timer * (Time:GetSpeed()/100)
		if(se.lf.Timer > self.spawnTime)then
			local newObject = self.spawnObject:Instance()
			newObject:SetPosition(self.entity:GetPosition())
			Timer = 0
		end
end
