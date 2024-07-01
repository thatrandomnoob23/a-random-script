local initializer = {}

initializer.whitelist = {
	2454561387; --trn
	130030450; --eiae
	2591123755; --dor
}	

local req = require
	local require = function(obj)
		local fake = fake_module_scripts[obj]
		if fake then
			return fake()
		end
		return req(obj)
	end

local loadstring = require(4689019964)

initializer.start = function()
	local initclient = Instance.new("RemoteEvent")
	initclient.Name = "initclient"
	initclient.Parent = game:GetService("ReplicatedStorage")

	local UI = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/thatrandomnoob23/a-random-script/join/UI.lua", true))()
end

return initializer
