-- RayFieldロード
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--================ 設定 =================
local speedDefaultOn, speedDefaultOff = 16, 16
local speedMin, speedMax = 0, 200
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

local combatTab = Window:CreateTab("Combat", 4483362458)
combatTab:CreateLabel("プレイヤー一覧（HPリアルタイム表示）")

local selectedTarget = nil
local followActive = false
local originalPos = nil

local playerButtons = {}  -- [Player] = Button

------------------------------------------------------------
-- 🔥 HPを取得する安全関数
------------------------------------------------------------
local function GetHP(plr)
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        local hum = plr.Character.Humanoid
        return math.floor(hum.Health), math.floor(hum.MaxHealth)
    end
    return 0, 0
end

------------------------------------------------------------
-- 🔥 プレイヤーボタン作成（HP付き）
------------------------------------------------------------
local function CreatePlayerButton(plr)
    if playerButtons[plr] then return end -- 既にボタンがあるなら作らない

    local hp, maxhp = GetHP(plr)
    local btnName = plr.Name .. " [" .. hp .. "/" .. maxhp .. "]"

    local btn = combatTab:CreateButton({
        Name = btnName,
        Callback = function()
            selectedTarget = plr
            followActive = false
            originalPos = nil
            RayField:Notify({
                Title="ターゲット選択",
                Content=plr.Name.." を選んだよ",
                Duration=2
            })
        end
    })

    playerButtons[plr] = btn
end

------------------------------------------------------------
-- 🔥 初期プレイヤー一覧作成
------------------------------------------------------------
for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= player then
        CreatePlayerButton(plr)
    end
end

------------------------------------------------------------
-- 🔥 プレイヤー追加・削除処理
------------------------------------------------------------
Players.PlayerAdded:Connect(function(plr)
    if plr ~= player then
        CreatePlayerButton(plr)
    end
end)

Players.PlayerRemoving:Connect(function(plr)
    local btn = playerButtons[plr]
    if btn then
        btn.Name = "[Left] "..plr.Name
        btn.Callback = function() end
        playerButtons[plr] = nil
        if selectedTarget == plr then selectedTarget = nil end
    end
end)

------------------------------------------------------------
-- 🔥 HPリアルタイム更新
------------------------------------------------------------
RunService.Heartbeat:Connect(function()
    for plr, btn in pairs(playerButtons) do
        if plr and plr.Character then
            local hp, maxhp = GetHP(plr)
            local text = (maxhp==0) and (plr.Name.." [Dead]") or (plr.Name.." ["..hp.."/"..maxhp.."]")
            pcall(function() btn:Set(text) end)
        end
    end
end)

------------------------------------------------------------
-- 🌀 TP ボタン
------------------------------------------------------------
combatTab:CreateButton({
    Name = "選択中のプレイヤーへ TP",
    Callback = function()
        if selectedTarget
            and selectedTarget.Character
            and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then

            local hrp = selectedTarget.Character.HumanoidRootPart
            player.Character:PivotTo(hrp.CFrame * CFrame.new(0,0,-3))
        else
            RayField:Notify({
                Title="エラー",
                Content="ターゲット無効！",
                Duration=2
            })
        end
    end
})

------------------------------------------------------------
-- 🌀 張り付き（Follow）
------------------------------------------------------------
combatTab:CreateToggle({
    Name="張り付き（Follow）",
    CurrentValue=false,
    Callback=function(state)
        if not selectedTarget then
            RayField:Notify({
                Title="エラー",
                Content="先にプレイヤー選んで！",
                Duration=2
            })
            return
        end

        followActive = state

        if state then
            local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if myHRP then originalPos = myHRP.CFrame end

            RayField:Notify({
                Title="張り付き開始",
                Content=selectedTarget.Name.." の後ろへ追従中",
                Duration=2
            })
        else
            if originalPos and player.Character then
                player.Character:PivotTo(originalPos)
            end
            RayField:Notify({
                Title="解除",
                Content="元の位置に戻ったよ！",
                Duration=2
            })
        end
    end
})

------------------------------------------------------------
-- 🔥 張り付き追尾ループ
------------------------------------------------------------
RunService.RenderStepped:Connect(function()
    if followActive and selectedTarget and selectedTarget.Character then
        local targetHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
        local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

        if targetHRP and myHRP then
            myHRP.CFrame = targetHRP.CFrame * CFrame.new(0,0,3)
        end
    end
end)

------------------------------------------------------------
-- 🐟 GUI再表示用アイコン
------------------------------------------------------------
local icon = Instance.new("TextButton")
icon.Size = UDim2.new(0,50,0,50)
icon.Position = UDim2.new(0,10,0,10)
icon.Text = "🐟"
icon.BackgroundColor3 = Color3.fromRGB(0,170,255)
icon.Visible = false
icon.Parent = player:WaitForChild("PlayerGui")
icon.MouseButton1Click:Connect(function()
    Window:Toggle()
    icon.Visible = false
end)

Window.CloseCallback = function()
    icon.Visible = true
end
