local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local RequestHit = ReplicatedStorage:WaitForChild("CombatSystem")
    :WaitForChild("Remotes")
    :WaitForChild("RequestHit")

local enabled = false
local combo = 1
local currentCharacter = nil
local npcFolder = workspace:WaitForChild("NPCs")

--==================== GUI ====================--
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NearbyNPCAttackUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(1, -330, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(20,20,32)
frame.BorderSizePixel = 0
frame.Parent = screenGui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Nearby NPC Auto Attack"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(100,220,255)
title.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,0,0,25)
status.Position = UDim2.new(0,0,0,40)
status.BackgroundTransparency = 1
status.Text = "OFF"
status.TextScaled = true
status.Font = Enum.Font.Gotham
status.TextColor3 = Color3.fromRGB(255,100,100)
status.Parent = frame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0.9,0,0,60)
toggleBtn.Position = UDim2.new(0.05,0,0,75)
toggleBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
toggleBtn.Text = "OFF"
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.Parent = frame

Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0,10)

local close = Instance.new("TextButton")
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.TextScaled = true
close.Font = Enum.Font.GothamBold
close.BackgroundColor3 = Color3.fromRGB(170,50,50)
close.TextColor3 = Color3.new(1,1,1)
close.Parent = frame

Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)

--==================== DRAG ====================--
local dragging = false
local dragInput, startPos, startFramePos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		startPos = input.Position
		startFramePos = frame.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - startPos
		frame.Position = UDim2.new(
			startFramePos.X.Scale,
			startFramePos.X.Offset + delta.X,
			startFramePos.Y.Scale,
			startFramePos.Y.Offset + delta.Y
		)
	end
end)

--==================== CHARACTER ====================--
local function setupCharacter(char)
	currentCharacter = char
	char:WaitForChild("HumanoidRootPart",5)
end

player.CharacterAdded:Connect(setupCharacter)
if player.Character then
	setupCharacter(player.Character)
end

--==================== NPC SEARCH ====================--
local function getNearestNPC()
	if not currentCharacter then return nil end
	
	local myRoot = currentCharacter:FindFirstChild("HumanoidRootPart")
	if not myRoot then return nil end
	
	local nearest = nil
	local shortest = math.huge
	
	for _, npc in ipairs(npcFolder:GetChildren()) do
		if npc:IsA("Model") then
			local hum = npc:FindFirstChild("Humanoid")
			local root = npc:FindFirstChild("HumanoidRootPart")
			
			if hum and root and hum.Health > 0 then
				local dist = (myRoot.Position - root.Position).Magnitude
				
				if dist < shortest then
					shortest = dist
					nearest = root
				end
			end
		end
	end
	
	return nearest
end

--==================== TOGGLE ====================--
toggleBtn.MouseButton1Click:Connect(function()
	enabled = not enabled
	
	if enabled then
		toggleBtn.Text = "ON"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(50,200,50)
		status.Text = "Auto Attacking..."
		status.TextColor3 = Color3.fromRGB(50,255,100)
	else
		toggleBtn.Text = "OFF"
		toggleBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
		status.Text = "OFF"
		status.TextColor3 = Color3.fromRGB(255,100,100)
	end
end)

close.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

--==================== MAIN LOOP ====================--
task.spawn(function()
	while task.wait(0.08) do
		if enabled then
			local target = getNearestNPC()
			
			if target and target.Parent then
				pcall(function()
					RequestHit:FireServer(target.Position)
				end)
				
				combo = combo + 1
				if combo > 4 then
					combo = 1
				end
			end
		end
	end
end)

print("Nearby NPC Auto Attack Loaded")
