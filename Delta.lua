-- RayFieldロード
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

--================ 設定 =================
local speedEnabled = false
local speedOn, speedOff = 30,30
local speedMin, speedMax = 0,500
local infiniteJumpEnabled = false
local wallClipEnabled = false
local airTPActive = false
local airHeight = 2000
local airTPOriginalCFrame = nil
local flyActive = false
local flySpeed = 50
local flyMoveVector = Vector3.new(0,0,0)

--================ Helper =================
local function getCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
    return char, hum, root
end

local function setWallClip(enable)
    local char = player.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not enable
        end
    end
end

--================ X-Ray & FullBright =================
local XRayPlayersEnabled, XRayWorldEnabled = false, false
local XRayTransparency = 0.6
local FullBrightEnabled = false
local originalLocalTransparency = {}
local FB_Original = {
	Brightness = Lighting.Brightness,
	ClockTime = Lighting.ClockTime,
	Ambient = Lighting.Ambient,
	OutdoorAmbient = Lighting.OutdoorAmbient
}

local function ApplyFullBright()
	Lighting.Brightness = 2
	Lighting.ClockTime = 12
	Lighting.Ambient = Color3.new(1,1,1)
	Lighting.OutdoorAmbient = Color3.new(1,1,1)
end

local function RestoreFullBright()
	if FB_Original then
		Lighting.Brightness = FB_Original.Brightness
		Lighting.ClockTime = FB_Original.ClockTime
		Lighting.Ambient = FB_Original.Ambient
		Lighting.OutdoorAmbient = FB_Original.OutdoorAmbient
	end
end

local function SetCharacterXray(character, value)
	if not character then return end
	for _, obj in ipairs(character:GetDescendants()) do
		if obj:IsA("BasePart") then
			obj.LocalTransparencyModifier = value
		end
	end
end

local function SetWorldXray(value)
	if value == 0 then
		for part, old in pairs(originalLocalTransparency) do
			if part and part:IsA("BasePart") then
				pcall(function() part.LocalTransparencyModifier = old end)
			end
		end
		originalLocalTransparency = {}
		return
	end
	for _, part in ipairs(Workspace:GetDescendants()) do
		if part:IsA("BasePart") and part ~= Workspace.Terrain then
			if part.CanCollide and part.Transparency < 1 then
				if originalLocalTransparency[part] == nil then
					originalLocalTransparency[part] = part.LocalTransparencyModifier or 0
				end
				pcall(function() part.LocalTransparencyModifier = XRayTransparency end)
			end
		end
	end
end

local function ToggleXRayPlayers() XRayPlayersEnabled = not XRayPlayersEnabled end
local function ToggleXRayWorld() XRayWorldEnabled = not XRayWorldEnabled end
local function ToggleFullBright()
	FullBrightEnabled = not FullBrightEnabled
	if not FullBrightEnabled then RestoreFullBright() end
end

--================ RayField GUI =================
local Window = Rayfield:CreateWindow({
    Name = "Utility Hub v5",
    LoadingTitle = "Utility Hub",
    LoadingSubtitle = "by Masashi",
    ConfigurationSaving = {Enabled=true, FolderName="UtilityHubConfigs", FileName="Config"},
    Discord={Enabled=false},
    KeySystem=false
})

--================ プレイヤータブ =================
local playerTab = Window:CreateTab("プレイヤー", 4483362458)

-- スピード
playerTab:CreateToggle({
    Name="Speed",
    CurrentValue=false,
    Flag="SpeedToggle",
    Callback=function(val) speedEnabled=val end
})
playerTab:CreateSlider({
    Name="Speed On",
    Range={speedMin,speedMax},
    Increment=1,
    Suffix="WalkSpeed",
    CurrentValue=speedOn,
    Flag="SpeedOnSlider",
    Callback=function(val) speedOn=val end
})
playerTab:CreateSlider({
    Name="Speed Off",
    Range={speedMin,speedMax},
    Increment=1,
    Suffix="WalkSpeed",
    CurrentValue=speedOff,
    Flag="SpeedOffSlider",
    Callback=function(val) speedOff=val end
})

-- 無限ジャンプ
playerTab:CreateToggle({
    Name="Infinite Jump",
    CurrentValue=false,
    Flag="InfiniteJump",
    Callback=function(val) infiniteJumpEnabled=val end
})

-- WallClip
playerTab:CreateToggle({
    Name="WallClip",
    CurrentValue=false,
    Flag="WallClip",
    Callback=function(val) wallClipEnabled=val end
})

