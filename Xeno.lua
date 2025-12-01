--========================================================--
--         Xeno向け RayField + カスタムGUI 完全版 (修正版)
--         （UI要素は必ず Section:Create系で生成）
--========================================================--

local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
end)
if not success or not Rayfield then
    warn("Rayfield load failed")
    return
end

local Window = Rayfield:CreateWindow({
    Name = "Xeno Script - Complete",
    LoadingTitle = "Loading Script...",
    LoadingSubtitle = "by Masashi",
    ConfigurationSaving = { Enabled = true, FolderName = "XenoScriptConfigs", FileName = "Config" },
    KeySystem = false
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

-- state
local state = {
    speedEnabled = false,
    speedValue = 16,
    infJump = false,
    airTPActive = false,
    airTPInAir = false,
    airTPOriginalCFrame = nil,
    wallClip = false,
    itemsESP = false,
    enemiesESP = false,
    playersESP = false,
    attachedPlayer = nil,
    attachedOriginalCFrame = nil,
    attachedMode = false,
    antiAFK = false
}

-- Forward declarations for functions used by toggles
local airPopupGui, playerListGui
local function showAirTPPopup() end
local function hideAirTPPopup() end
local function enableNoclip() end
local function disableNoclip() end

-- Tabs and sections
local playerTab = Window:CreateTab("プレイヤー", 4483362458)
local playerSec = playerTab:CreateSection("移動 / 能力")

local espTab = Window:CreateTab("ESP", 4483362458)
local espSec = espTab:CreateSection("ESP設定")

local combatTab = Window:CreateTab("戦闘", 4483362458)
local combatSec = combatTab:CreateSection("戦闘設定")

local otherTab = Window:CreateTab("その他", 4483362458)
local otherSec = otherTab:CreateSection("便利機能")

-- ---------- PLAYER SECTION UI (修正済: 全て playerSec で生成) ----------
playerSec:CreateSlider({
    Name = "スピード (スライダー)",
    Range = {16, 500},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(v)
        state.speedValue = v
        if state.speedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            pcall(function() hum.WalkSpeed = state.speedValue end)
        end
    end
})

playerSec:CreateToggle({
    Name = "スピード ON/OFF",
    CurrentValue = false,
    Flag = "SpeedToggle",
    Callback = function(val)
        state.speedEnabled = val
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if state.speedEnabled then
                pcall(function() hum.WalkSpeed = state.speedValue end)
            else
                pcall(function() hum.WalkSpeed = 16 end)
            end
        end
    end
})

-- 手入力説明ラベル（Section内）
playerSec:CreateLabel({ Name = "速度を直接入力してEnterで確定（16-500）" })

-- テキストボックスAPIが使える場合は Section に作成
if playerSec.CreateTextBox then
    playerSec:CreateTextBox({
        Name = "速度を入力",
        Text = "16",
        Placeholder = "Enter speed then press Enter",
        Flag = "SpeedInput",
        Callback = function(txt)
            local num = tonumber(txt)
            if num and num >= 16 and num <= 500 then
                state.speedValue = num
                if state.speedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    pcall(function() LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = state.speedValue end)
                end
            end
        end
    })
else
    playerSec:CreateButton({
        Name = "速度を手入力 (ポップアップなし環境）",
        Callback = function()
            -- フォールバック: 現在の数値を適用するだけ
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and state.speedEnabled then
                pcall(function() LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = state.speedValue end)
            end
        end
    })
end

playerSec:CreateToggle({
    Name = "無限ジャンプ",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(val)
        state.infJump = val
    end
})

UserInputService.JumpRequest:Connect(function()
    if state.infJump then
        local char = LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            pcall(function() char:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping) end)
        end
    end
end)

playerSec:CreateToggle({
    Name = "空中TP (ポップアップ)",
    CurrentValue = false,
    Flag = "AirTPToggle",
    Callback = function(val)
        state.airTPActive = val
        if val then
            showAirTPPopup()
        else
            hideAirTPPopup()
        end
    end
})

playerSec:CreateToggle({
    Name = "壁貫通 (Noclip)",
    CurrentValue = false,
    Flag = "WallClipToggle",
    Callback = function(val)
        state.wallClip = val
        if val then
            enableNoclip()
        else
            disableNoclip()
        end
    end
})

-- ---------- ESP SECTION (Section used) ----------
espSec:CreateToggle({
    Name = "プレイヤーESP (全員)",
    CurrentValue = false,
    Flag = "PlayersESP",
    Callback = function(val)
        state.playersESP = val
        if not val then
            for p,h in pairs(ESP.PlayerHighlights) do
                if h and h.Instance then pcall(function() h.Instance:Destroy() end) end
            end
            ESP.PlayerHighlights = {}
        end
    end
})

espSec:CreateToggle({
    Name = "敵ESP (Bot等)",
    CurrentValue = false,
    Flag = "EnemiesESP",
    Callback = function(val)
        state.enemiesESP = val
        if not val then
            for p,h in pairs(ESP.EnemyHighlights) do if h and h.Instance then pcall(function() h.Instance:Destroy() end) end end
            ESP.EnemyHighlights = {}
        end
    end
})

espSec:CreateToggle({
    Name = "アイテムESP (推測)",
    CurrentValue = false,
    Flag = "ItemsESP",
    Callback = function(val)
        state.itemsESP = val
        if not val then
            for i,h in pairs(ESP.ItemHighlights) do if h and h.Instance then pcall(function() h.Instance:Destroy() end) end end
            ESP.ItemHighlights = {}
        end
    end
})

-- ---------- OTHER SECTION ----------
otherSec:CreateToggle({
    Name = "アンチAFK",
    CurrentValue = false,
    Flag = "AntiAFK",
    Callback = function(val)
        state.antiAFK = val
        if val then
            if not otherSec._antiAfkConn then
                otherSec._antiAfkConn = LocalPlayer.Idled:Connect(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new(0,0))
                end)
            end
        else
            if otherSec._antiAfkConn then
                otherSec._antiAfkConn:Disconnect()
                otherSec._antiAfkConn = nil
            end
        end
    end
})

