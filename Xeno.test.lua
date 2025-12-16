-- RayFieldロード
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--================ 設定 =================
local speedDefaultOn, speedDefaultOff = 30, 30
local speedMin, speedMax = 0, 500
local infiniteJumpEnabled = false
local wallClipEnabled = false
local airTPActive = false
local airHeight = 2000
local airTPOriginalCFrame = nil
local originalWalkSpeed = nil

--================ Helper =================
local function getCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
    return char, humanoid, root
end

--================ 壁貫通（完全復帰対応版） =================
local noclipEnabled = false
local noclipConnection = nil

local function enableNoclip()
	if noclipConnection then return end

	noclipEnabled = true
	noclipConnection = RunService.Stepped:Connect(function()
		if not noclipEnabled then return end

		local char = player.Character
		if not char then return end

		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end)
end

local function disableNoclip()
	noclipEnabled = false

	if noclipConnection then
		noclipConnection:Disconnect()
		noclipConnection = nil
	end

	local char = player.Character
	if not char then return end

	local hum = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")

	-- 🔹 当たり判定を戻す
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = true
		end
	end

	-- 🔹 物理状態を完全リセット
	if root then
		root.Velocity = Vector3.zero
		root.AssemblyLinearVelocity = Vector3.zero
	end

	if hum then
		hum:ChangeState(Enum.HumanoidStateType.GettingUp)
	end
end




-- ======= X-Ray & FullBright 定義（そのまま貼ってOK） =======
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

-- X-Ray 状態
local XRayPlayersEnabled = false   -- プレイヤーだけ透過
local XRayWorldEnabled   = false   -- ワールド（壁など）透過
local XRayTransparency   = 0.6

-- ワールドパーツの元の LocalTransparencyModifier を保持
local originalLocalTransparency = {}

-- FullBright 状態
local FullBrightEnabled = false
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

-- キャラ（プレイヤー）に対する透過適用
local function SetCharacterXray(character, value)
	if not character then return end
	for _, obj in ipairs(character:GetDescendants()) do
		if obj:IsA("BasePart") then
			-- LocalTransparencyModifier を使うとクライアントだけ描画が変わる
			obj.LocalTransparencyModifier = value
		end
	end
end

-- ワールド（workspace 内の BasePart）に対する透過適用（安全に保持して戻す）
local function SetWorldXray(value)
	-- value = 0 なら元に戻す
	if value == 0 then
		for part, old in pairs(originalLocalTransparency) do
			if part and part:IsA("BasePart") then
				pcall(function() part.LocalTransparencyModifier = old end)
			end
		end
		originalLocalTransparency = {}
		return
	end

	-- 透過値を設定（対象フィルタ：CanCollide==true かつ Transparency < 1 を簡易壁判定）
	for _, part in ipairs(workspace:GetDescendants()) do
		if part:IsA("BasePart") and part ~= workspace.Terrain then
			-- 簡易フィルタ（床や小道具全部透けたくないなら条件変更して）
			if part.CanCollide and part.Transparency < 1 then
				-- 保存しておく（最初だけ）
				if originalLocalTransparency[part] == nil then
					originalLocalTransparency[part] = part.LocalTransparencyModifier or 0
				end
				pcall(function() part.LocalTransparencyModifier = XRayTransparency end)
			end
		end
	end
end

-- ループ：X-Ray（プレイヤー）更新
task.spawn(function()
	while true do
		if XRayPlayersEnabled then
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= LocalPlayer then
					SetCharacterXray(plr.Character, XRayTransparency)
				end
			end
		else
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= LocalPlayer and plr.Character then
					-- 元に戻す（0）
					SetCharacterXray(plr.Character, 0)
				end
			end
		end
		task.wait(0.25)
	end
end)

-- ループ：X-Ray（ワールド）更新（常時上書き）
task.spawn(function()
	while true do
		if XRayWorldEnabled then
			-- set world parts to transparency
			SetWorldXray(XRayTransparency)
		else
			-- restore original
			SetWorldXray(0)
		end
		task.wait(0.5)
	end
end)

