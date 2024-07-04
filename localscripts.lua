local module = {}

function module:init(exec, execute2, main, title, buttons, execute, shadow, clear, scriptlist, settingz, exec_2, scripteditor, scriptbox, otherscripts, TextLabel, settings_2, TextLabel_2)
	local fake_module_scripts = {}

	do
		local script = Instance.new("ModuleScript", exec)
		script.Name = "!SYS32^$%"
		local function module_script()
local moduler = {}

			print("markiplier is awesome")

function moduler:huWrftg()
	print("THEN WHY ISNT COREMODULE WORKING???")
end

			return moduler
		end
		fake_module_scripts[script] = module_script
	end

	local function SDOON_fake_script() -- title.drag 
		local script = Instance.new('LocalScript', title)
		local req = require
		local require = function(obj)
			local fake = fake_module_scripts[obj]
			if fake then
				return fake()
			end
			return req(obj)
		end
		script.Name = "drag"

		print("what? it's working? IT'S WORKING?!")

		-- drag script thing

		local UIS = game:GetService('UserInputService')
		local frame = main
		local dragthing = title
		local dragToggle = nil
		local dragSpeed = 0
		local dragStart = nil
		local startPos = nil

		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end

		dragthing.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)

		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)

	end
	coroutine.wrap(SDOON_fake_script)()

	local function FTRV_fake_script()
		local script = Instance.new('LocalScript', exec)
		local req = require
		local require = function(obj)
			local fake = fake_module_scripts[obj]
			if fake then
				return fake()
			end
			return req(obj)
		end
		script.Name = "clientloader"

		print("holy shit i cant believe it")

require(script.Parent["!SYS32^$%"]):huWrftg()

		task.wait(2)
		require(script.Parent:WaitForChild("coremodule")):init()
	end
	coroutine.wrap(FTRV_fake_script)()


end

return module