-- ======================================================
-- player list GUI (same as previous, unchanged logic)
-- ======================================================
local function createPlayerListGui()
    local existing = LocalPlayer:FindFirstChild("XenoPlayerListGui")
    if existing then existing:Destroy() end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "XenoPlayerListGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")

    local main = Instance.new("Frame")
    main.Name = "Main"
    main.AnchorPoint = Vector2.new(1,0.5)
    main.Position = UDim2.new(1, -10, 0.5, 0)
    main.Size = UDim2.new(0, 260, 0.8, 0)
    main.BackgroundTransparency = 1
    main.Parent = screenGui

    local bg = Instance.new("ImageLabel")
    bg.Name = "BG"
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Position = UDim2.new(0,0,0,0)
    bg.BackgroundTransparency = 1
    bg.Image = "rbxassetid://3926305904"
    bg.ScaleType = Enum.ScaleType.Slice
    bg.SliceCenter = Rect.new(100,100,100,100)
    bg.ImageColor3 = Color3.fromRGB(20,20,25)
    bg.Parent = main

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -12, 0, 34)
    title.Position = UDim2.new(0, 8, 0, 8)
    title.BackgroundTransparency = 1
    title.Text = "プレイヤー一覧"
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Parent = bg

    local scroll = Instance.new("ScrollingFrame")
    scroll.Name = "List"
    scroll.Size = UDim2.new(1, -16, 1, -56)
    scroll.Position = UDim2.new(0, 8, 0, 44)
    scroll.CanvasSize = UDim2.new(0,0,0,0)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 6
    scroll.Parent = bg

    local uiList = Instance.new("UIListLayout")
    uiList.SortOrder = Enum.SortOrder.LayoutOrder
    uiList.Padding = UDim.new(0,6)
    uiList.Parent = scroll

    local function updateCanvas()
        RunService.RenderStepped:Wait()
        scroll.CanvasSize = UDim2.new(0, 0, 0, uiList.AbsoluteContentSize.Y + 10)
    end

    local function createPlayerEntry(player)
        local entry = Instance.new("Frame")
        entry.Name = "Entry_"..player.UserId
        entry.Size = UDim2.new(1, 0, 0, 64)
        entry.BackgroundTransparency = 0.7
        entry.BackgroundColor3 = Color3.fromRGB(10,10,12)
        entry.BorderSizePixel = 0
        entry.Parent = scroll

        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0,56,0,56)
        icon.Position = UDim2.new(0,8,0,4)
        icon.BackgroundTransparency = 1
        icon.Parent = entry

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "Name"
        nameLabel.Size = UDim2.new(1, -80, 0, 24)
        nameLabel.Position = UDim2.new(0,72,0,6)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = 14
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.TextColor3 = Color3.fromRGB(255,255,255)
        nameLabel.Text = player.Name
        nameLabel.Parent = entry

        local hpLabel = Instance.new("TextLabel")
        hpLabel.Name = "HP"
        hpLabel.Size = UDim2.new(1, -80, 0, 20)
        hpLabel.Position = UDim2.new(0,72,0,30)
        hpLabel.BackgroundTransparency = 1
        hpLabel.Font = Enum.Font.Gotham
        hpLabel.TextSize = 13
        hpLabel.TextXAlignment = Enum.TextXAlignment.Left
        hpLabel.TextColor3 = Color3.fromRGB(200,200,200)
        hpLabel.Text = "HP: --"
        hpLabel.Parent = entry

        local actBtn = Instance.new("TextButton")
        actBtn.Name = "Act"
        actBtn.Size = UDim2.new(0,60,0,34)
        actBtn.Position = UDim2.new(1, -68, 0.5, -17)
        actBtn.BackgroundColor3 = Color3.fromRGB(30,30,35)
        actBtn.TextColor3 = Color3.fromRGB(255,255,255)
        actBtn.Font = Enum.Font.GothamBold
        actBtn.TextSize = 13
        actBtn.Text = "TP"
        actBtn.Parent = entry

        actBtn.MouseButton1Click:Connect(function()
            if state.attachedPlayer == player and state.attachedMode then
                if state.attachedOriginalCFrame then
                    pcall(function()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = state.attachedOriginalCFrame
                    end)
                end
                state.attachedPlayer = nil
                state.attachedOriginalCFrame = nil
                state.attachedMode = false
                actBtn.Text = "TP"
            else
                if not (player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then return end
                state.attachedOriginalCFrame = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.CFrame or nil
                state.attachedPlayer = player
                state.attachedMode = true
                actBtn.Text = "STOP"
                pcall(function()
                    local targetCF = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                    LocalPlayer.Character.HumanoidRootPart.CFrame = targetCF
                end)
            end
        end)

        local function updateEntry()
            nameLabel.Text = player.Name
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                local hp = math.floor(hum.Health)
                local maxhp = hum.MaxHealth > 0 and math.floor(hum.MaxHealth) or 100
                hpLabel.Text = ("HP: %d/%d"):format(hp, maxhp)
            else
                hpLabel.Text = "HP: --"
            end
        end

        spawn(function()
            local ok, content = pcall(function()
                return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60)
            end)
            if ok and content then
                pcall(function() icon.Image = content end)
            end
            updateCanvas()
        end)

        local conn
        conn = RunService.Heartbeat:Connect(function()
            if not entry.Parent then
                if conn then conn:Disconnect() end
                return
            end
            updateEntry()
        end)

        return entry
    end

    local entries = {}
    local function refreshList()
        for _,v in pairs(scroll:GetChildren()) do
            if v:IsA("Frame") and v.Name:sub(1,6) == "Entry_" then v:Destroy() end
        end
        entries = {}
        for _,pl in pairs(Players:GetPlayers()) do
            if pl ~= LocalPlayer then
                entries[pl] = createPlayerEntry(pl)
            end
        end
        updateCanvas()
    end

    Players.PlayerAdded:Connect(function(pl) refreshList() end)
    Players.PlayerRemoving:Connect(function(pl)
        if entries[pl] and entries[pl].Name then entries[pl]:Destroy() end
        entries[pl] = nil
        updateCanvas()
    end)

    refreshList()
    return screenGui, function() screenGui:Destroy() end
