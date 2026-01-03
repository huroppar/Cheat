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
-- Fly機能（スマホスティック対応・重力のみ無効）
--=============================
local flyActive = false
local flySpeed = 50

-- Fly ON / OFF
playerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(state)
        flyActive = state
        local _, hum, root = getCharacter()
        if not hum or not root then return end
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
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

-- 仮想スティック方向取得用関数
-- ゲームの移動スティックモジュールに合わせて書き換え
local function getStickDirection()
    -- 例: Vector3(x, y, z)を返す
    -- yは上下（ジャンプ/降下）対応
    -- x, zは前後左右
    -- 実際はゲームのMobileInputManagerやTouchModuleから取得
    return Vector3.zero
end

-- Fly制御
RunService.RenderStepped:Connect(function(dt)
    if not flyActive then return end
    local _, hum, root = getCharacter()
    if not hum or not root then return end

    -- 落下防止（重力キャンセル）
    root.AssemblyLinearVelocity = Vector3.zero

    local move = getStickDirection() -- スティックの方向
    if move.Magnitude > 0 then
        root.CFrame = root.CFrame + (move.Unit * flySpeed * dt)
    end
end)

-- キャラリスポーン時のジャンプ設定
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





--================================
-- ESP TAB
--================================
local espTab = Window:CreateTab("ESP", 4483362458)

--================================
-- Services（ESP専用で再定義）
--================================
local Lighting = game:GetService("Lighting")
local Camera = workspace.CurrentCamera


--================================
-- 設定フラグ
--================================
local showAllyHighlight = false
local showEnemyHighlight = false
local showNameESP = false
local showLineESP = false
local fullBrightEnabled = false
local worldXray = false
local playerXray = false
local itemHighlight = false
local chestHighlight = false
local hitboxEnabled = false
local worldXrayAlpha = 0.6
local playerXrayAlpha = 0.6


--================================
-- 管理テーブル
--================================
local highlights = {}
local drawings = {}
local hitboxes = {}
local lineDrawings = {}
local chestHighlights = {}
local originalSize = {}

--================================
-- ユーティリティ
--================================
local function isEnemy(player)
    -- チーム判定（無いゲームでも動く）
    if not LocalPlayer.Team or not player.Team then
        return player ~= LocalPlayer
    end
    return player.Team ~= LocalPlayer.Team
end

--================================
-- ハイライト生成
--================================
local function createHighlight(char, color)
    if highlights[char] then return end
    local hl = Instance.new("Highlight")
    hl.FillColor = color
    hl.OutlineColor = Color3.new(1,1,1)
    hl.FillTransparency = 0.5
    hl.Parent = char
    highlights[char] = hl
end

local function removeHighlight(char)
    if highlights[char] then
        highlights[char]:Destroy()
        highlights[char] = nil
    end
end

--================================
-- Name ESP & Line ESP
--================================
RunService.RenderStepped:Connect(function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local char = plr.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

                -- Name ESP
                if showNameESP and onScreen then
                    if not drawings[plr] then
                        local text = Drawing.new("Text")
                        text.Center = true
                        text.Outline = true
                        text.Size = 16
                        drawings[plr] = text
                    end

                    local dist = math.floor((Camera.CFrame.Position - hrp.Position).Magnitude)
                    drawings[plr].Visible = true
                    drawings[plr].Text = plr.Name .. " | " .. dist .. "m"
                    drawings[plr].Position = Vector2.new(pos.X, pos.Y - 25)
                    drawings[plr].Color = isEnemy(plr) and Color3.new(1,0,0) or Color3.new(0,1,0)
                elseif drawings[plr] then
                    drawings[plr].Visible = false
                end

                -- Line ESP
                if showLineESP and onScreen then
                    if not lineDrawings[plr] then
                        local line = Drawing.new("Line")
                        line.Thickness = 1.5
                        lineDrawings[plr] = line
                    end

                    local line = lineDrawings[plr]
                    line.Visible = true
                    line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    line.To = Vector2.new(pos.X, pos.Y)
                    line.Color = Color3.new(1, 0, 0)
                elseif lineDrawings[plr] then
                    lineDrawings[plr].Visible = false
                end
            end
        end
    end
end)