-- AirTP
playerTab:CreateButton({
    Name="Air TP",
    Callback=function()
        local _,_,root=getCharacter()
        if not root then return end
        if not airTPActive then
            airTPOriginalCFrame = root.CFrame
            root.CFrame = root.CFrame + Vector3.new(0,airHeight,0)
            pcall(function() root.Anchored=true end)
            airTPActive=true
        else
            if airTPOriginalCFrame then root.CFrame=airTPOriginalCFrame end
            pcall(function() root.Anchored=false end)
            airTPActive=false
        end
    end
})

-- Fly ON/OFF
playerTab:CreateToggle({
    Name="Fly",
    CurrentValue=false,
    Flag="FlyToggle",
    Callback=function(state) flyActive=state end
})
playerTab:CreateSlider({
    Name="Fly速度",
    Range={10,200},
    Increment=5,
    CurrentValue=flySpeed,
    Flag="FlySpeedSlider",
    Callback=function(val) flySpeed=val end
})

--================ 内部処理 =================
-- スピード更新
RunService.RenderStepped:Connect(function()
    local _, hum = getCharacter()
    if hum then hum.WalkSpeed = speedEnabled and speedOn or speedOff end
    setWallClip(wallClipEnabled)
end)

-- 無限ジャンプ
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _, hum = getCharacter()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

-- Fly制御（スマホ用：ボタンやMoveVectorで上昇下降前後移動）
RunService.RenderStepped:Connect(function(dt)
    if not flyActive then return end
    local _,_,root=getCharacter()
    if not root then return end
    root.CFrame = root.CFrame + flyMoveVector.Unit * flySpeed * dt
end)

--================ ESPタブ =================
local espTab = Window:CreateTab("ESP",4483362458)
local highlights = {}
local showPlayerESP, showEnemyESP, showItemESP=false,false,false

-- プレイヤー透過
espTab:CreateToggle({
    Name="X-Ray: プレイヤー透過",
    CurrentValue=false,
    Callback=function(val) ToggleXRayPlayers(); Rayfield:Notify({Title="X-Ray",Content=val and "ON" or "OFF",Duration=1}) end
})
espTab:CreateToggle({
    Name="X-Ray: ワールド透過",
    CurrentValue=false,
    Callback=function(val) ToggleXRayWorld(); Rayfield:Notify({Title="X-Ray",Content=val and "ON" or "OFF",Duration=1}) end
})
espTab:CreateSlider({
    Name="X-Ray 透過度",
    Range={0,1},
    Increment=0.05,
    CurrentValue=XRayTransparency,
    Flag="XRayAlpha",
    Callback=function(val) XRayTransparency=val end
})
espTab:CreateToggle({
    Name="FullBright",
    CurrentValue=false,
    Callback=function(val) ToggleFullBright(); Rayfield:Notify({Title="FullBright",Content=val and "ON" or "OFF",Duration=1}) end
})


--========================================================--
--                     🔥 Combat Tab (Deltaスマホ用)        --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local combatTab = Window:CreateTab("戦闘", 4483362458)

--============================
-- 状態変数
--============================
local selectedTarget = nil
local followActive = false
local freeCamActive = false
local originalPos = nil
local originalHRP = nil
local savedPlatformStand = false
local zoomDist = 8

_G.SetTarget = function(tar)
	if typeof(tar) == "Instance" and tar:FindFirstChild("Humanoid") then
		selectedTarget = tar
	end
end

--============================
-- ★ プレイヤーへTP
--============================
combatTab:CreateButton({
    Name = "選択中のプレイヤーへ TP",
    Callback = function()
        if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = selectedTarget.Character.HumanoidRootPart
            player.Character:PivotTo(hrp.CFrame * CFrame.new(0,0,-3))
        else
            RayField:Notify({Title = "エラー", Content = "ターゲット無効！", Duration = 3})
        end
    end
})

--============================
-- ★ 張り付きトグル
--============================
combatTab:CreateToggle({
    Name = "張り付き（Follow）",
    CurrentValue = false,
    Callback = function(state)
        if not selectedTarget then
            RayField:Notify({Title = "エラー", Content = "先にプレイヤーを選んで！", Duration = 3})
            return
        end
        followActive = state
        local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not myHRP then return end

        if state then
            originalPos = myHRP.CFrame
            RayField:Notify({Title = "張り付き開始", Content = selectedTarget.Name.." の後ろへ追従中", Duration = 3})
        else
            if originalPos then
                player.Character:PivotTo(originalPos)
            end
            RayField:Notify({Title = "解除", Content = "元の位置に戻ったよ！", Duration = 3})
        end
    end
})

