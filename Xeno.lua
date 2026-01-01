local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
--================================
-- Services
--================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

--================================
-- キャラ取得（安全版）
--================================
local function getCharacter()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    return char, hum, hrp
end

--================================
-- 設定値
--================================
local speedEnabled = false
local speedValue = 30
local originalWalkSpeed = nil

local jumpEnabled = false
local jumpPowerValue = 50
local originalJumpPower = nil

local infiniteJumpEnabled = false

-- noclip
local noclipEnabled = false
local noclipConn = nil

-- freeze
local freezeEnabled = false
local freezeConn = nil
local freezeCFrame = nil



-- 空中TP
local airTPActive = false
local airHeight = 2000
local airOriginCF = nil
local airForce = nil

-- 足場
local platforms = {}

--================================
-- Rayfield Window
--================================
local Window = Rayfield:CreateWindow({
    Name = "Furo Hub",
    LoadingTitle = "読み込み中.....",
    LoadingSubtitle = "Editting by Furopper",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FuroHub",
        FileName = "Player"
    },
    KeySystem = false
})

--================================
-- プレイヤータブ
--================================
local playerTab = Window:CreateTab("プレイヤー", 4483362458)

--================================
-- スピード
--================================
playerTab:CreateToggle({
    Name = "スピード",
    CurrentValue = false,
    Callback = function(v)
        speedEnabled = v
        local _, hum = getCharacter()
        if hum then
            if v then
                originalWalkSpeed = hum.WalkSpeed
            else
                hum.WalkSpeed = originalWalkSpeed or 16
            end
        end
    end
})

playerTab:CreateSlider({
    Name = "スピード調節",
    Range = {0, 500},
    Increment = 1,
    CurrentValue = speedValue,
    Callback = function(v)
        speedValue = v
    end
})

--================================
-- ジャンプ
--================================
playerTab:CreateToggle({
    Name = "跳躍力",
    CurrentValue = false,
    Callback = function(v)
        jumpEnabled = v
        local _, hum = getCharacter()
        if hum then
            if v then
                originalJumpPower = hum.JumpPower
                hum.JumpPower = jumpPowerValue
            else
                hum.JumpPower = originalJumpPower or 50
            end
        end
    end
})

playerTab:CreateSlider({
    Name = "跳躍力調節",
    Range = {0, 700},
    Increment = 5,
    CurrentValue = jumpPowerValue,
    Callback = function(v)
        jumpPowerValue = v
        local _, hum = getCharacter()
        if hum and jumpEnabled then
            hum.JumpPower = v
        end
    end
})

--================================
-- 無限ジャンプ
--================================
playerTab:CreateToggle({
    Name = "無限ジャンプ",
    CurrentValue = false,
    Callback = function(v)
        infiniteJumpEnabled = v
    end
})

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _, hum = getCharacter()
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

--================================
-- 壁貫通（Noclip）
--================================
local function enableNoclip()
    if noclipConn then return end
    noclipConn = RunService.Stepped:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        for _,p in ipairs(char:GetDescendants()) do
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
    local char = LocalPlayer.Character
    if not char then return end
    for _,p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") then
            p.CanCollide = true
        end
    end
end

playerTab:CreateToggle({
    Name = "壁貫通",
    CurrentValue = false,
    Callback = function(v)
        noclipEnabled = v
        if v then enableNoclip() else disableNoclip() end
    end
})

--================================
-- 空中TP
--================================
playerTab:CreateButton({
    Name = "空中TP",
    Callback = function()
        local _, hum, hrp = getCharacter()
        if not hum or not hrp then return end

        if not airTPActive then
            airOriginCF = hrp.CFrame
            hrp.CFrame = hrp.CFrame + Vector3.new(0, airHeight, 0)

            airForce = Instance.new("BodyVelocity")
            airForce.MaxForce = Vector3.new(0, math.huge, 0)
            airForce.Velocity = Vector3.zero
            airForce.Parent = hrp

            airTPActive = true
        else
            if airForce then airForce:Destroy() end
            if airOriginCF then hrp.CFrame = airOriginCF end
            airTPActive = false
        end
    end
})


--================================
-- 足場管理
--================================
local platforms = platforms or {}

-- 足場生成
playerTab:CreateButton({
    Name = "足場生成",
    Callback = function()
        local char, hum, root = getCharacter()
        if not root then return end

        local platform = Instance.new("Part")
        platform.Size = Vector3.new(6, 1, 6)
        platform.Anchored = true
        platform.CanCollide = true
        platform.Color = Color3.fromRGB(255, 200, 0)
        platform.Material = Enum.Material.Neon

        platform.CFrame = root.CFrame * CFrame.new(0, -3, 0)
        platform.Parent = workspace

        table.insert(platforms, platform)
    end
})

-- 足場削除
playerTab:CreateButton({
    Name = "足場削除",
    Callback = function()
        for _, p in ipairs(platforms) do
            if p and p.Parent then
                p:Destroy()
            end
        end
        table.clear(platforms)
    end
})


