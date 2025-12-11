-- OrionLibロード
local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/WRUyYTdY')))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

--================ 設定 =================
local XRayPlayersEnabled = false
local XRayWorldEnabled = false
local XRayTransparency = 0.6
local FullBrightEnabled = false

-- FullBright保存用
local Lighting = game:GetService("Lighting")
local FB_Original = {
	Brightness = Lighting.Brightness,
	ClockTime = Lighting.ClockTime,
	Ambient = Lighting.Ambient,
	OutdoorAmbient = Lighting.OutdoorAmbient
}

-- X-Ray キャラ透過
local function SetCharacterXray(character, value)
	if not character then return end
	for _, obj in ipairs(character:GetDescendants()) do
		if obj:IsA("BasePart") then
			obj.LocalTransparencyModifier = value
		end
	end
end

-- ワールド透過
local originalLocalTransparency = {}
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

	for _, part in ipairs(workspace:GetDescendants()) do
		if part:IsA("BasePart") and part ~= workspace.Terrain then
			if part.CanCollide and part.Transparency < 1 then
				if originalLocalTransparency[part] == nil then
					originalLocalTransparency[part] = part.LocalTransparencyModifier or 0
				end
				pcall(function() part.LocalTransparencyModifier = XRayTransparency end)
			end
		end
	end
end

-- FullBright適用
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

--===================== ESP 更新ループ =====================
local showPlayerESP, showEnemyESP, showItemESP = false, false, false
local highlights = {}

local function createHighlight(obj, color)
	local hl = Instance.new("Highlight")
	hl.Adornee = obj
	hl.FillColor = color
	hl.FillTransparency = 0.5
	hl.OutlineTransparency = 1
	hl.Parent = obj
	return hl
end

RunService.RenderStepped:Connect(function()
	-- プレイヤーESP
	for _, pl in pairs(Players:GetPlayers()) do
		if pl ~= player and pl.Character and pl.Character:FindFirstChild("Humanoid") then
			local hum = pl.Character.Humanoid
			if showPlayerESP then
				if not highlights[pl] then
					highlights[pl] = createHighlight(pl.Character, Color3.new(0,1,0))
				end
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

	-- 敵ESP（workspace内のModelにHumanoidがある場合）
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

	-- アイテムESP（仮にworkspace.Itemsに存在する場合）
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
end)

--===================== OrionLib GUI =====================
local Window = OrionLib:MakeWindow({Name = "Utility Hub v5", HidePremium = false, SaveConfig = true, ConfigFolder = "UtilityHubConfigs"})

local espTab = Window:MakeTab({Name = "ESP", Icon = "rbxassetid://4483362458", PremiumOnly = false})

-- プレイヤーX-Ray
espTab:AddToggle({
	Name = "X-Ray: プレイヤー透過",
	Default = false,
	Callback = function(val)
		XRayPlayersEnabled = val
		if val then SetCharacterXray(player.Character, XRayTransparency) end
		OrionLib:MakeNotification({Name="X-Ray", Content=val and "プレイヤー透過 ON" or "OFF", Time=2})
	end
})

-- ワールドX-Ray
espTab:AddToggle({
	Name = "X-Ray: ワールド透過",
	Default = false,
	Callback = function(val)
		XRayWorldEnabled = val
		if val then SetWorldXray(XRayTransparency) else SetWorldXray(0) end
		OrionLib:MakeNotification({Name="X-Ray", Content=val and "ワールド透過 ON" or "OFF", Time=2})
	end
})

-- 透過度スライダー
espTab:AddSlider({
	Name = "透過度",
	Min = 0,
	Max = 1,
	Default = XRayTransparency,
	Increment = 0.05,
	Suffix = "",
	Callback = function(val) XRayTransparency = val end
})

-- FullBright
espTab:AddToggle({
	Name = "FullBright",
	Default = false,
	Callback = function(val)
		FullBrightEnabled = val
		if val then ApplyFullBright() else RestoreFullBright() end
		OrionLib:MakeNotification({Name="FullBright", Content=val and "ON" or "OFF", Time=2})
	end
})

-- ESP表示切替
espTab:AddToggle({Name="Player ESP", Default=false, Callback=function(val) showPlayerESP=val end})
espTab:AddToggle({Name="Enemy/Bot ESP", Default=false, Callback=function(val) showEnemyESP=val end})
espTab:AddToggle({Name="Item ESP", Default=false, Callback=function(val) showItemESP=val end})




--========================================================--
--                     🔥 Combat Tab (OrionLib)           --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local combatTab = Window:MakeTab({Name = "戦闘", Icon = "rbxassetid://4483362458", PremiumOnly = false})

--============================
-- 状態変数
--============================
local selectedTarget = nil
local followActive = false
local freeCamActive = false
local originalHRP = nil
local savedPlatformStand = false
local camYaw, camPitch = 0,0
local sensitivity = 0.25
local zoomDist = 8
local minZoom, maxZoom = 3,25
local safePos = CFrame.new(0,1500,0)

