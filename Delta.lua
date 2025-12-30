-- RayFieldロード
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

--================ 設定 =================
local speedEnabled, speedOn, originalWalkSpeed = false, 30, nil
local speedMin, speedMax = 0, 500
local jumpEnabled, jumpPowerValue, originalJumpPower = false, 50, nil
local jumpMin, jumpMax = 0, 700
local infiniteJumpEnabled = false
local noclipEnabled, noclipConnection = false, nil
local airTPActive, airTPForce, airTPOriginalCFrame = false, nil, nil
local airHeight = 2000
local freezeEnabled, freezeConnection, freezeCFrame = false, nil, nil
local flyActive, flySpeed = false, 50
local flyKeys = {W=false,A=false,S=false,D=false,Space=false,LeftShift=false}

-- X-Ray / FullBright
local XRayPlayersEnabled, XRayWorldEnabled, XRayTransparency = false, false, 0.6
local originalLocalTransparency = {}
local FullBrightEnabled = false
local FB_Original = {Brightness=Lighting.Brightness, ClockTime=Lighting.ClockTime, Ambient=Lighting.Ambient, OutdoorAmbient=Lighting.OutdoorAmbient}

--================ Helper =================
local function getCharacter()
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
	return char, humanoid, root
end

--================ 壁貫通 =================
local function enableNoclip()
	if noclipConnection then return end
	noclipEnabled = true
	noclipConnection = RunService.Stepped:Connect(function()
		if not noclipEnabled then return end
		local char = player.Character
		if char then
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = false end
			end
		end
	end)
end

local function disableNoclip()
	noclipEnabled = false
	if noclipConnection then noclipConnection:Disconnect(); noclipConnection=nil end
	local char = player.Character
	if not char then return end
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then part.CanCollide=true end
	end
	local hum = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")
	if root then root.Velocity=Vector3.zero; root.AssemblyLinearVelocity=Vector3.zero end
	if hum then hum:ChangeState(Enum.HumanoidStateType.GettingUp) end
end

--================ X-Ray / FullBright =================
local function ApplyFullBright()
	Lighting.Brightness=2; Lighting.ClockTime=12
	Lighting.Ambient=Color3.new(1,1,1); Lighting.OutdoorAmbient=Color3.new(1,1,1)
end
local function RestoreFullBright()
	if FB_Original then
		Lighting.Brightness=FB_Original.Brightness
		Lighting.ClockTime=FB_Original.ClockTime
		Lighting.Ambient=FB_Original.Ambient
		Lighting.OutdoorAmbient=FB_Original.OutdoorAmbient
	end
end
local function SetCharacterXray(char,val)
	if not char then return end
	for _, obj in ipairs(char:GetDescendants()) do
		if obj:IsA("BasePart") then obj.LocalTransparencyModifier=val end
	end
end
local function SetWorldXray(val)
	if val==0 then
		for part, old in pairs(originalLocalTransparency) do
			if part and part:IsA("BasePart") then pcall(function() part.LocalTransparencyModifier=old end) end
		end
		originalLocalTransparency = {}
		return
	end
	for _, part in ipairs(workspace:GetDescendants()) do
		if part:IsA("BasePart") and part~=workspace.Terrain then
			if part.CanCollide and part.Transparency<1 then
				if originalLocalTransparency[part]==nil then originalLocalTransparency[part]=part.LocalTransparencyModifier or 0 end
				pcall(function() part.LocalTransparencyModifier=XRayTransparency end)
			end
		end
	end
end

task.spawn(function()
	while true do
		if XRayPlayersEnabled then
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr~=player then SetCharacterXray(plr.Character,XRayTransparency) end
			end
		else
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr~=player and plr.Character then SetCharacterXray(plr.Character,0) end
			end
		end
		task.wait(0.25)
	end
end)

task.spawn(function()
	while true do
		if XRayWorldEnabled then SetWorldXray(XRayTransparency)
		else SetWorldXray(0) end
		task.wait(0.5)
	end
end)

task.spawn(function()
	while true do
		if FullBrightEnabled then ApplyFullBright() end
		task.wait(0.1)
	end
end)

