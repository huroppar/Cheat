-- RayFieldロード（Delta対応）
local RayField = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Delta対応版：Utility Hub v5 （Rayfield前提）
-- そのまま Rayfield をロードした直後にコピペして使ってください。

-- services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

-- ==================== 設定 ====================
local speedDefaultOn, speedDefaultOff = 30, 30
local speedMin, speedMax = 0, 500
local infiniteJumpEnabled = false
local wallClipEnabled = false
local airTPActive = false
local airHeight = 2000
local airTPOriginalCFrame = nil

-- XRay / FullBright
local XRayPlayersEnabled = false
local XRayWorldEnabled = false
local XRayTransparency = 0.6
local originalLocalTransparency = {}
local FullBrightEnabled = false
local FB_Original = {
	Brightness = Lighting.Brightness,
	ClockTime = Lighting.ClockTime,
	Ambient = Lighting.Ambient,
	OutdoorAmbient = Lighting.OutdoorAmbient
}

-- ==================== ヘルパー ====================
local function getCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
    return char, humanoid, root
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

-- FullBright funcs
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

-- XRay helpers
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

local function ToggleXRayPlayers()
	XRayPlayersEnabled = not XRayPlayersEnabled
end
local function ToggleXRayWorld()
	XRayWorldEnabled = not XRayWorldEnabled
end
local function ToggleFullBright()
	FullBrightEnabled = not FullBrightEnabled
	if not FullBrightEnabled then
		RestoreFullBright()
	end
end

local function CleanupVisuals()
	XRayPlayersEnabled = false
	XRayWorldEnabled = false
	FullBrightEnabled = false
	SetWorldXray(0)
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr.Character then SetCharacterXray(plr.Character, 0) end
	end
	RestoreFullBright()
end

-- ==================== RayField GUI 初期化（既にロード済みの Rayfield を想定） ====================
-- ここはすでに Rayfield をロードしている前提（ユーザの既存コードにあるはず）
local Window = Rayfield:CreateWindow({
    Name = "Utility Hub v5",
    LoadingTitle = "Utility Hub",
    LoadingSubtitle = "by Masashi",
    ConfigurationSaving = {Enabled=true, FolderName="UtilityHubConfigs", FileName="Config"},
    Discord={Enabled=false},
    KeySystem=false
})

-- ==================== Player タブ ====================
local playerTab = Window:CreateTab("Player", 4483362458)

-- vars
local speedEnabled = false
local speedOn = speedDefaultOn
local speedOff = speedDefaultOff

playerTab:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Flag = "SpeedToggle",
    Callback = function(val) speedEnabled = val end
})

playerTab:CreateSlider({
    Name = "Speed On",
    Range = {speedMin, speedMax},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = speedDefaultOn,
    Flag = "SpeedOnSlider",
    Callback = function(val) speedOn = val end
})

playerTab:CreateSlider({
    Name = "Speed Off",
    Range = {speedMin, speedMax},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = speedDefaultOff,
    Flag = "SpeedOffSlider",
    Callback = function(val) speedOff = val end
})

playerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(val) infiniteJumpEnabled = val end
})

playerTab:CreateToggle({
    Name = "WallClip",
    CurrentValue = false,
    Flag = "WallClip",
    Callback = function(val) wallClipEnabled = val end
})

-- Air TP button
local airTPBtn = playerTab:CreateButton({
    Name = "Air TP",
    Callback = function()
        local _, hum, root = getCharacter()
        if not root or not hum then return end
        if not airTPActive then
            airTPOriginalCFrame = root.CFrame
            root.CFrame = root.CFrame + Vector3.new(0, airHeight, 0)
            pcall(function() root.Anchored = true end)
            airTPActive = true
        else
            if airTPOriginalCFrame then root.CFrame = airTPOriginalCFrame end
            pcall(function() root.Anchored = false end)
            airTPActive = false
        end
    end
})

-- ===== 足場生成 / 削除（AirTP直下に追加する形） =====
local createdPlatforms = {}

playerTab:CreateButton({
    Name = "足場生成",
    Callback = function()
        local _, _, root = getCharacter()
        if not root then return end

        local platform = Instance.new("Part")
        platform.Size = Vector3.new(6, 1, 6)
        platform.Anchored = true
        platform.CanCollide = true
        platform.Color = Color3.fromRGB(255, 200, 0)
        platform.Material = Enum.Material.Neon

        local pos = root.Position + Vector3.new(0, -3, 0)
        platform.CFrame = CFrame.new(pos)
        platform.Parent = Workspace

        table.insert(createdPlatforms, platform)
    end
})

playerTab:CreateButton({
    Name = "足場削除",
    Callback = function()
        for _, p in ipairs(createdPlatforms) do
            if p and p.Parent then p:Destroy() end
        end
        createdPlatforms = {}
    end
})