--============================
-- ★ 自由カメラトグル
--============================
combatTab:CreateToggle({
    Name = "視点のみTP",
    CurrentValue = false,
    Callback = function(state)
        if not selectedTarget then
            RayField:Notify({Title = "エラー", Content = "ターゲット選んで！", Duration = 2})
            return
        end

        freeCamActive = state

        local char = player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        if not hrp or not hum then return end

        if state then
            originalHRP = hrp.CFrame
            savedPlatformStand = hum.PlatformStand
            camera.CameraType = Enum.CameraType.Scriptable
            hrp.CFrame = CFrame.new(0,1500,0) -- 安全位置に移動
            hum.PlatformStand = true
        else
            camera.CameraType = Enum.CameraType.Custom
            if originalHRP then
                hrp.CFrame = originalHRP
            end
            hum.PlatformStand = savedPlatformStand
        end
    end
})

--============================
-- RenderStepped: Follow / FreeCam
--============================
RunService.RenderStepped:Connect(function()
    if followActive and selectedTarget and selectedTarget.Character and player.Character then
        local tHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
        local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
        if tHRP and myHRP then
            myHRP.CFrame = tHRP.CFrame * CFrame.new(0,0,-3)
        end
    end

    if freeCamActive and selectedTarget and selectedTarget.Character then
        local head = selectedTarget.Character:FindFirstChild("Head")
        if not head then return end
        local camPos = head.Position - Vector3.new(0,0,zoomDist)
        camera.CFrame = CFrame.new(camPos, head.Position)
    end
end)

--========================================================--
-- プレイヤー一覧（HPリアルタイム）
--========================================================--

combatTab:CreateLabel("プレイヤー一覧（HPリアルタイム表示）")

local playerButtons = {}

local function GetHP(plr)
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        return math.floor(plr.Character.Humanoid.Health), math.floor(plr.Character.Humanoid.MaxHealth)
    end
    return 0,0
end

local function CreatePlayerButton(plr)
    local hp, maxhp = GetHP(plr)
    local btn = combatTab:CreateButton({
        Name = plr.Name.." ["..hp.."/"..maxhp.."]",
        Callback = function()
            selectedTarget = plr
            RayField:Notify({Title = "選択", Content = plr.Name.." をターゲットにしたよ！", Duration = 3})
        end
    })
    playerButtons[plr] = btn
end

local function UpdatePlayerList()
    local current = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            current[p] = true
            if not playerButtons[p] then
                CreatePlayerButton(p)
            end
        end
    end
    for plr, btn in pairs(playerButtons) do
        if not current[plr] then
            pcall(function() btn:Remove() end)
            playerButtons[plr] = nil
        end
    end
end

UpdatePlayerList()
Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)

-- HP更新
RunService.Heartbeat:Connect(function()
    for plr, btn in pairs(playerButtons) do
        if btn and plr.Character then
            local hp, maxhp = GetHP(plr)
            pcall(function() btn:Set(plr.Name.." ["..hp.."/"..maxhp.."]") end)
        end
    end
end)


--============================
-- 設定値
--============================
local FollowDistance = 4
local AttractionRadius = 20

--============================
-- RayField UI
--============================
local EnemyTab = Window:CreateTab("敵処理", 4483362458)

-- 距離スライダー
local DistanceSlider = EnemyTab:CreateSlider({
    Name = "敵の前方距離",
    Range = {1, 50},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = FollowDistance,
    Callback = function(val) FollowDistance = val end,
})

-- 半径スライダー
local RadiusSlider = EnemyTab:CreateSlider({
    Name = "吸引半径",
    Range = {1, 2000},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = AttractionRadius,
    Callback = function(val) AttractionRadius = val end,
})

--============================
-- 敵吸引処理
--============================
local player = game.Players.LocalPlayer
local run = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

run.RenderStepped:Connect(function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local enemyFolder = Workspace:FindFirstChild("Enemies")
    if enemyFolder then
        for _, enemy in pairs(enemyFolder:GetChildren()) do
            local eHRP = enemy:FindFirstChild("HumanoidRootPart")
            if eHRP and (eHRP.Position - hrp.Position).Magnitude <= AttractionRadius then
                eHRP.CFrame = hrp.CFrame * CFrame.new(0,0,-FollowDistance)
            end
        end
    end
end)

--=============================
-- ハンティ・ゾンビタブ用
--=============================
local huntTab = Window:CreateTab("ハンティ・ゾンビ", 4483362458)

-- Pickupスライド設定
local slideSpeed = 20
local slideActive = false
local pickupCooldown = 0.5
local lastPickupSearch = 0

