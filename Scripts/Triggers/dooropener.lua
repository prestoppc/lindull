--script baseado video aula #5 
function Script:Collision(entity, position, normal, speed)
	if (entity:GetKeyValue("name") == "Player") then
		self.component:CallOutputs("Box Dropped") --[[esse box dropped é
		o nome do objeto que entra em contato. Talvez seja possivel 
		fazer com comparativo de peso, e assim ativar o "plate pressure"
		--]]
	end
end