local function ToggleXRayPlayers() XRayPlayersEnabled=not XRayPlayersEnabled end
local function ToggleXRayWorld() XRayWorldEnabled=not XRayWorldEnabled end
local function ToggleFullBright() FullBrightEnabled=not FullBrightEnabled; if not FullBrightEnabled then RestoreFullBright() end end
local function CleanupVisuals() XRayPlayersEnabled=false; XRayWorldEnabled=false; FullBrightEnabled=false; SetWorldXray(0); for _, plr in ipairs(Players:GetPlayers()) do if plr.Character then SetCharacterXray(plr.Character,0) end end; RestoreFullBright() end

--================ RayField GUI =================
local Window = Rayfield:CreateWindow({Name="Furo Hub", LoadingTitle="Loading now", LoadingSubtitle="Editting by Furopper", ConfigurationSaving={Enabled=true,FolderName="UtilityHubConfigs",FileName="Config"},Discord={Enabled=false},KeySystem=false})
local playerTab = Window:CreateTab("プレイヤー",4483362458)

-- スピード
playerTab:CreateToggle({Name="スピード",CurrentValue=false,Flag="SpeedToggle",Callback=function(val)
	speedEnabled=val
	local _, hum = getCharacter()
	if hum then if val then if not originalWalkSpeed then originalWalkSpeed=hum.WalkSpeed end else if originalWalkSpeed then hum.WalkSpeed=originalWalkSpeed end end end
end})
playerTab:CreateSlider({Name="スピード調節",Range={speedMin,speedMax},Increment=1,Suffix="WalkSpeed",CurrentValue=speedOn,Flag="SpeedOnSlider",Callback=function(val) speedOn=val end})

-- 跳躍力
playerTab:CreateToggle({Name="跳躍力",CurrentValue=false,Flag="JumpPowerToggle",Callback=function(val)
	jumpEnabled=val
	local _, hum = getCharacter()
	if hum then if val then if not originalJumpPower then originalJumpPower=hum.JumpPower end; hum.JumpPower=jumpPowerValue else if originalJumpPower then hum.JumpPower=originalJumpPower end end
end})
playerTab:CreateSlider({Name="跳躍力調節",Range={jumpMin,jumpMax},Increment=5,Suffix="Power",CurrentValue=jumpPowerValue,Flag="JumpPowerSlider",Callback=function(val) jumpPowerValue=val; local _, hum=getCharacter(); if hum and jumpEnabled then hum.JumpPower=jumpPowerValue end end})

-- 無限ジャンプ
playerTab:CreateToggle({Name="無限ジャンプ",CurrentValue=false,Flag="InfiniteJump",Callback=function(val) infiniteJumpEnabled=val end})

-- 壁貫通
playerTab:CreateToggle({Name="壁貫通",CurrentValue=false,Flag="WallClip",Callback=function(val)
	noclipEnabled=val
	if val then enableNoclip() else disableNoclip() end
end})

-- 空中TP
playerTab:CreateButton({Name="空中TP",Callback=function()
	local char, hum, root = getCharacter()
	if not char or not hum or not root then return end
	if not airTPActive then
		airTPOriginalCFrame=root.CFrame
		hum:ChangeState(Enum.HumanoidStateType.Physics)
		RunService.Stepped:Wait()
		root.CFrame=airTPOriginalCFrame+Vector3.new(0,airHeight,0)
		airTPForce=Instance.new("BodyVelocity")
		airTPForce.MaxForce=Vector3.new(0,math.huge,0)
		airTPForce.Velocity=Vector3.new(0,0,0)
		airTPForce.Parent=root
		hum:ChangeState(Enum.HumanoidStateType.Freefall)
		airTPActive=true
	else
		if airTPForce then airTPForce:Destroy(); airTPForce=nil end
		if airTPOriginalCFrame then
			hum:ChangeState(Enum.HumanoidStateType.Physics)
			RunService.Stepped:Wait()
			root.CFrame=airTPOriginalCFrame
			hum:ChangeState(Enum.HumanoidStateType.GettingUp)
		end
		airTPActive=false
	end
end})

-- Freeze
playerTab:CreateToggle({Name="位置固定",CurrentValue=false,Flag="FreezeToggle",Callback=function(state)
	freezeEnabled=state
	local char=player.Character
	if not char then return end
	local hrp=char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	if freezeEnabled then
		freezeCFrame=hrp.CFrame
		freezeConnection=RunService.RenderStepped:Connect(function() pcall(function() hrp.CFrame=freezeCFrame end) end)
	else
		if freezeConnection then freezeConnection:Disconnect(); freezeConnection=nil end
	end
end})