-- ==================== 内部処理：Speed, InfiniteJump, WallClip の常時更新 ====================
RunService.RenderStepped:Connect(function()
    local _, hum = getCharacter()
    if hum then hum.WalkSpeed = speedEnabled and speedOn or speedOff end
end)

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _, hum = getCharacter()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

RunService.RenderStepped:Connect(function()
    setWallClip(wallClipEnabled)
end)

-- ==================== X-Ray / FullBright ループ ====================
task.spawn(function()
	while true do
		if XRayPlayersEnabled then
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= player then SetCharacterXray(plr.Character, XRayTransparency) end
			end
		else
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= player and plr.Character then SetCharacterXray(plr.Character, 0) end
			end
		end
		task.wait(0.25)
	end
end)

task.spawn(function()
	while true do
		if XRayWorldEnabled then SetWorldXray(XRayTransparency) else SetWorldXray(0) end
		task.wait(0.5)
	end
end)

task.spawn(function()
	while true do
		if FullBrightEnabled then ApplyFullBright() end
		task.wait(0.1)
	end
end)

-- ==================== ESP タブ（Hitbox / Highlights 等） ====================
local espTab = Window:CreateTab("ESP", 4483362458)

local showPlayerESP, showEnemyESP, showItemESP = false, false, false
local highlights = {}
local showPlayerHitbox = false
local showEnemyHitbox = false
local hitboxBoxes = {}

local function createHighlight(obj, color)
    local hl = Instance.new("Highlight")
    hl.Adornee = obj
    hl.FillColor = color
    hl.FillTransparency = 0.5
    hl.OutlineTransparency = 1
    hl.Parent = obj
    return hl
end

local function createHitboxBox(part)
    if not part or not part:IsA("BasePart") then return end
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = part
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = part.Size
    box.Color3 = Color3.new(1,0,0)
    box.Transparency = 1
    box.Parent = part
    box.Name = "HitboxESP"
    box.Thickness = 3
    box.AdornCullingMode = Enum.AdornCullingMode.Never
    return box
end

-- トグルUI
espTab:CreateToggle({
    Name = "Player Hitbox ESP（枠線）",
    CurrentValue = false,
    Callback = function(val)
        showPlayerHitbox = val
        RayField:Notify({Title="Player Hitbox", Content = val and "ON" or "OFF", Duration = 1})
    end
})

espTab:CreateToggle({
    Name = "Enemy Hitbox ESP（枠線）",
    CurrentValue = false,
    Callback = function(val)
        showEnemyHitbox = val
        RayField:Notify({Title="Enemy Hitbox", Content = val and "ON" or "OFF", Duration = 1})
    end
})

espTab:CreateToggle({Name="Player ESP", CurrentValue=false, Callback=function(val) showPlayerESP=val end})
espTab:CreateToggle({Name="Enemy/Bot ESP", CurrentValue=false, Callback=function(val) showEnemyESP=val end})
espTab:CreateToggle({Name="Item ESP", CurrentValue=false, Callback=function(val) showItemESP=val end})

-- ESP 更新
task.spawn(function()
    while true do
        -- players
        for _, pl in pairs(Players:GetPlayers()) do
            if pl ~= player and pl.Character and pl.Character:FindFirstChild("Humanoid") then
                local hum = pl.Character.Humanoid
                if showPlayerESP then
                    if not highlights[pl] then highlights[pl] = createHighlight(pl.Character, Color3.new(0,1,0)) end
                    local hpRatio = hum.Health / hum.MaxHealth
                    if hpRatio > 0.66 then highlights[pl].FillColor = Color3.new(0,1,0)
                    elseif hpRatio > 0.33 then highlights[pl].FillColor = Color3.new(1,1,0)
                    else highlights[pl].FillColor = Color3.new(1,0,0) end
                else
                    if highlights[pl] then highlights[pl]:Destroy(); highlights[pl]=nil end
                end
            end
        end

        -- enemies (workspace scanning: if your game has a special folder, change this)
        for _, enemy in pairs(Workspace:GetChildren()) do
            if enemy:IsA("Model") and enemy:FindFirstChildOfClass("Humanoid") then
                if showEnemyESP then
                    if not highlights[enemy] then highlights[enemy] = createHighlight(enemy, Color3.new(1,0,0)) end
                else
                    if highlights[enemy] then highlights[enemy]:Destroy(); highlights[enemy]=nil end
                end
            end
        end

        -- items
        if Workspace:FindFirstChild("Items") then
            for _, item in pairs(Workspace.Items:GetChildren()) do
                if showItemESP then
                    if not highlights[item] then highlights[item] = createHighlight(item, Color3.fromRGB(0,170,255)) end
                else
                    if highlights[item] then highlights[item]:Destroy(); highlights[item]=nil end
                end
            end
        end

        -- Hitboxes
        if showPlayerHitbox or showEnemyHitbox then
            -- players
            for _, pl in pairs(Players:GetPlayers()) do
                if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = pl.Character.HumanoidRootPart
                    if showPlayerHitbox then
                        if not hitboxBoxes[hrp] then hitboxBoxes[hrp] = createHitboxBox(hrp) end
                    else
                        if hitboxBoxes[hrp] then hitboxBoxes[hrp]:Destroy(); hitboxBoxes[hrp]=nil end
                    end
                end
            end
            -- enemies
            for _, enemy in pairs(Workspace:GetChildren()) do
                if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChildOfClass("Humanoid") then
                    local hrp = enemy.HumanoidRootPart
                    if showEnemyHitbox then
                        if not hitboxBoxes[hrp] then hitboxBoxes[hrp] = createHitboxBox(hrp) end
                    else
                        if hitboxBoxes[hrp] then hitboxBoxes[hrp]:Destroy(); hitboxBoxes[hrp]=nil end
                    end
                end
            end
        else
            -- ensure none lingering
            for k,v in pairs(hitboxBoxes) do if v then v:Destroy() end hitboxBoxes[k]=nil end
        end

        task.wait(0.18)
    end
end)

