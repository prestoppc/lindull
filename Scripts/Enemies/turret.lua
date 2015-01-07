-- video aula lua #6&7

Script.player = "" --entity "Player"
Script.rotSpeed = 0.1 --float "Rotation Speed"
Script.fireRate = 1.0 --float "Fire Rate"
Script.fireRateTimer = 0
Script.muzzleFlashLight = "" --Entity "Muzzle Flash Light"
Script.muzzleTime = 0.1 --float "Muzzle Time"
Script.muzzleTimer = 0
Script.fireSoundPath = "" --path "Fire Sound" "Wav file(*wav):wav|Sound"
Script.fireSoundFile = nil

function Script:Start()
	self.muzzleFlashLight:Hide()
	
	if self.fireSoundPath ~= "" then
		self.fireSoundFile = Sound:Load(self.fireSoundPath)
	end
	
end

function Script:UpdateWorld()
	self.entity:Point(self.player, 2, Time:GetSpeed() * self.RotSpeed)
	self.fireRateTimer = self.fireRateTimer + (Time:GetSpeed()/100)
	self.muzzleTimer = self.muzzleTimer + (Time:GetSpeed()/100)
	
	if (self.fireRateTimer > self.fireRate) then
		self.muzzleFlashLight:Show()
		self.muzzleTimer = 0
		self.fireRateTimer = 0
		self.fireSoundFile:Play()
	end
	
	if (self.muzzleTimer > self.muzzleTime) then
		self.muzzleFlashLight:Hide()
	end

end
