-- RayFieldロード
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--================ 設定 =================
local speedDefaultOn, speedDefaultOff = 30, 30
local speedMin, speedMax = 0, 500
local jumpEnabled = false
local jumpPowerValue = 50      -- スライダー初期値
local jumpMin, jumpMax = 0, 700
local originalJumpPower = nil
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
    Name = "Furo Hub",
    LoadingTitle = "Loading now",
    LoadingSubtitle = "Editting by Furopper",
    ConfigurationSaving = {Enabled=true, FolderName="UtilityHubConfigs", FileName="Config"},
    Discord={Enabled=false},
    KeySystem=false
})

--================ プレイヤータブ =================
local playerTab = Window:CreateTab("プレイヤー", 4483362458)

-- スピードオンオフ
local speedEnabled = false
playerTab:CreateToggle({
    Name = "スピード",
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
    Name = "スピード調節",
    Range = {speedMin, speedMax},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = speedDefaultOn,
    Flag = "SpeedOnSlider",
    Callback = function(val)
        speedOn = val
    end
})



playerTab:CreateToggle({
    Name = "跳躍力",
    CurrentValue = false,
    Flag = "JumpPowerToggle",
    Callback = function(val)
        jumpEnabled = val
        local _, hum = getCharacter()
        if hum then
            if val then
                -- 🔹 ON時：現在の値を保存
                if not originalJumpPower then
                    originalJumpPower = hum.JumpPower
                end
                hum.JumpPower = jumpPowerValue
            else
                -- 🔹 OFF時：元に戻す
                if originalJumpPower then
                    hum.JumpPower = originalJumpPower
                end
            end
        end
    end
})

playerTab:CreateSlider({
    Name = "跳躍力調節",
    Range = {jumpMin, jumpMax},
    Increment = 5,
    Suffix = "Power",
    CurrentValue = jumpPowerValue,
    Flag = "JumpPowerSlider",
    Callback = function(val)
        jumpPowerValue = val
        local _, hum = getCharacter()
        if hum and jumpEnabled then
            hum.JumpPower = jumpPowerValue
        end
    end
})



-- 無限ジャンプ
playerTab:CreateToggle({
    Name = "無限ジャンプ",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(val)
        infiniteJumpEnabled = val
    end
})