--================================
-- 位置固定
--================================
playerTab:CreateToggle({
    Name = "位置固定",
    CurrentValue = false,
    Callback = function(v)
        freezeEnabled = v
        local _, _, hrp = getCharacter()
        if not hrp then return end

        if v then
            freezeCFrame = hrp.CFrame
            freezeConn = RunService.RenderStepped:Connect(function()
                hrp.CFrame = freezeCFrame
            end)
        else
            if freezeConn then
                freezeConn:Disconnect()
                freezeConn = nil
            end
        end
    end
})

--================================
-- Fly
--================================
local flyEnabled = false
local flySpeed = 50

local flyKeys = {
    W=false,A=false,S=false,D=false,
    Space=false,LeftShift=false
}

local flyBV

--================ Fly Toggle ================
playerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Callback = function(v)
        flyEnabled = v

        local _, _, hrp = getCharacter()
        if not hrp then return end

        if v then
            flyBV = Instance.new("BodyVelocity")
            flyBV.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            flyBV.Velocity = Vector3.zero
            flyBV.Parent = hrp
        else
            if flyBV then
                flyBV:Destroy()
                flyBV = nil
            end
        end
    end
})

playerTab:CreateSlider({
    Name = "Fly速度",
    Range = {10, 5000},
    Increment = 5,
    CurrentValue = flySpeed,
    Callback = function(v)
        flySpeed = v
    end
})

--================ Input ================
UserInputService.InputBegan:Connect(function(i,g)
    if g then return end
    if flyKeys[i.KeyCode.Name] ~= nil then
        flyKeys[i.KeyCode.Name] = true
    end
end)

UserInputService.InputEnded:Connect(function(i,g)
    if g then return end
    if flyKeys[i.KeyCode.Name] ~= nil then
        flyKeys[i.KeyCode.Name] = false
    end
end)

--================ Fly Loop ================
RunService.RenderStepped:Connect(function()
    if not flyEnabled or not flyBV then return end

    local _, _, hrp = getCharacter()
    if not hrp then return end

    local cam = workspace.CurrentCamera
    local move = Vector3.zero

    -- 見てる方向そのまま
    if flyKeys.W then move += cam.CFrame.LookVector end
    if flyKeys.S then move -= cam.CFrame.LookVector end
    if flyKeys.A then move -= cam.CFrame.RightVector end
    if flyKeys.D then move += cam.CFrame.RightVector end
    if flyKeys.Space then move += Vector3.yAxis end
    if flyKeys.LeftShift then move -= Vector3.yAxis end

    if move.Magnitude > 0 then
        flyBV.Velocity = move.Unit * flySpeed
    else
        flyBV.Velocity = Vector3.zero -- ← これが「落ちない」核心
    end
end)


--================================
-- スピード反映
--================================
RunService.RenderStepped:Connect(function()
    if speedEnabled then
        local _, hum = getCharacter()
        if hum then hum.WalkSpeed = speedValue end
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
                        hrp.Size = Vector3.new(8,8,8)
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
--                     🔥 World Of Stand                    --
--========================================================--

--================= サービス =================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

--================= チェスト管理 =================
local currentChest = 0
local maxChest = 54

local function findChestByNumber(number)
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name == tostring(number) then
            return obj
        end
    end
    return nil
end

local function teleportToChest(chest)
    if chest and chest.PrimaryPart then
        LocalPlayer.Character:SetPrimaryPartCFrame(
            CFrame.new(chest.PrimaryPart.Position + Vector3.new(0,7,0))
        )
        print("テレポート: " .. chest.Name)
        return tonumber(chest.Name)
    else
        print("チェストが見つかりませんでした")
        return nil
    end
end

--================= GUI =================
-- Window は既存RayfieldのWindowを想定
local StandTab = Window:CreateTab("スタンドの世界")

-- 現在のチェスト番号表示
local chestLabel = StandTab:CreateLabel("現在のチェスト: 0")

--================= 順番にTPボタン =================
StandTab:CreateButton({
    Name = "次のチェストにTP",
    Callback = function()
        currentChest = currentChest + 1
        if currentChest > maxChest then currentChest = 1 end
        local chest = findChestByNumber(currentChest)
        local teleportedNumber = teleportToChest(chest)
        if teleportedNumber then
            chestLabel:Set("現在のチェスト: " .. teleportedNumber)
        end
    end
})

--================= チェスト番号入力 =================
local chestNumberInput = "" -- 入力値保持用

local chestInput = StandTab:CreateTextbox({
    Name = "チェスト番号入力",
    Default = "",
    TextDisappear = false, -- Enterで消えない
    Callback = function(value)
        chestNumberInput = value -- 入力を変数に保存
    end
})

StandTab:CreateButton({
    Name = "指定番号にTP",
    Callback = function()
        local number = tonumber(chestNumberInput)
        if not number then
            print("番号を正しく入力してください")
            return
        end
        if number < 1 or number > maxChest then
            print("1〜" .. maxChest .. "の番号を入力してください")
            return
        end

        currentChest = number
        local chest = findChestByNumber(number)
        local teleportedNumber = teleportToChest(chest)
        if teleportedNumber then
            chestLabel:Set("現在のチェスト: " .. teleportedNumber)
        end
    end
})




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