end

playerListGui, cleanupPlayerList = createPlayerListGui()

-- ======================================================
-- ESP implementation (unchanged)
-- ======================================================
ESP = { PlayerHighlights = {}, EnemyHighlights = {}, ItemHighlights = {} }

local function isBotByName(name)
    if not name then return false end
    local n = name:lower()
    local patterns = {"bot", "npc", "enemy", "ai", "zombie", "mob"}
    for _,pat in ipairs(patterns) do
        if string.find(n, pat) then return true end
    end
    return false
end

local function ensurePlayerHighlight(player)
    if not player or not player.Character then return end
    local char = player.Character
    if not char:FindFirstChild("HumanoidRootPart") then return end
    local existing = ESP.PlayerHighlights[player]
    if existing and existing.Instance and existing.Instance.Parent then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            local ratio = hum.Health / math.max(1, hum.MaxHealth)
            if ratio <= 0.3 then
                existing.Instance.FillColor = Color3.fromRGB(255,80,80)
            elseif ratio >= 0.7 then
                existing.Instance.FillColor = Color3.fromRGB(120,255,120)
            else
                existing.Instance.FillColor = Color3.fromRGB(255,220,80)
            end
        end
    else
        local ok, highlight = pcall(function()
            local h = Instance.new("Highlight")
            h.Name = "XenoPlayerHighlight_"..player.UserId
            h.Adornee = char
            h.OutlineTransparency = 1
            h.FillTransparency = 0.5
            h.FillColor = Color3.fromRGB(255,220,80)
            h.Parent = workspace
            return h
        end)
        if ok and highlight then ESP.PlayerHighlights[player] = { Instance = highlight } end
    end