-- 壁貫通（安定版）
playerTab:CreateToggle({
    Name = "壁貫通",
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


local airTPBtn = playerTab:CreateButton({
    Name = "空中TP",
    Callback = function()
        local char, hum, root = getCharacter()
        if not char or not hum or not root then return end

        -- BodyVelocity保存用
        airTPForce = airTPForce or nil

        if not airTPActive then
            -- 元位置保存
            airTPOriginalCFrame = root.CFrame

            -- 上空へTP
            hum:ChangeState(Enum.HumanoidStateType.Physics)
            RunService.Stepped:Wait()
            root.CFrame = airTPOriginalCFrame + Vector3.new(0, airHeight, 0)

            -- 落下防止（浮遊）
            airTPForce = Instance.new("BodyVelocity")
            airTPForce.MaxForce = Vector3.new(0, math.huge, 0)
            airTPForce.Velocity = Vector3.new(0, 0, 0)
            airTPForce.Parent = root

            hum:ChangeState(Enum.HumanoidStateType.Freefall)
            airTPActive = true
        else
            -- 浮遊解除
            if airTPForce then
                airTPForce:Destroy()
                airTPForce = nil
            end

            -- 元の場所へ戻す
            if airTPOriginalCFrame then
                hum:ChangeState(Enum.HumanoidStateType.Physics)
                RunService.Stepped:Wait()
                root.CFrame = airTPOriginalCFrame
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            end

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
    Name = "位置記録を記録",
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
-- Fly機能（向き自由・重力のみ無効）
--=============================
local flyActive = false
local flySpeed = 50

local flyKeys = {
	W = false,
	A = false,
	S = false,
	D = false,
	Space = false,
	LeftShift = false
}

-- Fly ON / OFF
playerTab:CreateToggle({
	Name = "Fly",
	CurrentValue = false,
	Flag = "FlyToggle",
	Callback = function(state)
		flyActive = state
		local _, hum, root = getCharacter()
		if not hum or not root then return end

		if flyActive then
			-- 🔵 重力だけ無効化（向きはそのまま）
			root.AssemblyLinearVelocity = Vector3.zero
			root.AssemblyAngularVelocity = Vector3.zero
		else
			-- 🔵 通常に戻す
			root.AssemblyLinearVelocity = Vector3.zero
			root.AssemblyAngularVelocity = Vector3.zero
		end
	end
})

-- Fly速度
playerTab:CreateSlider({
	Name = "Fly速度",
	Range = {10, 2000},
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

-- Fly制御
RunService.RenderStepped:Connect(function(dt)
	if not flyActive then return end

	local _, hum, root = getCharacter()
	if not hum or not root then return end

	-- 🔒 落下防止（重力キャンセル）
	root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)

	local cam = workspace.CurrentCamera
	local move = Vector3.zero

	-- 前後左右（＝向きは普通に変わる）
	if flyKeys.W then move += cam.CFrame.LookVector end
	if flyKeys.S then move -= cam.CFrame.LookVector end
	if flyKeys.A then move -= cam.CFrame.RightVector end
	if flyKeys.D then move += cam.CFrame.RightVector end

	-- 上下
	if flyKeys.Space then move += Vector3.new(0, 1, 0) end
	if flyKeys.LeftShift then move -= Vector3.new(0, 1, 0) end

	if move.Magnitude > 0 then
		root.CFrame = root.CFrame + (move.Unit * flySpeed * dt)
	end
end)


player.CharacterAdded:Connect(function()
    task.wait(0.2)
    local _, hum = getCharacter()
    if not hum then return end

    if jumpEnabled then
        hum.JumpPower = jumpPowerValue
    else
        if originalJumpPower then
            hum.JumpPower = originalJumpPower
        end
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
espTab:CreateToggle({Name="プレイヤーハイライト", CurrentValue=false, Callback=function(val) showPlayerESP=val end})
espTab:CreateToggle({Name="敵ハイライト", CurrentValue=false, Callback=function(val) showEnemyESP=val end})
espTab:CreateToggle({Name="アイテムハイライト", CurrentValue=false, Callback=function(val) showItemESP=val end})

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
--                     🔥 Combat Tab                      --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")

local combatTab = Window:CreateTab("戦闘", 4483362458)

--============================
-- 状態変数
--============================
local selectedTarget = nil
local followActive = false
local freeCamActive = false
local originalPos = nil
local originalCamType = nil
local savedHRPCFrame = nil
local savedPlatformStand = false
--============================
-- Tracer（線）
--============================
local tracerActive = false

local tracerLine = Drawing.new("Line")
tracerLine.Visible = false
tracerLine.Thickness = 2
tracerLine.Transparency = 1
tracerLine.Color = Color3.fromRGB(0,255,255) -- ネオン水色

--============================
-- ★ プレイヤーへTP
--============================
combatTab:CreateButton({
    Name = "選択中のプレイヤーへ TP",
    Callback = function()
        if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = selectedTarget.Character.HumanoidRootPart
            player.Character:PivotTo(hrp.CFrame * CFrame.new(0,0,3))
        else
            RayField:Notify({
                Title = "エラー",
                Content = "ターゲット無効！",
                Duration = 3
            })
        end
    end
})

--============================
-- ★ 張り付きトグル
--============================
combatTab:CreateToggle({
    Name = "張り付き",
    CurrentValue = false,
    Callback = function(state)
        if not selectedTarget then
            RayField:Notify({
                Title = "エラー",
                Content = "先にプレイヤーを選んで！",
                Duration = 3
            })
            return
        end
        followActive = state
        local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not myHRP then return end

        if state then
            originalPos = myHRP.CFrame
            RayField:Notify({
                Title = "張り付き開始",
                Content = selectedTarget.Name .. " の後ろへ追従中",
                Duration = 3
            })
        else
            if originalPos then
                player.Character:PivotTo(originalPos)
            end
            RayField:Notify({
                Title = "解除",
                Content = "元の位置に戻ったよ！",
                Duration = 3
            })
        end
    end
})

--============================
-- ★ カメラ自由追従
--============================
local camYaw, camPitch = 0,0
local sensitivity = 0.25
local zoomDist = 8
local minZoom, maxZoom = 3,25
local safePos = CFrame.new(0,1500,0)
local originalHRP = nil

_G.SetTarget = function(tar)
	if typeof(tar) == "Instance" and tar:FindFirstChild("Humanoid") then
		selectedTarget = tar
	end
end

combatTab:CreateToggle({
    Name = "視点TP(向き固定)",
    CurrentValue = false,
    Callback = function(state)
        if not selectedTarget then
            RayField:Notify({
                Title = "エラー",
                Content = "ターゲット選んで！",
                Duration = 2
            })
            return
        end

        freeCamActive = state

        local char = player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        if not hrp or not hum then return end

        if state then
            -- カメラ制御開始
            originalHRP = hrp.CFrame
            savedPlatformStand = hum.PlatformStand

            camera.CameraType = Enum.CameraType.Scriptable
            hrp.CFrame = safePos
            hum.PlatformStand = true

            camYaw, camPitch = 0,0
        else
            -- カメラ解除
            camera.CameraType = Enum.CameraType.Custom
            if originalHRP then
                hrp.CFrame = originalHRP
            end
            hum.PlatformStand = savedPlatformStand
        end
    end
})

--============================
-- ★ ターゲット線（Tracer）
--============================
combatTab:CreateToggle({
    Name = "ターゲット線",
    CurrentValue = false,
    Callback = function(state)
        tracerActive = state
        if not state then
            tracerLine.Visible = false
        end
    end
})


--============================
-- マウス操作
--============================
UIS.InputChanged:Connect(function(input)
    if not freeCamActive then return end
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        camYaw = camYaw - input.Delta.X * sensitivity
        camPitch = math.clamp(camPitch - input.Delta.Y * sensitivity, -75, 75)
    elseif input.UserInputType == Enum.UserInputType.MouseWheel then
        zoomDist = math.clamp(zoomDist - input.Position.Z * 2, minZoom, maxZoom)
    end
end)

--============================
-- RenderStepped カメラ制御
--============================
RunService.RenderStepped:Connect(function()
    --============================
    -- Follow処理
    --============================
    if followActive and selectedTarget and selectedTarget.Character and player.Character then
        local targetHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
        local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
        if targetHRP and myHRP then
            myHRP.CFrame = targetHRP.CFrame * CFrame.new(0,0,7)
        end
    end

    --============================
    -- 自由カメラ
    --============================
    if freeCamActive and selectedTarget and selectedTarget.Character then
        local head = selectedTarget.Character:FindFirstChild("Head")
        if head then
            local yaw = math.rad(camYaw)
            local pitch = math.rad(camPitch)
            local lookDir = Vector3.new(
                math.cos(pitch) * math.sin(yaw),
                math.sin(pitch),
                math.cos(pitch) * math.cos(yaw)
            )
            local camPos = head.Position - lookDir * zoomDist
            camera.CFrame = CFrame.new(camPos, head.Position)
        end
    end

    --============================
    -- 🔥 Tracer 描画（ここが重要）
    --============================
    if tracerActive and selectedTarget and selectedTarget.Character and player.Character then
        local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
        local tHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")

        if myHRP and tHRP then
            local p1, v1 = camera:WorldToViewportPoint(myHRP.Position)
            local p2, v2 = camera:WorldToViewportPoint(tHRP.Position)

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


--========================================================--
-- プレイヤー一覧（HPリアルタイム）
--========================================================--

combatTab:CreateLabel("プレイヤー一覧")

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
            RayField:Notify({
                Title = "選択",
                Content = plr.Name .. " をターゲットにしたよ！",
                Duration = 3
            })
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

-- HP更新 + 張り付き
RunService.Heartbeat:Connect(function()
for plr, btn in pairs(playerButtons) do
    if btn and plr.Character then  -- btn が存在するかチェック
        local hp,maxhp = GetHP(plr)
        pcall(function()
            btn:Set(plr.Name.." ["..hp.."/"..maxhp.."]")
        end)
    end
end


    if followActive and selectedTarget and selectedTarget.Character and player.Character then
        local tHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
        local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
        if tHRP and myHRP then
            myHRP.CFrame = tHRP.CFrame * CFrame.new(0,0,7)
        end
    end
end)





--========================================================--
--                🎯 Auto Aim Tab (Tab2)                 --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

--====================
-- 設定
--====================
local autoAimEnabled = false
local lockedPart = nil
local FOV_RADIUS = 160
local AIM_PART = "HumanoidRootPart"
local AIM_STRENGTH = 0.35
local showFOV = true

--====================
-- FOV表示
--====================
local fov = Drawing.new("Circle")
fov.Radius = FOV_RADIUS
fov.Thickness = 2
fov.NumSides = 64
fov.Filled = false
fov.Color = Color3.fromRGB(255, 255, 255)
fov.Visible = false

--====================
-- ShiftLock判定
--====================
local function isShiftLock()
	return UIS.MouseBehavior == Enum.MouseBehavior.LockCenter
end

--====================
-- 一番近いプレイヤー取得
--====================
local function getClosestPlayer()
	local closestPart = nil
	local shortest = math.huge
	local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= localPlayer and plr.Character then
			local hum = plr.Character:FindFirstChild("Humanoid")
			local part = plr.Character:FindFirstChild(AIM_PART)
			if hum and hum.Health > 0 and part then
				local pos, onScreen = camera:WorldToViewportPoint(part.Position)
				if onScreen then
					local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
					if dist < FOV_RADIUS and dist < shortest then
						shortest = dist
						closestPart = part
					end
				end
			end
		end
	end

	return closestPart
end

--====================
-- メインループ
--====================
RunService.RenderStepped:Connect(function()
	-- GUIオフなら処理しない
	if not autoAimEnabled then
		lockedPart = nil
		fov.Visible = false
		return
	end

	-- FOV表示
	local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
	fov.Position = center
	fov.Radius = FOV_RADIUS
	fov.Visible = showFOV

	-- ShiftLockしてないならターゲット解除
	if not isShiftLock() then
		lockedPart = nil
		return
	end

	-- ShiftLock中のみターゲットを取得
	if not lockedPart or not lockedPart.Parent then
		lockedPart = getClosestPlayer()
	end

	-- ターゲットがあれば吸い付き
	if lockedPart then
		local camCF = camera.CFrame
		local targetCF = CFrame.new(camCF.Position, lockedPart.Position)
		camera.CFrame = camCF:Lerp(targetCF, AIM_STRENGTH)
	end
end)


--========================================================--
-- 🍏 Fruit 自動スライド移動（AutoAimと共存）
--========================================================--

local fruitSlideEnabled = false
local SLIDE_SPEED = 300
local HEIGHT_OFFSET = 0 -- 高さ固定（落下防止）

-- キャラRoot取得
local function getRoot()
    local char = localPlayer.Character
    if not char then return end
    return char:FindFirstChild("HumanoidRootPart")
end

--================ Fruit検索（完全一致） =================
local function getAllFruits()
    local fruits = {}

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "Fruit" then
            table.insert(fruits, obj)
        end
    end

    return fruits
end


-- 一番近いFruit
local function getNearestFruit(root)
    local closest, dist = nil, math.huge
    for _, fruit in ipairs(getAllFruits()) do
        local d = (fruit.Position - root.Position).Magnitude
        if d < dist then
            dist = d
            closest = fruit
        end
    end
    return closest
end

-- Fruitスライド処理
RunService.RenderStepped:Connect(function(dt)
    if not fruitSlideEnabled then return end

    local root = getRoot()
    if not root then return end

    local fruit = getNearestFruit(root)
    if not fruit then return end

    -- 落下・慣性完全防止
    root.AssemblyLinearVelocity = Vector3.zero

    -- Y固定でスライド
    local targetPos = Vector3.new(
        fruit.Position.X,
        root.Position.Y + HEIGHT_OFFSET,
        fruit.Position.Z
    )

    local dir = targetPos - root.Position
    if dir.Magnitude < 2 then return end

    root.CFrame = root.CFrame + dir.Unit * SLIDE_SPEED * dt
end)




-- 新しいON/OFF変数
local fruitTPEnabled = false
local fruitCheckInterval = 0.2

-- Fruit瞬間TPループ
task.spawn(function()
    while true do
        task.wait(fruitCheckInterval)
        if not fruitTPEnabled then continue end

        local root = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then continue end

        -- 一番近いFruitを取得
        local fruit
        for _, v in ipairs(workspace:GetDescendants()) do
            if v.Name == "Fruit" and v:IsA("BasePart") then
                fruit = v
                break
            end
        end
        if not fruit then continue end

        local originalCFrame = root.CFrame
        root.CFrame = fruit.CFrame
        task.wait(0.05)
        root.CFrame = originalCFrame
    end
end)


--========================================================--
--                    🧩 GUI (Tab2)                      --
--========================================================--

local autoAimTab = Window:CreateTab("戦闘(BloxFruit用)", 4483362458)

-- ON / OFF
autoAimTab:CreateToggle({
	Name = "オートエイム",
	CurrentValue = false,
	Flag = "AutoAimToggle",
	Callback = function(v)
		autoAimEnabled = v
		print("[AutoAim]", v and "ON" or "OFF")
	end
})

-- FOV表示
autoAimTab:CreateToggle({
	Name = "FOV",
	CurrentValue = true,
	Flag = "AutoAimFOV",
	Callback = function(v)
		showFOV = v
	end
})

-- FOVサイズ
autoAimTab:CreateSlider({
	Name = "FOV大きさ",
	Range = {50, 400},
	Increment = 5,
	Suffix = "px",
	CurrentValue = FOV_RADIUS,
	Flag = "AutoAimFOVRadius",
	Callback = function(v)
		FOV_RADIUS = v
	end
})

-- 吸い付き強度
autoAimTab:CreateSlider({
	Name = "吸い付き強度",
	Range = {0.1, 1},
	Increment = 0.05,
	Suffix = "",
	CurrentValue = AIM_STRENGTH,
	Flag = "AutoAimStrength",
	Callback = function(v)
		AIM_STRENGTH = v
	end
})

-- Fruitスライド ON / OFF
autoAimTab:CreateToggle({
	Name = "Fruit自動回収",
	CurrentValue = false,
	Flag = "FruitSlideToggle",
	Callback = function(v)
		fruitSlideEnabled = v
		print("[FruitSlide]", v and "ON" or "OFF")
	end
})

autoAimTab:CreateToggle({
    Name = "Fruit瞬間回収",
    CurrentValue = false,
    Flag = "FruitTPToggle",
    Callback = function(v)
        fruitTPEnabled = v
        print("[FruitTP]", v and "ON" or "OFF")
    end
})



local fruitTab = Window:CreateTab("フルーツ一覧", 4483362458)
local fruitLabels = {} -- 既存ラベルを保持

-- ラベル更新関数
local function updateFruitLabels()
    -- 古いラベル削除
    for _, lbl in ipairs(fruitLabels) do
        lbl:Destroy()
    end
    fruitLabels = {}

    -- フルーツチェック
    for _, obj in ipairs(workspace:GetDescendants()) do
        if string.lower(obj.Name) == "fruit" then
           local lbl = fruitTab:CreateLabel(obj:GetFullName()) -- 文字列だけ渡す
            table.insert(fruitLabels, lbl)
        end
    end
end

-- 更新ボタン
fruitTab:CreateButton({
    Name = "更新",
    Callback = function()
        updateFruitLabels()
    end
})

-- 自動更新
task.spawn(function()
    while true do
        task.wait(1) -- 1秒ごと
        updateFruitLabels()
    end
end)




--============================
-- 設定値
--============================
local FollowDistance = 4   -- プレイヤー前方の距離
local AttractionRadius = 1 -- 半径20スタッド以内だけ吸引（初期値）

--============================
-- RayField UI
--============================
local EnemyTab = Window:CreateTab("敵処理", 4483362458)

-- 距離スライダー
local DistanceSlider = EnemyTab:CreateSlider({
    Name = "敵の前方距離",
    Range = {1, 80},
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
    Name = "スライド取得",
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