--============================
-- プレイヤー選択用関数
--============================
_G.SetTarget = function(tar)
	if typeof(tar) == "Instance" and tar:FindFirstChild("Humanoid") then
		selectedTarget = tar
	end
end

--============================
-- ★ プレイヤーへTP
--============================
combatTab:AddButton({
	Name = "選択中のプレイヤーへ TP",
	Callback = function()
		if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = selectedTarget.Character.HumanoidRootPart
			player.Character:PivotTo(hrp.CFrame * CFrame.new(0,0,-3))
		else
			OrionLib:MakeNotification({
				Name = "エラー",
				Content = "ターゲット無効！",
				Image = "rbxassetid://4483362458",
				Time = 3
			})
		end
	end
})

--============================
-- ★ 張り付きトグル
--============================
combatTab:AddToggle({
	Name = "張り付き（Follow）",
	Default = false,
	Callback = function(state)
		if not selectedTarget then
			OrionLib:MakeNotification({
				Name = "エラー",
				Content = "先にプレイヤーを選んで！",
				Image = "rbxassetid://4483362458",
				Time = 3
			})
			return
		end
		followActive = state
		local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not myHRP then return end

		if state then
			originalHRP = myHRP.CFrame
			OrionLib:MakeNotification({
				Name = "張り付き開始",
				Content = selectedTarget.Name.." の後ろへ追従中",
				Image = "rbxassetid://4483362458",
				Time = 3
			})
		else
			if originalHRP then
				player.Character:PivotTo(originalHRP)
			end
			OrionLib:MakeNotification({
				Name = "解除",
				Content = "元の位置に戻ったよ！",
				Image = "rbxassetid://4483362458",
				Time = 3
			})
		end
	end
})