-- ループ：FullBright維持
task.spawn(function()
	while true do
		if FullBrightEnabled then
			ApplyFullBright()
		end
		task.wait(0.1)
	end
end)

-- 外部から切り替えられる関数（GUI のコールバックで呼ぶ）
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

-- 安全にスクリプト停止時に戻すための関数（必要なら呼んで）
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
-- ======= 定義ブロック終わり =======

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

-- スピードオンオフ
local speedEnabled = false
playerTab:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Flag = "SpeedToggle",
    Callback = function(val)
        speedEnabled = val
        local _, hum = getCharacter()
        if hum then
            if val then
                -- ON時：元の速度を保存
                if not originalWalkSpeed then
                    originalWalkSpeed = hum.WalkSpeed
                end
            else
                -- OFF時：元の速度に戻す
                if originalWalkSpeed then
                    hum.WalkSpeed = originalWalkSpeed
                end
            end
        end
    end
})



-- スライダー（オン）
local speedOn = speedDefaultOn
playerTab:CreateSlider({
    Name = "Speed On",
    Range = {speedMin, speedMax},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = speedDefaultOn,
    Flag = "SpeedOnSlider",
    Callback = function(val)
        speedOn = val
    end
})



-- 無限ジャンプ
playerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(val)
        infiniteJumpEnabled = val
    end
})


-- 壁貫通（安定版）
playerTab:CreateToggle({
    Name = "WallClip",
    CurrentValue = false,
    Flag = "WallClip",
    Callback = function(val)
        noclipEnabled = val
        if val then
            enableNoclip()
        else
            disableNoclip()
        end
    end
})


-- 空中TP（ボタン常時表示）
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



-- 足場管理テーブル
local createdPlatforms = {}

-- 足場生成ボタン
playerTab:CreateButton({
    Name = "足場生成",
    Callback = function()
        local char, hum, root = getCharacter()
        if not root then return end

        -- 足場パーツ作成
        local platform = Instance.new("Part")
        platform.Size = Vector3.new(6, 1, 6)          -- 広めの安定足場
        platform.Anchored = true                     -- 固定
        platform.CanCollide = true                   -- 当たり判定あり
        platform.Color = Color3.fromRGB(255, 200, 0) -- 見やすい色
        platform.Material = Enum.Material.Neon

        -- プレイヤーの真下に配置
        local pos = root.Position + Vector3.new(0, -3, 0)
        platform.CFrame = CFrame.new(pos)

        platform.Parent = workspace

        -- リストに保存
        table.insert(createdPlatforms, platform)
    end
})

-- 足場削除ボタン
playerTab:CreateButton({
    Name = "足場削除",
    Callback = function()
        for _, p in ipairs(createdPlatforms) do
            if p and p.Parent then
                p:Destroy()
            end
        end
        createdPlatforms = {} -- リセット
    end
})


--================ 内部処理 =================
-- スピード更新
RunService.RenderStepped:Connect(function()
    local _, hum = getCharacter()
    if hum and speedEnabled then
        hum.WalkSpeed = speedOn
    end
end)


-- 無限ジャンプ
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _, hum = getCharacter()
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)



--================ 位置固定（Freeze） =================
local freezeEnabled = false
local freezeConnection = nil
local freezeCFrame = nil

playerTab:CreateToggle({
    Name = "位置固定",
    CurrentValue = false,
    Flag = "FreezeToggle",
    Callback = function(state)
        freezeEnabled = state

        local char = player.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if freezeEnabled then
            -- 固定ON
            freezeCFrame = hrp.CFrame
            freezeConnection = RunService.RenderStepped:Connect(function()
                pcall(function()
                    hrp.CFrame = freezeCFrame
                end)
            end)
        else
            -- 固定OFF
            if freezeConnection then
                freezeConnection:Disconnect()
                freezeConnection = nil
            end
        end
    end
})