local function getPickups()
    local targets = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "PickupHitbox" and obj.Parent then
            table.insert(targets, obj)
        end
    end
    return targets
end

huntTab:CreateSlider({
    Name = "移動速度",
    Range = {5,50},
    Increment = 1,
    CurrentValue = slideSpeed,
    Suffix = " stud/s",
    Callback = function(val) slideSpeed = val end
})

huntTab:CreateToggle({
    Name = "自動スライド取得",
    CurrentValue = false,
    Callback = function(state) slideActive = state end
})

-- Pipe追尾設定
local followActive = false
local originalCFrame = nil
local pipeCache = {}
local searchCooldown = 0.5
local lastSearch = 0

local function updatePipeCache()
    pipeCache = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name == "Pipe" or obj.Name == "SewerPipeModel") then
            local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if primary then
                obj.PrimaryPart = primary
                table.insert(pipeCache, obj)
            end
        end
    end
end

huntTab:CreateToggle({
    Name = "Pipe追尾",
    CurrentValue = false,
    Callback = function(state)
        followActive = state
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if state then
            if hrp then originalCFrame = hrp.CFrame end
        else
            if hrp and originalCFrame then hrp.CFrame = originalCFrame end
        end
    end
})

-- 敵ESP
local pulling = false
EnemyTab:CreateToggle({
    Name = "敵ESP",
    CurrentValue = false,
    Callback = function(state) pulling = state end
})

local function createESP(hrp)
    if hrp:FindFirstChild("ESP") then return end
    local bbg = Instance.new("BillboardGui")
    bbg.Name = "ESP"
    bbg.Adornee = hrp
    bbg.Size = UDim2.new(0,50,0,20)
    bbg.AlwaysOnTop = true

    local text = Instance.new("TextLabel", bbg)
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255,0,0)
    text.TextScaled = true
    text.Text = hrp.Parent.Name

    bbg.Parent = hrp
end

-- Cylinder.015追従スライド
local moveActive = false
local targetName = "Cylinder.015"
huntTab:CreateToggle({
    Name = "バスに追従",
    CurrentValue = false,
    Callback = function(state) moveActive = state end
})

local lastUpdate = 0
local updateInterval = 0.02

-- RenderStepped処理
RunService.RenderStepped:Connect(function(dt)
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    -- Pickupスライド
    if slideActive then
        lastPickupSearch = lastPickupSearch + dt
        if lastPickupSearch >= pickupCooldown then
            lastPickupSearch = 0
            local pickups = getPickups()
            if #pickups > 0 then
                local target = pickups[1]
                if target and target.Parent then
                    hrp.CFrame = CFrame.new(target.Position + Vector3.new(0,3,0))
                    if (hrp.Position - target.Position).Magnitude < 3 then
                        pcall(function()
                            firetouchinterest(hrp, target, 0)
                            firetouchinterest(hrp, target, 1)
                            target:Destroy()
                        end)
                    end
                end
            end
        end
    end

    -- Pipe追尾
    if followActive and #pipeCache > 0 then
        lastSearch = lastSearch + dt
        if lastSearch >= searchCooldown then
            updatePipeCache()
            lastSearch = 0
        end
        table.sort(pipeCache, function(a,b)
            return (hrp.Position - a.PrimaryPart.Position).Magnitude < (hrp.Position - b.PrimaryPart.Position).Magnitude
        end)
        local target = pipeCache[1]
        if target and target.PrimaryPart then
            local moveTarget = target.PrimaryPart.Position
            hrp.CFrame = hrp.CFrame:Lerp(CFrame.new(moveTarget + Vector3.new(0,3,0)), math.clamp(slideSpeed*dt,0,1))
        end
    end

    -- Cylinder.015追従
    if moveActive then
        lastUpdate = lastUpdate + dt
        if lastUpdate >= updateInterval then
            lastUpdate = 0
            local targetPart = Workspace:FindFirstChild(targetName,true)
            if targetPart then
                hrp.CFrame = hrp.CFrame:Lerp(CFrame.new(targetPart.Position + Vector3.new(0,5,0)), math.clamp(slideSpeed*dt,0,1))
            end
        end
    end

    -- 敵ESP更新
    if pulling then
        local entities = Workspace:FindFirstChild("Entities")
        if entities then
            for _, zombie in pairs(entities:GetChildren()) do
                if zombie.Name == "Zombie" then
                    for _, e in pairs(zombie:GetChildren()) do
                        local eHRP = e:FindFirstChild("HumanoidRootPart")
                        if eHRP then createESP(eHRP) end
                    end
                end
            end
        end
    end
end)