Players.PlayerRemoving:Connect(function(plr)
    -- Name ESP
    if drawings[plr] then
        drawings[plr]:Remove()
        drawings[plr] = nil
    end

    -- Line ESP
    if lineDrawings[plr] then
        lineDrawings[plr]:Remove()
        lineDrawings[plr] = nil
    end

    -- Highlight
    if plr.Character then
        removeHighlight(plr.Character)
    end

    -- HitBoxサイズ記録
    originalSize[plr] = nil
end)


--================================
-- FullBright
--================================
local fullBrightConn
local originalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd
}

espTab:CreateToggle({
    Name = "FullBright",
    CurrentValue = false,
    Callback = function(v)
        if v then
            if fullBrightConn then fullBrightConn:Disconnect() end
            fullBrightConn = RunService.RenderStepped:Connect(function()
                Lighting.Brightness = 5
                Lighting.ClockTime = 12
                Lighting.FogEnd = 1e9
            end)
        else
            if fullBrightConn then
                fullBrightConn:Disconnect()
                fullBrightConn = nil
            end
            Lighting.Brightness = originalLighting.Brightness
            Lighting.ClockTime = originalLighting.ClockTime
            Lighting.FogEnd = originalLighting.FogEnd
        end
    end
})


--================================
-- プレイヤー Highlight
--================================
espTab:CreateToggle({
    Name = "味方ハイライト",
    CurrentValue = false,
    Callback = function(v)
        showAllyHighlight = v
    end
})

espTab:CreateToggle({
    Name = "敵ハイライト",
    CurrentValue = false,
    Callback = function(v)
        showEnemyHighlight = v
    end
})

RunService.Stepped:Connect(function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character then
            if plr ~= LocalPlayer then
                if isEnemy(plr) and showEnemyHighlight then
                    createHighlight(plr.Character, Color3.new(1,0,0))
                elseif not isEnemy(plr) and showAllyHighlight then
                    createHighlight(plr.Character, Color3.new(0,1,0))
                else
                    removeHighlight(plr.Character)
                end
            end
        end
    end
end)

--================================
-- Name / Line ESP Toggles
--================================
espTab:CreateToggle({
    Name = "名前ESP",
    CurrentValue = false,
    Callback = function(v)
        showNameESP = v
    end
})

espTab:CreateToggle({ 
	Name="線ESP", 
	CurrentValue=false, 		
	Callback=function(v)
		showLineESP = v
	end
})

--================================
-- X-Ray
--================================
espTab:CreateToggle({
    Name = "ワールドX-Ray",
    CurrentValue = false,
    Callback = function(v)
        worldXray = v
        for _, p in ipairs(workspace:GetDescendants()) do
            if p:IsA("BasePart") then
                p.LocalTransparencyModifier = v and worldXrayAlpha or 0
            end
        end
    end
})