--========================================================--
--         位置記録（1つだけ上書き）＆テレポート        --
--========================================================--

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local savedCFrame = nil  -- ← 常に1つだけ保存する

-- ★ ここを書き換えて → 君が使ってる既存のタブ名に合わせて
local tab = Window:CreateTab("Teleport", 4483362458)
-- 例：playerTab なら  local tab = playerTab


-- 位置記録ボタン
tab:CreateButton({
    Name = "位置記録（上書き）",
    Callback = function()
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        if hrp then
            savedCFrame = hrp.CFrame  -- ← 上書き保存
            RayField:Notify({
                Title = "位置記録",
                Content = "現在位置を保存したよ！（前のデータは削除）",
                Duration = 2
            })
        else
            RayField:Notify({
                Title = "エラー",
                Content = "キャラが見つからないよ！",
                Duration = 2
            })
        end
    end
})


-- TPボタン
tab:CreateButton({
    Name = "記録位置にTP",
    Callback = function()
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        if savedCFrame and hrp then
            hrp.CFrame = savedCFrame
            RayField:Notify({
                Title = "テレポート",
                Content = "保存した場所へTPしたよ！",
                Duration = 2
            })
        else
            RayField:Notify({
                Title = "エラー",
                Content = "保存された位置がないよ！",
                Duration = 2
            })
        end
    end
})


--=============================
-- Fly機能（PC用: WASD + Space/Shift）
--=============================
local flyActive = false
local flySpeed = 50
local flyKeys = {W=false, A=false, S=false, D=false, Space=false, LeftShift=false}

-- Fly ON/OFFトグル
playerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(state)
        flyActive = state
        local _, _, root = getCharacter()
        if root and not flyActive then
            root.Velocity = Vector3.new(0,0,0)
        end
    end
})

-- Fly速度スライダー
playerTab:CreateSlider({
    Name = "Fly速度",
    Range = {10,200},
    Increment = 5,
    CurrentValue = flySpeed,
    Flag = "FlySpeedSlider",
    Callback = function(val)
        flySpeed = val
    end
})

-- キー入力
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if flyKeys[input.KeyCode.Name] ~= nil then
            flyKeys[input.KeyCode.Name] = true
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if flyKeys[input.KeyCode.Name] ~= nil then
            flyKeys[input.KeyCode.Name] = false
        end
    end
end)

-- Fly制御ループ
RunService.RenderStepped:Connect(function(dt)
    if not flyActive then return end
    local _, _, root = getCharacter()
    if not root then return end

    local cam = workspace.CurrentCamera
    local move = Vector3.new(0,0,0)

    -- 前後左右
    if flyKeys.W then move = move + cam.CFrame.LookVector end
    if flyKeys.S then move = move - cam.CFrame.LookVector end
    if flyKeys.A then move = move - cam.CFrame.RightVector end
    if flyKeys.D then move = move + cam.CFrame.RightVector end

    -- 上下
    if flyKeys.Space then move = move + Vector3.new(0,1,0) end
    if flyKeys.LeftShift then move = move - Vector3.new(0,1,0) end

    -- 移動
    if move.Magnitude > 0 then
        root.CFrame = root.CFrame + move.Unit * flySpeed * dt
    end
end)



--================ ESPタブ =================
local espTab = Window:CreateTab("ESP", 4483362458)

local showPlayerESP, showEnemyESP, showItemESP = false, false, false
local highlights = {}




-- ======= ESPタブ用トグル（espTab が既にある前提） =======
-- もし espTab が nil なら作る
if not espTab then
    espTab = Window:CreateTab("ESP", 4483362458)
end

-- プレイヤーX-Ray トグル
espTab:CreateToggle({
    Name = "X-Ray: プレイヤー透過",
    CurrentValue = false,
    Callback = function(val)
        ToggleXRayPlayers()
        if val then
            -- 即反映（Optional：通知）
            RayField:Notify({Title="X-Ray", Content="プレイヤー透過 ON", Duration=2})
        else
            RayField:Notify({Title="X-Ray", Content="プレイヤー透過 OFF", Duration=1})
        end
    end
})

