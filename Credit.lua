
task.spawn(function()
	local function GetGitSound(GithubSnd, SoundName)
		local url = GithubSnd
		if not isfile(SoundName .. ".mp3") then
			writefile(SoundName .. ".mp3", game:HttpGet(url))
		end
		local sound = Instance.new("Sound")
		sound.SoundId = (getcustomasset or getsynasset)(SoundName .. ".mp3")
		return sound
	end
	local Jumpscare = GetGitSound("https://github.com/eliazbp92-collab/Mayhem-mode/blob/main/scary_cool_entity_music.mp3?raw=true","Ost")
	Jumpscare.Parent = workspace
	Jumpscare.Volume = 3
	Jumpscare.PlaybackSpeed = 1
	Jumpscare:Play()

	wait(7.4)

	local TweenService = game:GetService("TweenService")
	local CoreGui = game:GetService("CoreGui")
	local UserInputService = game:GetService("UserInputService")

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "HardcoreReiginitedCredits"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local CanvasGroup = Instance.new("CanvasGroup")
	CanvasGroup.Size = UDim2.new(1, 0, 1, 0)
	CanvasGroup.BackgroundTransparency = 1
	CanvasGroup.GroupTransparency = 1 
	CanvasGroup.Parent = ScreenGui

	local targetTextSize = 45 
	if UserInputService.TouchEnabled then -- what are u looking?
		targetTextSize = 20 
	end

	local TextLabel = Instance.new("TextLabel")
	TextLabel.Size = UDim2.new(0.4, 0, 0.8, 0) 
	TextLabel.Position = UDim2.new(0.98, 0, 0.5, 0) 
	TextLabel.AnchorPoint = Vector2.new(1, 0.5) 
	TextLabel.BackgroundTransparency = 1
	TextLabel.Font = Enum.Font.Oswald
	TextLabel.TextSize = targetTextSize
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextXAlignment = Enum.TextXAlignment.Center 
	TextLabel.TextYAlignment = Enum.TextYAlignment.Center
	TextLabel.RichText = true

	TextLabel.Text = [[
<font color="rgb(0,0,255)">DOORS: Werid mode  </font><font color="rgb(255,255,255)">by Shurd124 (Epicyfaces</font>
<u><font color="rgb(255, 255, 255)">Credits to:</font></u>
<font color="rgb(255,255,255)">Shurd. </font><font color="rgb(255,0,0)">[owner]</font>
<font color="rgb(255,255,255)">Og hunger </font><font color="rgb(255,255,255)">[credit to him lol]</font>
<font color="rgb(255,255,255)">You! [For Playing! :D]</font>
]]

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Thickness = (targetTextSize > 40) and 4 or 2.5 
	UIStroke.Color = Color3.fromRGB(0, 0, 0)
	UIStroke.Transparency = 0.2
	UIStroke.Parent = TextLabel

	TextLabel.Parent = CanvasGroup

	if syn and syn.protect_gui then
		syn.protect_gui(ScreenGui)
		ScreenGui.Parent = CoreGui
	elseif gethui then
		ScreenGui.Parent = gethui()
	else
		ScreenGui.Parent = CoreGui
	end

	local faker = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local fakerthua = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

	local fakerwin = TweenService:Create(CanvasGroup, faker, {GroupTransparency = 0})
	local fakerthuavl = TweenService:Create(CanvasGroup, fakerthua, {GroupTransparency = 1})

	fakerwin:Play()
	fakerwin.Completed:Wait()

	task.wait(10)

	fakerthuavl:Play()
	fakerthuavl.Completed:Wait()

	-- Clean up
	ScreenGui:Destroy()

	local function Entity()

		local namesToCheck = {
			"Threat",
			"Obsession",
			"manic rush",
			"manic ambush"
		}

		for _, name in ipairs(namesToCheck) do
			if game.Workspace:WaitForChild(name, true) then
				return true
			end
		end

		for _, inst in ipairs(game.Workspace:GetDescendants()) do
			local n = string.lower(inst.Name)
			if string.find(n, "Obession") then
				return true
			end
		end

		return false
	end

	if Entity() then
		Jumpscare:Destroy()

		local a1 = ({
			"Who tf is joe mama?!?!",
			"Ty Chatgpt For music:D",
			"Me when meet every entity",
			"I am... your mom"
		})[math.random(4)]

		require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(a1, true)
	end


end)