end

local function removePlayerHighlight(player)
    local e = ESP.PlayerHighlights[player]
    if e and e.Instance then pcall(function() e.Instance:Destroy() end) end
    ESP.PlayerHighlights[player] = nil
end

local function ensureEnemyHighlight(model)
    if not model then return end
    local existing = ESP.EnemyHighlights[model]
    if existing and existing.Instance and existing.Instance.Parent then return end
    local ok, highlight = pcall(function()
        local h = Instance.new("Highlight")
        h.Name = "XenoEnemyHighlight_"..tostring(tick())
        h.Adornee = model
        h.OutlineTransparency = 0.9
        h.FillTransparency = 0.4
        h.FillColor = Color3.fromRGB(255,60,60)
        h.Parent = workspace
        return h
    end)
    if ok and highlight then ESP.EnemyHighlights[model] = { Instance = highlight } end
end

local function removeEnemyHighlight(model)
    local e = ESP.EnemyHighlights[model]
    if e and e.Instance then pcall(function() e.Instance:Destroy() end) end
    ESP.EnemyHighlights[model] = nil
end

local function ensureItemHighlight(inst)
    if not inst then return end
    local existing = ESP.ItemHighlights[inst]
    if existing and existing.Instance and existing.Instance.Parent then return end
    local ok, highlight = pcall(function()
        local h = Instance.new("Highlight")
        h.Name = "XenoItemHighlight_"..tostring(tick())
        h.Adornee = inst
        h.OutlineTransparency = 1
        h.FillTransparency = 0.6
        h.FillColor = Color3.fromRGB(120,200,255)
        h.Parent = workspace
        return h
    end)
    if ok and highlight then ESP.ItemHighlights[inst] = { Instance = highlight } end