-- ワールドX-Ray トグル（壁透け）
espTab:CreateToggle({
    Name = "X-Ray: ワールド透過",
    CurrentValue = false,
    Callback = function(val)
        ToggleXRayWorld()
        if val then
            RayField:Notify({Title="X-Ray", Content="ワールド透過 ON", Duration=2})
        else
            RayField:Notify({Title="X-Ray", Content="ワールド透過 OFF", Duration=1})
        end
    end
})

-- 透過度スライダー（0 = 通常, 1 = 完全透明）
espTab:CreateSlider({
    Name = "X-Ray 透過度",
    Range = {0, 1},
    Increment = 0.05,
    CurrentValue = XRayTransparency,
    Suffix = "",
    Flag = "XRayAlpha",
    Callback = function(val)
        XRayTransparency = val
    end
})

-- FullBright トグル
espTab:CreateToggle({
    Name = "FullBright（常時明るく）",
    CurrentValue = false,
    Callback = function(val)
        ToggleFullBright()
        if val then
            RayField:Notify({Title="FullBright", Content="常時明るく ON", Duration=2})
        else
            RayField:Notify({Title="FullBright", Content="常時明るく OFF", Duration=1})
        end
    end
})
-- ======= トグル追加終わり =======

--=================== HITBOX ESP ===================--

local showPlayerHitbox = false
local showEnemyHitbox = false

local hitboxBoxes = {} -- HRPごとに管理

-- Box（枠線）を作成
local function createHitboxBox(part)
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = part
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = part.Size
    box.Color3 = Color3.new(1,0,0) -- 赤
    box.Transparency = 0           -- 枠線は透明度0
    box.AlwaysOnTop = true
    box.AdornCullingMode = Enum.AdornCullingMode.Never
    box.Parent = part

    -- 枠線だけにする設定
    box.Name = "HitboxESP"
    box.Transparency = 1            -- 中身透明
    box.Thickness = 3               -- 枠線の太さ
    box.ZIndex = 10

    return box
end


-- HITBOX 更新
task.spawn(function()
    while true do
        
        --===== プレイヤーの Hitbox =====--
        for _, pl in pairs(Players:GetPlayers()) do
            if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = pl.Character.HumanoidRootPart

                if showPlayerHitbox then
                    if not hitboxBoxes[hrp] then
                        hitboxBoxes[hrp] = createHitboxBox(hrp)
                    end
                else
                    if hitboxBoxes[hrp] then
                        hitboxBoxes[hrp]:Destroy()
                        hitboxBoxes[hrp] = nil
                    end
                end
            end
        end

        --===== 敵の Hitbox =====--
        for _, enemy in pairs(workspace:GetChildren()) do
            if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChildOfClass("Humanoid") then
                if enemy:FindFirstChild("Humanoid").Health > 0 then
                    local hrp = enemy.HumanoidRootPart

                    if showEnemyHitbox then
                        if not hitboxBoxes[hrp] then
                            hitboxBoxes[hrp] = createHitboxBox(hrp)
                        end
                    else
                        if hitboxBoxes[hrp] then
                            hitboxBoxes[hrp]:Destroy()
                            hitboxBoxes[hrp] = nil
                        end
                    end
                end
            end
        end

        task.wait(0.15)
    end
end)


--=================== HITBOX トグル ===================--

espTab:CreateToggle({
    Name = "Player Hitbox ESP（枠線）",
    CurrentValue = false,
    Callback = function(val)
        showPlayerHitbox = val
        RayField:Notify({
            Title="Player Hitbox",
            Content = val and "ON" or "OFF",
            Duration = 1
        })
    end
})

espTab:CreateToggle({
    Name = "Enemy Hitbox ESP（枠線）",
    CurrentValue = false,
    Callback = function(val)
        showEnemyHitbox = val
        RayField:Notify({
            Title="Enemy Hitbox",
            Content = val and "ON" or "OFF",
            Duration = 1
        })
    end
})

