local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gameproccessed)
	if gameproccessed then return end --!!1!11!1!!
	
	if input.KeyCode == Enum.KeyCode.Q then
		if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("exec") then
			game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("exec"):Destroy()
			task.wait(1)
		else
			game:GetService("ReplicatedStorage"):FindFirstChild("givegui"):FireServer()
			task.wait(1)
		end
	end
end)