for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	if v.Name == "superegglauncher" then
		print("HE JOINED")
		v.Character.Humanoid.WalkSpeed = 16
	end
end