-- トグル作成
espTab:CreateToggle({Name="Player ESP", CurrentValue=false, Callback=function(val) showPlayerESP=val end})
espTab:CreateToggle({Name="Enemy/Bot ESP", CurrentValue=false, Callback=function(val) showEnemyESP=val end})
espTab:CreateToggle({Name="Item ESP", CurrentValue=false, Callback=function(val) showItemESP=val end})

-- ハイライト作成関数
local function createHighlight(obj, color)
    local hl = Instance.new("Highlight")
    hl.Adornee = obj
    hl.FillColor = color
    hl.FillTransparency = 0.5
    hl.OutlineTransparency = 1
    hl.Parent = obj
    return hl
end

-- ESP更新ループ
spawn(function()
    while true do
        -- プレイヤーESP
        for _, pl in pairs(Players:GetPlayers()) do
            if pl ~= player and pl.Character and pl.Character:FindFirstChild("Humanoid") then
                local hum = pl.Character.Humanoid
                if showPlayerESP then
                    if not highlights[pl] then
                        highlights[pl] = createHighlight(pl.Character, Color3.new(0,1,0))
                    end
                    -- HPに応じて色変更
                    local hpRatio = hum.Health / hum.MaxHealth
                    if hpRatio > 0.66 then
                        highlights[pl].FillColor = Color3.new(0,1,0)
                    elseif hpRatio > 0.33 then
                        highlights[pl].FillColor = Color3.new(1,1,0)
                    else
                        highlights[pl].FillColor = Color3.new(1,0,0)
                    end
                else
                    if highlights[pl] then highlights[pl]:Destroy(); highlights[pl]=nil end
                end
            end
        end

        -- 敵/BOT ESP
        for _, enemy in pairs(workspace:GetChildren()) do
            if enemy:IsA("Model") and enemy:FindFirstChildOfClass("Humanoid") then
                if showEnemyESP then
                    if not highlights[enemy] then
                        highlights[enemy] = createHighlight(enemy, Color3.new(1,0,0))
                    end
                else
                    if highlights[enemy] then highlights[enemy]:Destroy(); highlights[enemy]=nil end
                end
            end
        end

        -- アイテムESP（仮にworkspace.Itemsにある場合）
        if workspace:FindFirstChild("Items") then
            for _, item in pairs(workspace.Items:GetChildren()) do
                if showItemESP then
                    if not highlights[item] then
                        highlights[item] = createHighlight(item, Color3.fromRGB(0,170,255))
                    end
                else
                    if highlights[item] then highlights[item]:Destroy(); highlights[item]=nil end
                end
            end
        end

        wait(0.2)
    end
end)


--========================================================--
--                    🔥 Combat Tab                      --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local CombatTab = Window:CreateTab("戦闘", 4483362458)

--========================================================--
--                    状態変数                             --
--========================================================--

local selectedTarget = nil
local followActive = false
local freeCamActive = false
local tracerActive = false

local camYaw, camPitch = 0,0
local sensitivity = 0.25
local zoomDist = 8
local safePos = CFrame.new(0,1500,0)

local savedHRP = nil
local savedPlatformStand = false

--========================================================--
--                    Tracer（線）                         --
--========================================================--

local tracerLine = Drawing.new("Line")
tracerLine.Visible = false
tracerLine.Thickness = 2
tracerLine.Transparency = 1
tracerLine.Color = Color3.fromRGB(0, 255, 255) -- ネオン水色

--========================================================--
--                 張り付きトグル                           --
--========================================================--

CombatTab:CreateToggle({
	Name = "張り付き（Follow）",
	CurrentValue = false,
	Callback = function(state)
		if state and not selectedTarget then
			Rayfield:Notify({
				Title = "エラー",
				Content = "先にプレイヤーを選んで",
				Duration = 1.5
			})
			return
		end
		followActive = state
	end
})

--========================================================--
--                 視点のみ追従                            --
--========================================================--