espTab:CreateSlider({
    Name = "ワールドX-Ray透明度",
    Range = {0, 0.95},
    Increment = 0.05,
    Suffix = "Alpha",
    CurrentValue = 0.6,
    Callback = function(v)
        worldXrayAlpha = v
        if worldXray then
            for _, p in ipairs(workspace:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.LocalTransparencyModifier = v
                end
            end
        end
    end
})

espTab:CreateToggle({
    Name = "プレイヤーX-Ray",
    CurrentValue = false,
    Callback = function(v)
        playerXray = v
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Character then
                for _, p in ipairs(plr.Character:GetDescendants()) do
                    if p:IsA("BasePart") then
                        p.LocalTransparencyModifier = v and playerXrayAlpha or 0
                    end
                end
            end
        end
    end
})

espTab:CreateSlider({
    Name = "プレイヤーX-Ray透明度",
    Range = {0, 0.95},
    Increment = 0.05,
    Suffix = "Alpha",
    CurrentValue = 0.6,
    Callback = function(v)
        playerXrayAlpha = v
        if playerXray then
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr.Character then
                    for _, p in ipairs(plr.Character:GetDescendants()) do
                        if p:IsA("BasePart") then
                            p.LocalTransparencyModifier = v
                        end
                    end
                end
            end
        end
    end
})

--================================
-- アイテム / チェスト
--================================
local function highlightByName(keyword, color)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and string.find(obj.Name:lower(), keyword) then
            local adornee = obj:FindFirstChildWhichIsA("BasePart")
            if adornee then
                createHighlight(adornee, color)
            end
        end
    end
end


espTab:CreateToggle({
    Name = "アイテムハイライト",
    CurrentValue = false,
    Callback = function(v)
        itemHighlight = v
        if v then
            highlightByName("item", Color3.fromRGB(0,255,255))
        end
    end
})

espTab:CreateToggle({
    Name = "チェストハイライト",
    CurrentValue = false,
    Callback = function(v)
        chestHighlight = v

        if v then
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("Model") and string.find(obj.Name:lower(), "chest") then
                    if not chestHighlights[obj] then
                        local hl = Instance.new("Highlight")
                        hl.FillColor = Color3.fromRGB(255, 215, 0)
                        hl.FillTransparency = 0.4
                        hl.Parent = obj
                        chestHighlights[obj] = hl
                    end
                end
            end
        else
            for _, hl in pairs(chestHighlights) do
                if hl then hl:Destroy() end
            end
            chestHighlights = {}
        end
    end
})


--================================
-- HitBox
--================================
-- HitBox倍率
local hitboxScale = 1

-- HitBoxトグル
espTab:CreateToggle({
    Name = "HitBox表示",
    CurrentValue = false,
    Callback = function(v)
        hitboxEnabled = v

        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    if v then
                        if not originalSize[plr] then
                            originalSize[plr] = hrp.Size
                        end

                        -- キャラサイズに応じてHitBoxを拡大
                        local baseScale = math.max(hrp.Size.X, hrp.Size.Y, hrp.Size.Z) / 2
                        local newSize = Vector3.new(baseScale*2, baseScale*2, baseScale*2) * hitboxScale
                        hrp.Size = newSize
                        hrp.Transparency = 0.5
                        hrp.CanCollide = false
                        hrp.Color = isEnemy(plr) and Color3.new(1,0,0) or Color3.new(1,1,1)
                    else
                        if originalSize[plr] then
                            hrp.Size = originalSize[plr]
                        end
                        hrp.Transparency = 1
                    end
                end
            end
        end
    end
})

-- HitBoxスライダー
espTab:CreateSlider({
    Name = "HitBox倍率",
    Range = {1, 20}, -- 1倍～10倍まで
    Increment = 0.1,
    Suffix = "倍",
    CurrentValue = 1,
    Callback = function(v)
        hitboxScale = v

        -- HitBox有効時は即反映
        if hitboxEnabled then
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and originalSize[plr] then
                        local baseScale = math.max(originalSize[plr].X, originalSize[plr].Y, originalSize[plr].Z) / 2
                        hrp.Size = Vector3.new(baseScale*2, baseScale*2, baseScale*2) * hitboxScale
                        hrp.Transparency = 0.5
                    end
                end
            end
        end
    end
})
--================================
-- 自分の攻撃HitBox拡大
--================================
-- 元サイズ保存用
local originalSize = nil
local hitboxScale = 1

-- HitBox拡大用スライダー
espTab:CreateSlider({
    Name = "攻撃範囲倍率",
    Range = {1, 10},
    Increment = 0.1,
    Suffix = "倍",
    CurrentValue = 1,
    Callback = function(v)
        hitboxScale = v

        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                if not originalSize then
                    originalSize = hrp.Size -- 元サイズを保存
                end
                -- 倍率に応じてサイズ変更
                hrp.Size = originalSize * hitboxScale
            end
        end
    end
})


--========================================================--
--                     🔥 Combat Tab + Invisible 完全統合版（地面補正付き）
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera



local combatTab = Window:CreateTab("戦闘", 4483362458)

--============================--
-- 状態変数
--============================--
local SAFE_Y = -200000
local selectedTarget = nil
local followActive = false
local followMode = nil -- "normal", "v2", "under"
local originalPos_Follow = nil

local tracerActive = false
local tracerLine = Drawing.new("Line")
tracerLine.Visible = false
tracerLine.Thickness = 2
tracerLine.Transparency = 1
tracerLine.Color = Color3.fromRGB(0,255,255)

local noclipConn = nil
local noclipEnabled = false
local originalCanCollide = {}

--============================--
-- Invisible 用
--============================--
local invisible = false
local parts = {}
local invisibleKey = Enum.KeyCode.G
local keybindEnabled = true
local character, humanoid, rootPart

local function setupCharacter()
    character = player.Character or player.CharacterAdded:Wait()
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    parts = {}
    for _, obj in pairs(character:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Transparency == 0 then
            table.insert(parts, obj)
        end
    end
end

setupCharacter()
player.CharacterAdded:Connect(function()
    setupCharacter()
    if invisible then
        for _, part in pairs(parts) do
            part.Transparency = 0.5
        end
    end
end)

local function setInvisible(value)
    invisible = value
    for _, part in pairs(parts) do
        part.Transparency = invisible and 0.5 or 0
    end

    -- 画面通知
    Rayfield:Notify({
        Title = "Invisible",
        Content = invisible and "透明化 ON" or "透明化 OFF",
        Duration = 3
    })
end

--============================--
-- プレイヤー選択
--============================--
_G.SetTarget = function(tar)
    if typeof(tar) == "Instance" and tar:FindFirstChild("Humanoid") then
        selectedTarget = tar
    end
end

--============================--
-- Noclip
--============================--
local function enableNoclip()
    if noclipConn then return end
    if not character then return end
    for _,p in ipairs(character:GetDescendants()) do
        if p:IsA("BasePart") then
            originalCanCollide[p] = p.CanCollide
        end
    end
    noclipConn = RunService.Stepped:Connect(function()
        if not character then return end
        for _,p in ipairs(character:GetDescendants()) do
            if p:IsA("BasePart") then
                p.CanCollide = false
            end
        end
    end)
end

local function disableNoclip()
    if noclipConn then
        noclipConn:Disconnect()
        noclipConn = nil
    end
    if not character then return end
    for p,canCollide in pairs(originalCanCollide) do
        if p and p.Parent then
            p.CanCollide = canCollide
        end
    end
    originalCanCollide = {}
end

--============================--
-- Follow系
--============================--
local function GetHRP(char) return char and char:FindFirstChild("HumanoidRootPart") end
local function GetHumanoid(char) return char and char:FindFirstChildOfClass("Humanoid") end

local function EnableFollow(mode)
    if not selectedTarget then return end
    followActive = true
    followMode = mode
    local hrp = GetHRP(player.Character)
    if hrp and not originalPos_Follow then
        originalPos_Follow = hrp.CFrame -- 下向き張り付き前の位置を保存
    end
end

local function ReturnToOriginalPosition()
    local hrp = GetHRP(player.Character)
    local hum = GetHumanoid(player.Character)
    if not hrp or not originalPos_Follow then return end

    hrp.CFrame = originalPos_Follow
    hum.PlatformStand = false
    disableNoclip()
    noclipEnabled = false
    originalPos_Follow = nil
end

local function DisableFollow()
    followActive = false
    followMode = nil
    ReturnToOriginalPosition()
end


--============================--
-- GUI設定
--============================--
combatTab:CreateButton({
    Name = "選択中のプレイヤーへ TP",
    Callback = function()
        if selectedTarget and selectedTarget.Character and GetHRP(selectedTarget.Character) then
            player.Character:PivotTo(GetHRP(selectedTarget.Character).CFrame * CFrame.new(0,0,3))
        else
            RayField:Notify({Title="エラー", Content="ターゲット無効！", Duration=3})
        end
    end
})

combatTab:CreateToggle({Name="普通の張り付き", Callback=function(v) if v then EnableFollow("normal") else DisableFollow() end end})
combatTab:CreateToggle({Name="張り付きv2（BloxFruit使用可）", Callback=function(v) if v then EnableFollow("v2") else DisableFollow() end end})
combatTab:CreateToggle({Name="下向き張り付き", Callback=function(v) if v then EnableFollow("under") else DisableFollow() end end})
combatTab:CreateToggle({Name="ターゲット線", Callback=function(v) tracerActive=v if not v then tracerLine.Visible=false end end})

combatTab:CreateToggle({
    Name = "Invisible(ゲームによっては使用不可)",
    CurrentValue = false,
    Callback = function(v) setInvisible(v) end
})

combatTab:CreateToggle({
    Name = "キーで切替有効",
    CurrentValue = true,
    Callback = function(v) keybindEnabled = v end
})

combatTab:CreateInput({
    Name = "Invisible キー設定",
    PlaceholderText = "例: G",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        local success, kc = pcall(function() return Enum.KeyCode[text:upper()] end)
        if success and kc then
            invisibleKey = kc
            RayField:Notify({Title="設定完了", Content="Invisibleキーを "..text:upper().." に設定しました", Duration=3})
        else
            RayField:Notify({Title="エラー", Content="無効なキー名です", Duration=3})
        end
    end
})



--============================--
-- プレイヤー一覧 + HP
--============================--
combatTab:CreateSection("プレイヤー一覧")
local playerButtons = {}

local function GetHP(plr)
    local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
    if hum then return math.floor(hum.Health), math.floor(hum.MaxHealth) end
    return 0,0
end

local function CreatePlayerButton(plr)
    local hp,maxhp = GetHP(plr)
    local btn = combatTab:CreateButton({
        Name = plr.Name.." ["..hp.."/"..maxhp.."]",
        Callback = function()
            selectedTarget = plr
            RayField:Notify({Title="選択", Content=plr.Name.." をターゲットにしたよ！", Duration=3})
        end
    })
    playerButtons[plr] = btn
end

local function UpdatePlayerList()
    local current = {}
    for _,p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            current[p] = true
            if not playerButtons[p] then CreatePlayerButton(p) end
        end
    end
    for plr,btn in pairs(playerButtons) do
        if not current[plr] then
            pcall(function() btn:Remove() end)
            playerButtons[plr] = nil
        end
    end
end

UpdatePlayerList()
Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)

--============================--
-- キー入力で Invisible 切替
--============================--
player:GetMouse().KeyDown:Connect(function(key)
    if not keybindEnabled then return end
    if key:upper() == tostring(invisibleKey):gsub("Enum.KeyCode.","") then
        setInvisible(not invisible)
    end
end)

--============================--
-- Heartbeat: Invisible 本体下移動（元仕様通り）
--============================--
RunService.Heartbeat:Connect(function()
    if invisible and rootPart and humanoid then
        local cf = rootPart.CFrame
        local camOffset = humanoid.CameraOffset
        local hidden = cf * CFrame.new(0, -SAFE_Y, 0)
        rootPart.CFrame = hidden
        humanoid.CameraOffset = hidden:ToObjectSpace(CFrame.new(cf.Position)).Position
        game:GetService("RunService").RenderStepped:Wait()
        rootPart.CFrame = cf
        humanoid.CameraOffset = camOffset
    end
end)

--============================--
-- RenderStepped: Follow + Tracer
--============================--
RunService.RenderStepped:Connect(function(dt)
    if not character or not humanoid or not rootPart then return end

    -- 張り付き中は物理制御で重力無効
    if followActive then
        rootPart.AssemblyLinearVelocity = Vector3.new(0,0,0)
    end

    -- ==== Follow ====
    if followActive and selectedTarget and selectedTarget.Character then
        local targetHRP = GetHRP(selectedTarget.Character)
        if targetHRP then
            if followMode=="normal" then
                rootPart.CFrame = targetHRP.CFrame * CFrame.new(0,0,7)
            elseif followMode=="v2" then
                local dVec = targetHRP.Position - rootPart.Position
                local dist = dVec.Magnitude
                local speed = 300
                if dist > 200 then
                    rootPart.CFrame = rootPart.CFrame:Lerp(CFrame.new(rootPart.Position + dVec.Unit * speed * dt), 1)
                else
                    rootPart.CFrame = rootPart.CFrame:Lerp(targetHRP.CFrame * CFrame.new(0,0,7), 0.2)
                end
            elseif followMode=="under" then
                if not noclipEnabled then
                    enableNoclip()
                    noclipEnabled = true
                end
                humanoid.PlatformStand = true
                local goalCF = targetHRP.CFrame * CFrame.new(0,-12,0) * CFrame.Angles(math.rad(90),0,0)
                rootPart.CFrame = rootPart.CFrame:Lerp(goalCF, 0.3)
            end
        end
    else
        humanoid.PlatformStand = false
        if noclipEnabled then
            disableNoclip()
            noclipEnabled = false
        end
    end

    -- ==== Tracer ====
    if tracerActive and selectedTarget and selectedTarget.Character then
        local targetHRP = GetHRP(selectedTarget.Character)
        if targetHRP then
            local p1,v1 = camera:WorldToViewportPoint(rootPart.Position)
            local p2,v2 = camera:WorldToViewportPoint(targetHRP.Position)
            tracerLine.Visible = v1 and v2
            if v1 and v2 then
                tracerLine.From = Vector2.new(p1.X,p1.Y)
                tracerLine.To   = Vector2.new(p2.X,p2.Y)
            end
        else
            tracerLine.Visible = false
        end
    else
        tracerLine.Visible = false
    end
end)
--============================--
-- HP更新
--============================--
RunService.Heartbeat:Connect(function()
    for plr, btn in pairs(playerButtons) do
        if btn then
            local name = plr.Name or "Unknown"
            local hp,maxhp = GetHP(plr)
            hp = hp or 0
            maxhp = maxhp or 0
            pcall(function()
                btn:Set(name.." ["..hp.."/"..maxhp.."]")
            end)
        end
    end
end)



--========================================================--
--                 🔥 World Of Stand                     --
--========================================================--

--================= Services =================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local humanoid, rootPart
local parts = {}



--================= GUI =================
local StandTab = Window:CreateTab("スタンドの世界", 4483362458)

--========================================================--
--                 🔒 Character Setup                    --
--========================================================--
local function setupCharacter()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    humanoid = char:WaitForChild("Humanoid")
    rootPart = char:WaitForChild("HumanoidRootPart")

    parts = {}
    for _, v in ipairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            table.insert(parts, v)
        end
    end
end

setupCharacter()
LocalPlayer.CharacterAdded:Connect(function()
    invisibleEnabled = false
    setupCharacter()
end)


--========================================================--
--                 📦 Chest System                       --
--========================================================--
local currentChest = 0
local maxChest = 54

local availableChests = {}
for i = 1, maxChest do
    table.insert(availableChests, tostring(i))
end

local chestLabel = StandTab:CreateLabel("現在のチェスト: 0")

--================= Dropdown =================
local isDropdownInitialized = false

local chestDropdown = StandTab:CreateDropdown({
    Name = "開くチェストを選択",
    Options = availableChests,
    CurrentOption = {availableChests[1]},
    MultipleOptions = false,
    Callback = function(option)
        if not isDropdownInitialized then return end
        local number = tonumber(option[1])
        if not number then return end

        local chest = Workspace:FindFirstChild(tostring(number))
        if chest and chest.PrimaryPart then
            setInvisible(false)
            LocalPlayer.Character:SetPrimaryPartCFrame(
                CFrame.new(chest.PrimaryPart.Position + Vector3.new(0, 7, 0))
            )
            currentChest = number
            chestLabel:Set("現在のチェスト: " .. number)
        end
    end
})

isDropdownInitialized = true

--================= Input =================
StandTab:CreateInput({
    Name = "チェスト番号入力",
    PlaceholderText = "1〜" .. maxChest,
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        local number = tonumber(text)
        if not number or number < 1 or number > maxChest then return end

        local chest = Workspace:FindFirstChild(tostring(number))
        if chest and chest.PrimaryPart then
            setInvisible(false)
            LocalPlayer.Character:SetPrimaryPartCFrame(
                CFrame.new(chest.PrimaryPart.Position + Vector3.new(0, 7, 0))
            )
            currentChest = number
            chestLabel:Set("現在のチェスト: " .. number)
        end
    end
})

--================= Next Chest =================
StandTab:CreateButton({
    Name = "次のチェストにTP",
    Callback = function()
        currentChest += 1
        if currentChest > maxChest then currentChest = 1 end

        local chest = Workspace:FindFirstChild(tostring(currentChest))
        if chest and chest.PrimaryPart then
            setInvisible(false)
            LocalPlayer.Character:SetPrimaryPartCFrame(
                CFrame.new(chest.PrimaryPart.Position + Vector3.new(0, 7, 0))
            )
            chestLabel:Set("現在のチェスト: " .. currentChest)
        end
    end
})

--================= Chest Auto Update =================
RunService.RenderStepped:Connect(function()
    local changed = false
    for i = #availableChests, 1, -1 do
        if not Workspace:FindFirstChild(availableChests[i]) then
            table.remove(availableChests, i)
            changed = true
        end
    end
    if changed then
        chestDropdown:Refresh(availableChests)
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



--================================
-- Enemy Head HitBox
--================================

local headHitboxEnabled = false
local headScale = 1
local originalHeadSize = {}

-- 敵Head拡大トグル
autoAimTab:CreateToggle({
    Name = "敵Head拡大",
    CurrentValue = false,
    Callback = function(v)
        headHitboxEnabled = v

        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and isEnemy(plr) and plr.Character then
                local head = plr.Character:FindFirstChild("Head")
                if head then
                    if v then
                        if not originalHeadSize[plr] then
                            originalHeadSize[plr] = head.Size
                        end

                        head.Size = originalHeadSize[plr] * headScale
                        head.Transparency = 0.5
                        head.CanCollide = false
                        head.Massless = true
                    else
                        if originalHeadSize[plr] then
                            head.Size = originalHeadSize[plr]
                        end
                        head.Transparency = 0
                    end
                end
            end
        end
    end
})

-- 敵Head倍率スライダー
autoAimTab:CreateSlider({
    Name = "敵Head倍率",
    Range = {1, 15000},
    Increment = 0.1,
    Suffix = "倍",
    CurrentValue = 1,
    Callback = function(v)
        headScale = v

        if headHitboxEnabled then
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and isEnemy(plr) and plr.Character then
                    local head = plr.Character:FindFirstChild("Head")
                    if head and originalHeadSize[plr] then
                        head.Size = originalHeadSize[plr] * headScale
                        head.Transparency = 0.5
                    end
                end
            end
        end
    end
})



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



--================================
-- Services
--================================
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId
local JobId = game.JobId


local autoRejoinEnabled = false
local rejoinHotkeyEnabled = false
local rejoinKey = Enum.KeyCode.F6

local lastPrivateServerCode = nil
local privateServerLink = ""

local Network = Stats:WaitForChild("Network")


local serverTab = Window:CreateTab("Server", 4483362458)

local pingLabel = serverTab:CreateLabel("Ping: -- ms")

RunService.RenderStepped:Connect(function()
    local pingItem = Network.ServerStatsItem:FindFirstChild("Data Ping")
    if pingItem then
        local ping = math.floor(pingItem:GetValue())
        pingLabel:Set("Ping: " .. ping .. " ms")
    end
end)


serverTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        TeleportService:Teleport(PlaceId, LocalPlayer)
    end
})


