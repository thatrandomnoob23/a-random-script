print("the beginning")

local module = {}

print("module variable")

function module:init(exec, execute2, main, title, buttons, execute, shadow, clear, scriptlist, settingz, exec_2, scripteditor, scriptbox, otherscripts, TextLabel, settings_2, TextLabel_2)
	print("someone called init on localscripts")

	print("fakemodule variable")
	local function FNCGF_fake_script() --coremodule
		local script = Instance.new("ModuleScript")
		script.Name = "coremodule"
		script.Parent = exec
		local handler = {}

		handler.buttons = {
			execute = script.Parent:WaitForChild("main").buttons:FindFirstChild("execute");
			clear = script.Parent:WaitForChild("main").buttons:FindFirstChild("clear");
			scripts = script.Parent:WaitForChild("main").buttons:FindFirstChild("scriptlist");
			settings = script.Parent:WaitForChild("main").buttons:FindFirstChild("settings");
		}

		handler.menus = {
			main = script.Parent:WaitForChild("main").exec;
			scripts = script.Parent:WaitForChild("main").otherscripts;
			settings = script.Parent:WaitForChild("main").settings;
		}

		handler.remotes = {
			execute = script.Parent:WaitForChild("execute")
		}

		handler.ratelimit = false -- if you execute code too fast it will rate limit you to calm down
		handler.ratelimitamount = 8
		handler.runspersecond = 0

		function handler:togglemenu(menu)
			if handler.menus[menu].Visible == true then
				for _,v in pairs(handler.menus) do
					v.Visible = false
				end

				handler.menus.main.Visible = true
			else
				for _,v in pairs(handler.menus) do
					v.Visible = false
				end

				handler.menus[menu].Visible = true
			end
		end

		function handler:clearscript()
			handler.menus.main.scripteditor.scriptbox.Text = ""
		end

		function handler:executescript(code)
			if handler.ratelimit == true then return end

			handler.remotes.execute:FireServer(code)
			handler.runspersecond += 1
		end

		function handler:ratecooldown()
			task.wait(6)
			handler.runspersecond = 0
			handler.ratelimit = false
		end

		function handler:init()
			while true do
				if handler.runspersecond >= handler.ratelimitamount and handler.ratelimit == false then
					handler.ratelimit = true
					handler:ratecooldown()
				elseif handler.runspersecond < handler.ratelimitamount and handler.ratelimit == false then
					handler.runspersecond = 0
				end
				task.wait(2)
			end
		end

		handler.buttons.execute.Activated:Connect(function()
			if handler.menus.main.scripteditor.scriptbox.Text ~= "" then
				handler:executescript(handler.menus.main.scripteditor.scriptbox.Text)
			end
		end)

		handler.buttons.clear.Activated:Connect(function()
			handler.menus.main.scripteditor.scriptbox.Text = ""
		end)

		handler.buttons.scripts.Activated:Connect(function()
			handler:togglemenu("scripts")
		end)

		handler.buttons.settings.Activated:Connect(function()
			handler:togglemenu("settings")
		end)
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
end

print("end")

return module
