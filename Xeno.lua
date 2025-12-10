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

--================ Helper =================
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
local playerTab = Window:CreateTab("Player", 4483362458)

-- スピードオンオフ
local speedEnabled = false
playerTab:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Flag = "SpeedToggle",
    Callback = function(val)
        speedEnabled = val
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

-- スライダー（オフ）
local speedOff = speedDefaultOff
playerTab:CreateSlider({
    Name = "Speed Off",
    Range = {speedMin, speedMax},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = speedDefaultOff,
    Flag = "SpeedOffSlider",
    Callback = function(val)
        speedOff = val
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

-- 壁貫通
playerTab:CreateToggle({
    Name = "WallClip",
    CurrentValue = false,
    Flag = "WallClip",
    Callback = function(val)
        wallClipEnabled = val
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
    if hum then
        hum.WalkSpeed = speedEnabled and speedOn or speedOff
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

-- 壁貫通常時更新
RunService.RenderStepped:Connect(function()
    setWallClip(wallClipEnabled)
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
--                     🔥 Combat Tab                      --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")

local combatTab = Window:CreateTab("Combat", 4483362458)

--============================
-- 状態変数
--============================
local selectedTarget = nil
local followActive = false
local freeCamActive = false
local originalPos = nil
local originalCamType = nil
local savedY = 0   -- 落下防止用

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
    Name = "張り付き（Follow）",
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
        if state then
            if myHRP then originalPos = myHRP.CFrame end
            RayField:Notify({
                Title = "張り付き開始",
                Content = selectedTarget.Name .. " の後ろへ追従中",
                Duration = 3
            })
        else
            if originalPos and myHRP then
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
-- ★ 敵頭に追従する FreeCamera（ホイールズーム版）
--============================

local freeViewActive = false
local rotX = 0
local rotY = 0
local sensitivity = 0.25

local zoomDist = 10
local minZoom = 3
local maxZoom = 35

local originalCamMode

-- マウスドラッグで回転
UIS.InputChanged:Connect(function(input)
    if freeViewActive and input.UserInputType == Enum.UserInputType.MouseMovement then
        rotY = rotY - input.Delta.X * sensitivity
        rotX = math.clamp(rotX - input.Delta.Y * sensitivity, -80, 80)
    end
end)

-- ホイールでズーム
UIS.InputChanged:Connect(function(input)
    if not freeViewActive then return end
    if input.UserInputType == Enum.UserInputType.MouseWheel then
        zoomDist = math.clamp(zoomDist - input.Position.Z * 2, minZoom, maxZoom)
    end
end)

combatTab:CreateToggle({
    Name = "敵の頭に視点固定（追従カメラ）",
    CurrentValue = false,
    Callback = function(state)

        if not selectedTarget then
            RayField:Notify({
                Title = "エラー",
                Content = "先にターゲット選んで！",
                Duration = 3
            })
            return
        end

        freeViewActive = state

        if state then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Anchored = true end

            originalCamMode = camera.CameraType
            camera.CameraType = Enum.CameraType.Scriptable

            RayField:Notify({
                Title = "追従視点 ON",
                Content = "敵の頭を中心に自由に視点回せるよ！",
                Duration = 3
            })
        else
            camera.CameraType = originalCamMode or Enum.CameraType.Custom

            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Anchored = false end

            RayField:Notify({
                Title = "追従視点 OFF",
                Content = "元の視点に戻したよ！",
                Duration = 3
            })
        end
    end
})

-- カメラ追従ループ
RunService.RenderStepped:Connect(function()
    if freeViewActive and selectedTarget and selectedTarget.Character then
        
        local head = selectedTarget.Character:FindFirstChild("Head")
        if not head then return end

        local headPos = head.Position

        -- カメラ位置を球面座標で計算
        local camOffset =
            CFrame.Angles(math.rad(rotX), math.rad(rotY), 0)
            * Vector3.new(0, 0, zoomDist)

        local camPos = headPos + camOffset

        -- カメラを対象の頭を見るようにセット
        camera.CFrame = CFrame.new(camPos, headPos)
    end
end)

-- カメラ追従ループ
RunService.RenderStepped:Connect(function()
    if freeViewActive and selectedTarget and selectedTarget.Character then
        local head = selectedTarget.Character:FindFirstChild("Head")
        if not head then return end

        local basePos = head.Position + Vector3.new(0, 1.5, 0)

        local rot = CFrame.Angles(
            math.rad(camRot.X),
            math.rad(camRot.Y),
            0
        )

        camera.CFrame = CFrame.new(basePos) * rot
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
        if plr.Character then
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


--============================
-- 設定値
--============================
local FollowDistance = 4   -- プレイヤー前方の距離
local AttractionRadius = 20 -- 半径20スタッド以内だけ吸引（初期値）

--============================
-- RayField UI
--============================
local EnemyTab = Window:CreateTab("EnemyControl", 4483362458)

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
local enemyFolder = workspace:WaitForChild("Enemies")  -- 敵フォルダ名を合わせてね

run.RenderStepped:Connect(function()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, enemy in pairs(enemyFolder:GetChildren()) do
        local eHRP = enemy:FindFirstChild("HumanoidRootPart")
        if eHRP then
            local distance = (eHRP.Position - hrp.Position).Magnitude
            if distance <= AttractionRadius then
                -- プレイヤー前方 FollowDistance スタッドに固定
                eHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, -FollowDistance)
            end
        end
    end
end)