CombatTab:CreateToggle({
	Name = "視点のみ追従",
	CurrentValue = false,
	Callback = function(state)
		if state and not selectedTarget then return end
		freeCamActive = state

		local char = LocalPlayer.Character
		if not char then return end
		local hrp = char:FindFirstChild("HumanoidRootPart")
		local hum = char:FindFirstChild("Humanoid")
		if not hrp or not hum then return end

		if state then
			savedHRP = hrp.CFrame
			savedPlatformStand = hum.PlatformStand
			Camera.CameraType = Enum.CameraType.Scriptable
			hrp.CFrame = safePos
			hum.PlatformStand = true
		else
			Camera.CameraType = Enum.CameraType.Custom
			if savedHRP then hrp.CFrame = savedHRP end
			hum.PlatformStand = savedPlatformStand
		end
	end
})

--========================================================--
--                   Tracerトグル                          --
--========================================================--

CombatTab:CreateToggle({
	Name = "ターゲット線（Tracer）",
	CurrentValue = false,
	Callback = function(state)
		tracerActive = state
		if not state then
			tracerLine.Visible = false
		end
	end
})

--========================================================--
--                   マウス操作                            --
--========================================================--

UIS.InputChanged:Connect(function(input)
	if not freeCamActive then return end

	if input.UserInputType == Enum.UserInputType.MouseMovement then
		camYaw -= input.Delta.X * sensitivity
		camPitch = math.clamp(camPitch - input.Delta.Y * sensitivity, -75, 75)
	elseif input.UserInputType == Enum.UserInputType.MouseWheel then
		zoomDist = math.clamp(zoomDist - input.Position.Z * 2, 3, 25)
	end
end)

--========================================================--
--                 プレイヤー一覧（最下部）                --
--========================================================--

CombatTab:CreateLabel("―― プレイヤー一覧（HPリアルタイム） ――")

local playerButtons = {}

local function GetHP(plr)
	if plr.Character and plr.Character:FindFirstChild("Humanoid") then
		local hum = plr.Character.Humanoid
		return math.floor(hum.Health), math.floor(hum.MaxHealth)
	end
	return 0,0
end

local function AddPlayer(plr)
	if plr == LocalPlayer then return end
	if playerButtons[plr] then return end

	local hp,maxhp = GetHP(plr)

	local btn = CombatTab:CreateButton({
		Name = plr.Name.." ["..hp.."/"..maxhp.."]",
		Callback = function()
			selectedTarget = plr
			Rayfield:Notify({
				Title = "ターゲット選択",
				Content = plr.Name.." を選択した",
				Duration = 1
			})
		end
	})

	playerButtons[plr] = btn
end

local function RemovePlayer(plr)
	if playerButtons[plr] then
		pcall(function()
			playerButtons[plr]:Remove()
		end)
		playerButtons[plr] = nil
	end
	if selectedTarget == plr then
		selectedTarget = nil
		tracerLine.Visible = false
	end
end

-- 初期生成
for _,plr in ipairs(Players:GetPlayers()) do
	AddPlayer(plr)
end

Players.PlayerAdded:Connect(AddPlayer)
Players.PlayerRemoving:Connect(RemovePlayer)

-- HPリアルタイム更新（安定）
RunService.Heartbeat:Connect(function()
	for plr,btn in pairs(playerButtons) do
		if btn and plr.Character then
			local hp,maxhp = GetHP(plr)
			pcall(function()
				btn:Set(plr.Name.." ["..hp.."/"..maxhp.."]")
			end)
		end
	end
end)

--========================================================--
--                   メイン処理                            --
--========================================================--