-- Fly
playerTab:CreateToggle({Name="Fly",CurrentValue=false,Flag="FlyToggle",Callback=function(state) flyActive=state end})
playerTab:CreateSlider({Name="Fly速度",Range={10,2000},Increment=5,CurrentValue=flySpeed,Flag="FlySpeedSlider",Callback=function(val) flySpeed=val end})

-- Flyキー入力
UserInputService.InputBegan:Connect(function(input,gpe) if gpe then return end; if input.UserInputType==Enum.UserInputType.Keyboard and flyKeys[input.KeyCode.Name]~=nil then flyKeys[input.KeyCode.Name]=true end end)
UserInputService.InputEnded:Connect(function(input,gpe) if gpe then return end; if input.UserInputType==Enum.UserInputType.Keyboard and flyKeys[input.KeyCode.Name]~=nil then flyKeys[input.KeyCode.Name]=false end end)

-- 足場管理
local createdPlatforms={}
playerTab:CreateButton({Name="足場生成",Callback=function()
	local _,_,root=getCharacter(); if not root then return end
	local platform=Instance.new("Part")
	platform.Size=Vector3.new(6,1,6); platform.Anchored=true; platform.CanCollide=true
	platform.Color=Color3.fromRGB(255,200,0); platform.Material=Enum.Material.Neon
	platform.CFrame=CFrame.new(root.Position+Vector3.new(0,-3,0))
	platform.Parent=workspace; table.insert(createdPlatforms,platform)
end})
playerTab:CreateButton({Name="足場削除",Callback=function() for _,p in ipairs(createdPlatforms) do if p and p.Parent then p:Destroy() end end; createdPlatforms={} end})

-- Teleport保存
local savedCFrame=nil
local tab = Window:CreateTab("Teleport",4483362458)
tab:CreateButton({Name="位置記録を記録",Callback=function()
	local char=player.Character
	local hrp=char and char:FindFirstChild("HumanoidRootPart")
	if hrp then savedCFrame=hrp.CFrame; Rayfield:Notify({Title="位置記録",Content="現在位置を保存したよ！（前のデータは削除）",Duration=2}) else Rayfield:Notify({Title="エラー",Content="キャラが見つからないよ！",Duration=2}) end
end})
tab:CreateButton({Name="記録位置にTP",Callback=function()
	local char=player.Character
	local hrp=char and char:FindFirstChild("HumanoidRootPart")
	if savedCFrame and hrp then hrp.CFrame=savedCFrame; Rayfield:Notify({Title="テレポート",Content="保存した場所へTPしたよ！",Duration=2}) else Rayfield:Notify({Title="エラー",Content="保存された位置がないよ！",Duration=2}) end
end})

--================ 内部処理 =================
RunService.RenderStepped:Connect(function(dt)
	local _, hum = getCharacter()
	if hum and speedEnabled then hum.WalkSpeed=speedOn end

	-- Fly処理
	if flyActive and hum then
		local _, _, root = getCharacter()
		if not root then return end
		root.AssemblyLinearVelocity=Vector3.zero
		root.AssemblyAngularVelocity=Vector3.zero
		local cam=workspace.CurrentCamera
		local move=Vector3.zero
		if flyKeys.W then move+=cam.CFrame.LookVector end
		if flyKeys.S then move-=cam.CFrame.LookVector end
		if flyKeys.A then move-=cam.CFrame.RightVector end
		if flyKeys.D then move+=cam.CFrame.RightVector end
		if flyKeys.Space then move+=Vector3.new(0,1,0) end
		if flyKeys.LeftShift then move-=Vector3.new(0,1,0) end
		if move.Magnitude>0 then root.CFrame=root.CFrame+(move.Unit*flySpeed*dt) end
	end

	-- Freeze処理
	if freezeEnabled then
		local char=player.Character
		local hrp=char and char:FindFirstChild("HumanoidRootPart")
		if hrp and freezeCFrame then hrp.CFrame=freezeCFrame end
	end
end)

UserInputService.JumpRequest:Connect(function()
	if infiniteJumpEnabled then
		local _, hum = getCharacter()
		if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
	end
end)

-- キャラ再生成時
player.CharacterAdded:Connect(function()
	task.wait(0.2)
	local _, hum = getCharacter()
	if hum then
		if jumpEnabled then hum.JumpPower=jumpPowerValue else if originalJumpPower then hum.JumpPower=originalJumpPower end end
		if speedEnabled and originalWalkSpeed then hum.WalkSpeed=speedOn end
	end
end)