--============================
-- ★ カメラ自由追従
--============================
combatTab:AddToggle({
	Name = "視点のみTP",
	Default = false,
	Callback = function(state)
		if not selectedTarget then
			OrionLib:MakeNotification({
				Name = "エラー",
				Content = "ターゲット選んで！",
				Image = "rbxassetid://4483362458",
				Time = 2
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
			originalHRP = hrp.CFrame
			savedPlatformStand = hum.PlatformStand
			camera.CameraType = Enum.CameraType.Scriptable
			hrp.CFrame = safePos
			hum.PlatformStand = true
			camYaw, camPitch = 0,0
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
-- タッチ操作対応
--============================
local touches = {}
local prevDist = nil

UIS.TouchMoved:Connect(function(input, gameProcessed)
	if not freeCamActive then return end
	if #touches >= 2 then
		-- 2本指でピンチズーム
		local t1 = touches[1]
		local t2 = touches[2]
		local currDist = (t1.Position - t2.Position).Magnitude
		if prevDist then
			local diff = currDist - prevDist
			zoomDist = math.clamp(zoomDist - diff*0.05, minZoom, maxZoom)
		end
		prevDist = currDist
	elseif #touches == 1 then
		-- 1本指でカメラ回転
		local delta = input.Delta
		camYaw = camYaw - delta.X * sensitivity
		camPitch = math.clamp(camPitch - delta.Y * sensitivity, -75, 75)
	end
end)

UIS.TouchStarted:Connect(function(input)
	touches[input.UserInputId] = input
	if #touches < 2 then prevDist = nil end
end)

UIS.TouchEnded:Connect(function(input)
	touches[input.UserInputId] = nil
	if #touches < 2 then prevDist = nil end
end)

-- 既存の RenderStepped カメラ制御はそのまま使える

--============================
-- RenderStepped カメラ制御 + 張り付き
--============================
RunService.RenderStepped:Connect(function()
	-- Follow処理
	if followActive and selectedTarget and selectedTarget.Character and player.Character then
		local tHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
		local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
		if tHRP and myHRP then
			myHRP.CFrame = tHRP.CFrame * CFrame.new(0,0,-3)
		end
	end

	-- 自由カメラ処理
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
end)

--============================
-- プレイヤー一覧（HPリアルタイム）
--============================
combatTab:AddLabel("プレイヤー一覧（HPリアルタイム表示）")

local playerButtons = {}

local function GetHP(plr)
	if plr.Character and plr.Character:FindFirstChild("Humanoid") then
		return math.floor(plr.Character.Humanoid.Health), math.floor(plr.Character.Humanoid.MaxHealth)
	end
	return 0,0
end

local function CreatePlayerButton(plr)
	local hp, maxhp = GetHP(plr)
	local btn = combatTab:AddButton({
		Name = plr.Name.." ["..hp.."/"..maxhp.."]",
		Callback = function()
			selectedTarget = plr
			OrionLib:MakeNotification({
				Name = "選択",
				Content = plr.Name.." をターゲットにしたよ！",
				Image = "rbxassetid://4483362458",
				Time = 3
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

-- HP更新
RunService.Heartbeat:Connect(function()
	for plr, btn in pairs(playerButtons) do
		if btn and plr.Character then
			local hp,maxhp = GetHP(plr)
			pcall(function() btn:Set(plr.Name.." ["..hp.."/"..maxhp.."]") end)
		end
	end
end)






--============================
-- 設定値
--============================
local FollowDistance = 4
local AttractionRadius = 20
local slideSpeed = 20
local slideActive = false
local pickupCooldown = 0.5
local lastPickupSearch = 0
local followPipe = false
local pipeCache = {}
local searchCooldown = 0.5
local lastSearch = 0
local moveActive = false
local targetName = "Cylinder.015"
local pulling = false

--============================
-- Pickup取得関数
--============================
local function getPickups()
    local targets = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "PickupHitbox" and obj.Parent then
            table.insert(targets, obj)
        end
    end
    return targets
end

--============================
-- Pipe追尾キャッシュ更新
--============================
local function updatePipeCache()
    pipeCache = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name == "Pipe" or obj.Name == "SewerPipeModel") then
            local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if part then
                obj.PrimaryPart = part
                table.insert(pipeCache, obj)
            end
        end
    end
end

--============================
-- ESP作成
--============================
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

--============================
-- Hunt Tab に追加
--============================
huntTab:AddSlider({
    Name = "移動速度",
    Min = 5,
    Max = 50,
    Default = slideSpeed,
    Increment = 1,
    Suffix = " stud/s",
    Callback = function(val)
        slideSpeed = val
    end
})

huntTab:AddToggle({
    Name = "自動スライド取得",
    Default = false,
    Callback = function(state)
        slideActive = state
    end
})

huntTab:AddToggle({
    Name = "Pipe追尾",
    Default = false,
    Callback = function(state)
        followPipe = state
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp and not state then
            hrp.CFrame = hrp.CFrame -- 戻す必要があればここで調整
        end
    end
})

huntTab:AddToggle({
    Name = "バスに追従",
    Default = false,
    Callback = function(state)
        moveActive = state
    end
})

--============================
-- Enemy Tab に追加
--============================
enemyTab:AddSlider({
    Name = "敵の前方距離",
    Min = 1,
    Max = 50,
    Default = FollowDistance,
    Increment = 1,
    Suffix = " studs",
    Callback = function(val)
        FollowDistance = val
    end
})

enemyTab:AddSlider({
    Name = "吸引半径",
    Min = 1,
    Max = 2000,
    Default = AttractionRadius,
    Increment = 1,
    Suffix = " studs",
    Callback = function(val)
        AttractionRadius = val
    end
})

enemyTab:AddToggle({
    Name = "敵ESP",
    Default = false,
    Callback = function(state)
        pulling = state
        if not pulling then
            local entities = workspace:FindFirstChild("Entities")
            if entities then
                for _, zombie in pairs(entities:GetChildren()) do
                    if zombie.Name == "Zombie" then
                        for _, e in pairs(zombie:GetChildren()) do
                            local hrp = e:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                local gui = hrp:FindFirstChild("ESP")
                                if gui then gui:Destroy() end
                            end
                        end
                    end
                end
            end
        end
    end
})

--============================
-- RenderSteppedで処理
--============================
RunService.RenderStepped:Connect(function(dt)
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    -- Pickup自動取得
    if slideActive then
        lastPickupSearch += dt
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
                            if target and target.Parent then target:Destroy() end
                        end)
                    end
                end
            end
        end
    end

    -- Pipe追尾
    if followPipe then
        lastSearch += dt
        if lastSearch >= searchCooldown then
            updatePipeCache()
            lastSearch = 0
        end
        if #pipeCache > 0 then
            table.sort(pipeCache, function(a,b)
                return (hrp.Position - a.PrimaryPart.Position).Magnitude < (hrp.Position - b.PrimaryPart.Position).Magnitude
            end)
            local target = pipeCache[1]
            if target and target.PrimaryPart then
                local distance = (hrp.Position - target.PrimaryPart.Position).Magnitude
                local moveTarget = target.PrimaryPart.Position
                if distance > 50 then
                    moveTarget = hrp.Position + (target.PrimaryPart.Position - hrp.Position).Unit * (distance - 50)
                end
                hrp.CFrame = hrp.CFrame:Lerp(CFrame.new(moveTarget + Vector3.new(0,3,0)), math.clamp(slideSpeed*dt,0,1))
            end
        end
    end

    -- Cylinder追従
    if moveActive then
        local targetPart = Workspace:FindFirstChild(targetName, true)
        if targetPart then
            local targetPos = targetPart.Position + Vector3.new(0,5,0)
            hrp.CFrame = hrp.CFrame:Lerp(CFrame.new(targetPos), math.clamp(slideSpeed*dt,0,1))
        end
    end

    -- 敵ESP更新
    if pulling then
        local entities = Workspace:FindFirstChild("Entities")
        if entities then
            for _, zombie in pairs(entities:GetChildren()) do
                if zombie.Name == "Zombie" then
                    for _, e in pairs(zombie:GetChildren()) do
                        local hrp2 = e:FindFirstChild("HumanoidRootPart")
                        if hrp2 then
                            createESP(hrp2)
                        end
                    end
                end
            end
        end
    end
end)