-- ==================== Combat タブ（プレイヤー一覧 / 張り付き / 追従カメラ） ====================
local combatTab = Window:CreateTab("Combat", 4483362458)

local selectedTarget = nil
local followActive = false
local freeViewActive = false
local camRot = Vector2.new()
local camSensitivity = 0.18
local originalCamMode = nil
local originalSavedY = nil

-- Utility: get humanoid health
local function GetHP(plr)
    if plr and plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
        local hum = plr.Character:FindFirstChildOfClass("Humanoid")
        return math.floor(hum.Health), math.floor(hum.MaxHealth)
    end
    return 0,0
end

combatTab:CreateButton({
    Name = "選択中のプレイヤーへ TP",
    Callback = function()
        if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = selectedTarget.Character.HumanoidRootPart
            pcall(function() player.Character:PivotTo(hrp.CFrame * CFrame.new(0,0,-3)) end)
        else
            RayField:Notify({Title="エラー", Content="ターゲット無効！", Duration=3})
        end
    end
})

combatTab:CreateToggle({
    Name = "張り付き（Follow）",
    CurrentValue = false,
    Callback = function(state)
        if not selectedTarget then
            RayField:Notify({Title="エラー", Content="先にプレイヤーを選んで！", Duration=3})
            return
        end
        followActive = state
        local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if state then
            if myHRP then originalSavedY = myHRP.CFrame end
            RayField:Notify({Title="張り付き開始", Content = selectedTarget.Name.." の後ろへ追従中", Duration=3})
        else
            if originalSavedY and myHRP then pcall(function() player.Character:PivotTo(originalSavedY) end) end
            RayField:Notify({Title="解除", Content="元の位置に戻ったよ！", Duration=3})
        end
    end
})

-- タッチ互換：タッチドラッグの管理
local touchTracking = { active = false, id = nil, lastPos = Vector2.new() }

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Touch then
        touchTracking.active = true
        touchTracking.id = input.UserInputState and input.UserInputState or input.UserInputType
        touchTracking.lastPos = Vector2.new(input.Position.X, input.Position.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        touchTracking.active = false
        touchTracking.id = nil
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if freeViewActive then
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            camRot = camRot + Vector2.new(-input.Delta.Y * camSensitivity, -input.Delta.X * camSensitivity)
        elseif input.UserInputType == Enum.UserInputType.Touch and touchTracking.active then
            -- タッチは Position を使って差分計算
            local pos = Vector2.new(input.Position.X, input.Position.Y)
            local delta = pos - touchTracking.lastPos
            camRot = camRot + Vector2.new(-delta.Y * (camSensitivity * 0.6), -delta.X * (camSensitivity * 0.6))
            touchTracking.lastPos = pos
        end
    end
end)

-- 追従カメラ トグル（敵の頭に固定して追従、かつ視点回転できる）
combatTab:CreateToggle({
    Name = "敵の頭に視点固定（追従カメラ）",
    CurrentValue = false,
    Callback = function(state)
        if not selectedTarget then
            RayField:Notify({Title="エラー", Content="先にターゲット選んで！", Duration=3})
            return
        end

        freeViewActive = state
        camRot = Vector2.new()

        if state then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                originalSavedY = hrp.CFrame
                pcall(function() hrp.Anchored = true end)
            end
            originalCamMode = camera.CameraType
            camera.CameraType = Enum.CameraType.Scriptable
            RayField:Notify({Title="追従視点 ON", Content="敵の頭に視点を固定したよ！", Duration=2})
        else
            camera.CameraType = originalCamMode or Enum.CameraType.Custom
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then pcall(function() hrp.Anchored = false; hrp.CFrame = originalSavedY end) end
            RayField:Notify({Title="追従視点 OFF", Content="視点を元に戻したよ！", Duration=2})
        end
    end
})