RunService.RenderStepped:Connect(function()
	-- 張り付き
	if followActive and selectedTarget and selectedTarget.Character and LocalPlayer.Character then
		local tHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
		local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if tHRP and myHRP then
			myHRP.CFrame = tHRP.CFrame * CFrame.new(0,0,-4)
		end
	end

	-- 視点追従
	if freeCamActive and selectedTarget and selectedTarget.Character then
		local head = selectedTarget.Character:FindFirstChild("Head")
		if not head then return end

		local yaw = math.rad(camYaw)
		local pitch = math.rad(camPitch)

		local dir = Vector3.new(
			math.cos(pitch) * math.sin(yaw),
			math.sin(pitch),
			math.cos(pitch) * math.cos(yaw)
		)

		Camera.CFrame = CFrame.new(
			head.Position - dir * zoomDist,
			head.Position
		)
	end

	-- Tracer
	if tracerActive and selectedTarget and selectedTarget.Character and LocalPlayer.Character then
		local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local tHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")

		if myHRP and tHRP then
			local p1,v1 = Camera:WorldToViewportPoint(myHRP.Position)
			local p2,v2 = Camera:WorldToViewportPoint(tHRP.Position)

			if v1 and v2 then
				tracerLine.From = Vector2.new(p1.X, p1.Y)
				tracerLine.To   = Vector2.new(p2.X, p2.Y)
				tracerLine.Visible = true
			else
				tracerLine.Visible = false
			end
		else
			tracerLine.Visible = false
		end
	else
		tracerLine.Visible = false
	end
end)


--============================
-- 設定値
--============================
local FollowDistance = 4   -- プレイヤー前方の距離
local AttractionRadius = 20 -- 半径20スタッド以内だけ吸引（初期値）

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
    Flag = "DistanceSliderFlag",
    Callback = function(val)
        FollowDistance = val
    end,
})

-- 半径スライダー
local RadiusSlider = EnemyTab:CreateSlider({
    Name = "吸引半径",
    Range = {1, 2000},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = AttractionRadius,
    Flag = "RadiusSliderFlag",
    Callback = function(val)
        AttractionRadius = val
    end,
})

--============================
-- 敵吸引処理
--============================
local player = game.Players.LocalPlayer
local run = game:GetService("RunService")
local enemyFolder = workspace:FindFirstChild("Enemies") -- 存在しない場合は nil

run.RenderStepped:Connect(function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local enemyFolder = workspace:FindFirstChild("Enemies") -- 毎フレーム確認

    if enemyFolder then
        for _, enemy in pairs(enemyFolder:GetChildren()) do
            local eHRP = enemy:FindFirstChild("HumanoidRootPart")
            if eHRP then
                local distance = (eHRP.Position - hrp.Position).Magnitude
                if distance <= AttractionRadius then
                    eHRP.CFrame = hrp.CFrame * CFrame.new(0,0,-FollowDistance)
                end
            end
        end
    end
end)



--=============================
-- ハンティ・ゾンビタブ（敵ESP統合）
--=============================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local huntTab = Window:CreateTab("ハンティ・ゾンビ", 4483362458)

--=============================
-- Pickupスライド
--=============================
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
    Callback = function(v)
        slideSpeed = v
    end
})

huntTab:CreateToggle({
    Name = "自動スライド取得",
    CurrentValue = false,
    Callback = function(v)
        slideActive = v
    end
})

--=============================
-- Pipe追尾
--=============================
local followActive = false
local originalCFrame
local pipeCache = {}
local searchCooldown = 0.5
local lastSearch = 0

local function updatePipeCache()
    table.clear(pipeCache)
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name == "Pipe" or obj.Name == "SewerPipeModel") then
            local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if part then
                obj.PrimaryPart = part
                table.insert(pipeCache, obj)
            end
        end
    end
end

huntTab:CreateToggle({
    Name = "Pipe追尾",
    CurrentValue = false,
    Callback = function(v)
        followActive = v
        local char = player.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                if v then
                    originalCFrame = hrp.CFrame
                elseif originalCFrame then
                    hrp.CFrame = originalCFrame
                end
            end
        end
    end
})

--=============================
-- Endless Island TP
--=============================
huntTab:CreateButton({
    Name = "🌴 Endless Island 放置場所TP",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        hrp.CFrame = CFrame.new(12.4, -14.2, -31.8)
    end
})