serverTab:CreateToggle({
    Name = "Rejoin Hotkey (F6)",
    CurrentValue = false,
    Callback = function(v)
        rejoinHotkeyEnabled = v
    end
})

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if rejoinHotkeyEnabled and input.KeyCode == rejoinKey then
        TeleportService:Teleport(PlaceId, LocalPlayer)
    end
end)


serverTab:CreateInput({
    Name = "Private Server Link",
    PlaceholderText = "...privateServerLinkCode=XXXX",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        privateServerLink = text
    end
})

serverTab:CreateButton({
    Name = "Join Private Server",
    Callback = function()
        local code = privateServerLink:match("privateServerLinkCode=([%w%-]+)")
        if not code then return end

        lastPrivateServerCode = code

        TeleportService:TeleportToPrivateServer(
            PlaceId,
            code,
            { LocalPlayer }
        )
    end
})


serverTab:CreateButton({
    Name = "Join Random Server",
    Callback = function()
        TeleportService:Teleport(PlaceId, LocalPlayer)
    end
})



serverTab:CreateButton({
    Name = "Join Low Player Server",
    Callback = function()
        local servers = {}
        local cursor = ""

        repeat
            local url = string.format(
                "https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100%s",
                PlaceId,
                cursor ~= "" and "&cursor=" .. cursor or ""
            )

            local res = HttpService:JSONDecode(game:HttpGet(url))
            for _, s in ipairs(res.data) do
                if s.playing < s.maxPlayers and s.id ~= JobId then
                    table.insert(servers, s.id)
                end
            end

            cursor = res.nextPageCursor or ""
        until #servers > 0 or cursor == ""

        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(
                PlaceId,
                servers[math.random(#servers)],
                LocalPlayer
            )
        end
    end
})


serverTab:CreateButton({
    Name = "Join Friend Server",
    Callback = function()
        local pages = Players:GetFriendsAsync(LocalPlayer.UserId)
        for _, friend in ipairs(pages:GetCurrentPage()) do
            if friend.IsOnline and friend.PlaceId == PlaceId then
                TeleportService:TeleportToPlaceInstance(
                    PlaceId,
                    friend.GameId,
                    LocalPlayer
                )
                break
            end
        end
    end
})


serverTab:CreateToggle({
    Name = "Auto Rejoin (Kick対応)",
    CurrentValue = false,
    Callback = function(v)
        autoRejoinEnabled = v
    end
})

GuiService.ErrorMessageChanged:Connect(function(msg)
    if not autoRejoinEnabled then return end

    task.wait(2)

    if lastPrivateServerCode then
        TeleportService:TeleportToPrivateServer(
            PlaceId,
            lastPrivateServerCode,
            { LocalPlayer }
        )
    else
        TeleportService:Teleport(PlaceId, LocalPlayer)
    end
end)