-- プレイヤー一覧（HP表示）作成
combatTab:CreateLabel("プレイヤー一覧（HPリアルタイム表示）")
local playerButtons = {}

local function CreatePlayerButton(plr)
    local hp,maxhp = GetHP(plr)
    local btn = combatTab:CreateButton({
        Name = plr.Name.." ["..hp.."/"..maxhp.."]",
        Callback = function()
            selectedTarget = plr
            RayField:Notify({Title="選択", Content = plr.Name.." をターゲットにしたよ！", Duration=2})
        end
    })
    playerButtons[plr] = btn
end

local function UpdatePlayerList()
    local current = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            current[p] = true
            if not playerButtons[p] then CreatePlayerButton(p) end
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

-- カメラ追従ループ（RenderSteppedで安定）
RunService.RenderStepped:Connect(function()
    -- HP更新表示 & 張り付き処理
    for plr, btn in pairs(playerButtons) do
        if plr and plr.Character then
            local hp,maxhp = GetHP(plr)
            pcall(function() btn:Set(plr.Name.." ["..hp.."/"..maxhp.."]") end)
        end
    end

    -- Follow (張り付き)
    if followActive and selectedTarget and selectedTarget.Character and player.Character then
        local tHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
        local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
        if tHRP and myHRP then
            myHRP.CFrame = tHRP.CFrame * CFrame.new(0,0,7)
        end
    end

    -- 追従視点の更新
    if freeViewActive and selectedTarget and selectedTarget.Character then
        local head = selectedTarget.Character:FindFirstChild("Head")
        if head then
            local basePos = head.Position + Vector3.new(0, 1.5, 0)
            -- clamp rotation values a bit to avoid extreme flips
            local pitch = math.clamp(camRot.X, -80, 80)
            local yaw = camRot.Y
            -- convert to radians and build rotation cframe (pitch then yaw)
            local rot = CFrame.Angles(math.rad(pitch), math.rad(yaw), 0)
            camera.CFrame = CFrame.new(basePos) * rot
        end
    end
end)

-- ==================== EnemyControl タブ（敵吸引） ====================
local EnemyTab = Window:CreateTab("EnemyControl", 4483362458)
local FollowDistance = 4
local AttractionRadius = 20

local DistanceSlider = EnemyTab:CreateSlider({
    Name = "敵の前方距離",
    Range = {1, 50},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = FollowDistance,
    Flag = "DistanceSliderFlag",
    Callback = function(val) FollowDistance = val end
})

local RadiusSlider = EnemyTab:CreateSlider({
    Name = "吸引半径",
    Range = {1, 2000},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = AttractionRadius,
    Flag = "RadiusSliderFlag",
    Callback = function(val) AttractionRadius = val end
})

-- 敵フォルダ（ゲームに合わせて名前を変えて）
local enemyFolder = Workspace:FindFirstChild("Enemies") or Workspace:FindFirstChild("Entities") or Workspace

RunService.RenderStepped:Connect(function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if enemyFolder then
        for _, enemy in pairs(enemyFolder:GetChildren()) do
            if enemy:IsA("Model") then
                local eHRP = enemy:FindFirstChild("HumanoidRootPart")
                if eHRP then
                    local distance = (eHRP.Position - hrp.Position).Magnitude
                    if distance <= AttractionRadius then
                        eHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, -FollowDistance)
                    end
                end
            end
        end
    end
end)

-- ==================== 終わりに：安全処理 ====================
-- スクリプト停止時 or 必要時に呼んでクリーンアップ
local function FullCleanup()
    CleanupVisuals()
    -- 足場削除
    for _, p in ipairs(createdPlatforms) do if p and p.Parent then p:Destroy() end end
    createdPlatforms = {}
    -- Hitbox装飾削除
    for part, adorn in pairs(hitboxBoxes) do
        if adorn then pcall(function() adorn:Destroy() end) end
        hitboxBoxes[part] = nil
    end
    -- highlights
    for k,v in pairs(highlights) do if v then pcall(function() v:Destroy() end) end highlights[k]=nil end
end

-- 例: スクリプト停止用キー（任意、Deltaでのキーは機種により異なる）
-- UserInputService.InputBegan:Connect(function(input, gp)
--     if input.KeyCode == Enum.KeyCode.Backspace then FullCleanup() end
-- end)

print("Utility Hub (Delta対応版) ロード完了")