--=============================
-- バス追従
--=============================
local moveActive = false
local targetName = "Cylinder.015"
local updateInterval = 0.02
local lastUpdate = 0

huntTab:CreateToggle({
    Name = "バスに追従",
    CurrentValue = false,
    Callback = function(v)
        moveActive = v
    end
})

--=============================
-- 敵ESP
--=============================
local enemyESPEnabled = false

huntTab:CreateToggle({
    Name = "🧟 敵ESP",
    CurrentValue = false,
    Callback = function(v)
        enemyESPEnabled = v
        if not v then
            local entities = Workspace:FindFirstChild("Entities")
            if entities then
                for _, g in pairs(entities:GetDescendants()) do
                    if g:IsA("BillboardGui") and g.Name == "EnemyESP" then
                        g:Destroy()
                    end
                end
            end
        end
    end
})

local function createEnemyESP(hrp)
    if hrp:FindFirstChild("EnemyESP") then return end

    local gui = Instance.new("BillboardGui")
    gui.Name = "EnemyESP"
    gui.Adornee = hrp
    gui.Size = UDim2.new(0,90,0,24)
    gui.StudsOffset = Vector3.new(0,2.5,0)
    gui.AlwaysOnTop = true

    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.fromScale(1,1)
    txt.BackgroundTransparency = 1
    txt.TextScaled = true
    txt.TextColor3 = Color3.fromRGB(255,60,60)
    txt.TextStrokeTransparency = 0
    txt.Text = hrp.Parent.Name
    txt.Parent = gui

    gui.Parent = hrp
end

--=============================
-- RenderStepped
--=============================
RunService.RenderStepped:Connect(function(dt)
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    -- Pickupスライド
    if slideActive then
        lastPickupSearch += dt
        if lastPickupSearch >= pickupCooldown then
            lastPickupSearch = 0
            local pickups = getPickups()
            local target = pickups[1]
            if target then
                hrp.CFrame = CFrame.new(target.Position + Vector3.new(0,3,0))
                if (hrp.Position - target.Position).Magnitude < 3 then
                    pcall(function()
                        firetouchinterest(hrp, target, 0)
                        firetouchinterest(hrp, target, 1)
                        if target.Parent then target:Destroy() end
                    end)
                end
            end
        end
    end

    -- Pipe追尾
    if followActive then
        lastSearch += dt
        if lastSearch >= searchCooldown then
            updatePipeCache()
            lastSearch = 0
        end

        if #pipeCache > 0 then
            table.sort(pipeCache, function(a,b)
                return (hrp.Position - a.PrimaryPart.Position).Magnitude <
                       (hrp.Position - b.PrimaryPart.Position).Magnitude
            end)

            local target = pipeCache[1]
            if target and target.PrimaryPart then
                hrp.CFrame = hrp.CFrame:Lerp(
                    CFrame.new(target.PrimaryPart.Position + Vector3.new(0,3,0)),
                    math.clamp(slideSpeed * dt, 0, 1)
                )
            end
        end
    end

    -- バス追従
    if moveActive then
        lastUpdate += dt
        if lastUpdate >= updateInterval then
            lastUpdate = 0
            local part = Workspace:FindFirstChild(targetName, true)
            if part then
                hrp.CFrame = hrp.CFrame:Lerp(
                    CFrame.new(part.Position + Vector3.new(0,5,0)),
                    math.clamp(slideSpeed * dt, 0, 1)
                )
            end
        end
    end

    -- 敵ESP
    if enemyESPEnabled then
        local entities = Workspace:FindFirstChild("Entities")
        if entities then
            for _, zombie in pairs(entities:GetChildren()) do
                if zombie.Name == "Zombie" then
                    for _, enemy in pairs(zombie:GetChildren()) do
                        local ehrp = enemy:FindFirstChild("HumanoidRootPart")
                        if ehrp then
                            createEnemyESP(ehrp)
                        end
                    end
                end
            end
        end
    end
end)