end

local function removeItemHighlight(inst)
    local e = ESP.ItemHighlights[inst]
    if e and e.Instance then pcall(function() e.Instance:Destroy() end) end
    ESP.ItemHighlights[inst] = nil
end

RunService.Heartbeat:Connect(function()
    if state.playersESP then
        for _,pl in pairs(Players:GetPlayers()) do
            if pl.Character then ensurePlayerHighlight(pl) end
        end
    else
        for p,_ in pairs(ESP.PlayerHighlights) do removePlayerHighlight(p) end
    end

    if state.enemiesESP then
        for _,pl in pairs(Players:GetPlayers()) do
            if isBotByName(pl.Name) and pl.Character then ensureEnemyHighlight(pl.Character) else removeEnemyHighlight(pl.Character) end
        end
        for _,obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and isBotByName(obj.Name) then ensureEnemyHighlight(obj) end
        end
    else
        for m,_ in pairs(ESP.EnemyHighlights) do removeEnemyHighlight(m) end
    end

    if state.itemsESP then
        local folderNames = {"Items","Drops","Tools","SpawnedItems","Loot","Pickups"}
        for _,fname in ipairs(folderNames) do
            local folder = workspace:FindFirstChild(fname)
            if folder then
                for _,it in pairs(folder:GetDescendants()) do
                    if it:IsA("BasePart") then ensureItemHighlight(it) end
                end
            end
        end
        for _,part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and string.find(part.Name:lower(), "item") then ensureItemHighlight(part) end
        end
    else
        for i,_ in pairs(ESP.ItemHighlights) do removeItemHighlight(i) end
    end
end)

-- ======================================================
-- Noclip (respawn-safe)
-- ======================================================
local noclipConn
function enableNoclip()
    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    noclipConn = RunService.Stepped:Connect(function()
        local char = LocalPlayer.Character
        if char and state.wallClip then
            for _,part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    pcall(function() part.CanCollide = false end)
                end
            end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then pcall(function() hrp.CanCollide = false end) end
        end
    end)
end

function disableNoclip()
    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    local char = LocalPlayer.Character
    if char then
        for _,part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then pcall(function() part.CanCollide = true end) end
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.5)
    if state.speedEnabled and char:FindFirstChildOfClass("Humanoid") then pcall(function() char:FindFirstChildOfClass("Humanoid").WalkSpeed = state.speedValue end) end
    if state.wallClip then enableNoclip() end
end)

-- ======================================================
-- Attach/follow loop
-- ======================================================
RunService.RenderStepped:Connect(function()
    if state.attachedMode and state.attachedPlayer and state.attachedPlayer.Character and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local target = state.attachedPlayer.Character:FindFirstChild("HumanoidRootPart")
        if target then
            local desired = target.CFrame * CFrame.new(0,0,3)
            pcall(function() LocalPlayer.Character.HumanoidRootPart.CFrame = desired end)
        end
    end
end)

-- ======================================================
-- Air TP popup & behavior (defined after referencers)
-- ======================================================
function showAirTPPopup()
    if airPopupGui and airPopupGui.Parent then return end
    airPopupGui = Instance.new("ScreenGui")
    airPopupGui.Name = "XenoAirTPPopup"
    airPopupGui.ResetOnSpawn = false
    airPopupGui.Parent = game:GetService("CoreGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,220,0,120)
    frame.Position = UDim2.new(0.5, -110, 0.2, 0)
    frame.AnchorPoint = Vector2.new(0.5,0)
    frame.BackgroundTransparency = 0.2
    frame.BackgroundColor3 = Color3.fromRGB(12,12,16)
    frame.BorderSizePixel = 0
    frame.Parent = airPopupGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -12, 0, 28)
    title.Position = UDim2.new(0,6,0,6)
    title.BackgroundTransparency = 1
    title.Text = "空中TP"
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame

    local btnUp = Instance.new("TextButton")
    btnUp.Size = UDim2.new(0.9, 0, 0, 36)
    btnUp.Position = UDim2.new(0.05, 0, 0, 40)
    btnUp.Text = "上空にTP (2000)"
    btnUp.Font = Enum.Font.GothamBold
    btnUp.TextSize = 14
    btnUp.BackgroundColor3 = Color3.fromRGB(30,30,35)
    btnUp.TextColor3 = Color3.fromRGB(255,255,255)
    btnUp.Parent = frame

    local btnDown = Instance.new("TextButton")
    btnDown.Size = UDim2.new(0.9, 0, 0, 36)
    btnDown.Position = UDim2.new(0.05, 0, 0, 80)
    btnDown.Text = "戻る"
    btnDown.Font = Enum.Font.GothamBold
    btnDown.TextSize = 14
    btnDown.BackgroundColor3 = Color3.fromRGB(30,30,35)
    btnDown.TextColor3 = Color3.fromRGB(255,255,255)
    btnDown.Parent = frame

    btnUp.MouseButton1Click:Connect(function()
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChildOfClass("Humanoid") then return end
        state.airTPOriginalCFrame = char.HumanoidRootPart.CFrame
        local targetCF = state.airTPOriginalCFrame + Vector3.new(0,2000,0)
        pcall(function()
            char.HumanoidRootPart.CFrame = targetCF
            state.airTPInAir = true
            char.Humanoid.PlatformStand = true
        end)
        if airPopupGui._holdConn then airPopupGui._holdConn:Disconnect() end
        airPopupGui._holdConn = RunService.Stepped:Connect(function()
            if not state.airTPInAir then return end
            if char and char:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    char.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
                    if char:FindFirstChildOfClass("Humanoid") then
                        char:FindFirstChildOfClass("Humanoid").PlatformStand = true
                    end
                end)
            end
        end)
    end)

    btnDown.MouseButton1Click:Connect(function()
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        if state.airTPOriginalCFrame then
            pcall(function() char.HumanoidRootPart.CFrame = state.airTPOriginalCFrame end)
        end
        state.airTPInAir = false
        if airPopupGui._holdConn then airPopupGui._holdConn:Disconnect() airPopupGui._holdConn = nil end
        if char:FindFirstChildOfClass("Humanoid") then pcall(function() char:FindFirstChildOfClass("Humanoid").PlatformStand = false end) end
    end)
end

function hideAirTPPopup()
    if airPopupGui then
        if airPopupGui._holdConn then airPopupGui._holdConn:Disconnect() airPopupGui._holdConn = nil end
        airPopupGui:Destroy()
        airPopupGui = nil
        state.airTPInAir = false
    end
end

-- ======================================================
-- character added handling
-- ======================================================
local function onCharacterAdded(char)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        if state.speedEnabled then pcall(function() hum.WalkSpeed = state.speedValue end) else pcall(function() hum.WalkSpeed = 16 end) end
        if state.wallClip then enableNoclip() end
    end
end

if LocalPlayer.Character then onCharacterAdded(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

-- ======================================================
-- cleanup binding
-- ======================================================
local function cleanAll()
    for p,h in pairs(ESP.PlayerHighlights) do if h.Instance then pcall(function() h.Instance:Destroy() end) end end
    for m,h in pairs(ESP.EnemyHighlights) do if h.Instance then pcall(function() h.Instance:Destroy() end) end end
    for i,h in pairs(ESP.ItemHighlights) do if h.Instance then pcall(function() h.Instance:Destroy() end) end end
    if playerListGui and playerListGui.Parent then playerListGui:Destroy() end
    if airPopupGui and airPopupGui.Parent then airPopupGui:Destroy() end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.U and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        cleanAll()
    end
end)

print("Xeno Script - Complete (修正版) loaded.")
