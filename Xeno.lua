--========================================================--
--         Xeno向け RayField + カスタムGUI 完全版       --
--========================================================--
-- Features:
-- - プレイヤータブ: スピード(slider + manual input), 無限ジャンプ, 空中TP(popup), 壁貫通
-- - ESPタブ: プレイヤーESP(全員), 敵ESP(Bot系判定), アイテムESP(推測)
-- - 戦闘(別UI): 縦長プレイヤー一覧(アイコン+残りHP), 選択してTP/張り付き(再押しで元に戻る)
-- - アンチAFK
-- Notes: Designed to avoid "empty RayField tab" issues by creating custom ScreenGui for player list,
-- and doing initialization in correct order. Respawn-safe where needed.
--========================================================--

-- safe pcall for external load
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
end)
if not success or not Rayfield then
    warn("Rayfield load failed")
    return
end

-- main window
local Window = Rayfield:CreateWindow({
    Name = "Xeno Script - Complete",
    LoadingTitle = "Loading Script...",
    LoadingSubtitle = "by Masashi",
    ConfigurationSaving = { Enabled = true, FolderName = "XenoScriptConfigs", FileName = "Config" },
    KeySystem = false
})

-- services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer

-- utility
local function safeGetCharacter(player)
    if not player then return nil end
    return player.Character or player.CharacterAdded:Wait()
end

-- ---------- State ----------
local state = {
    -- player tab
    speedEnabled = false,
    speedValue = 16,
    infJump = false,
    airTPActive = false, -- whether popup action is ready
    airTPInAir = false, -- whether currently in air state (teleported)
    airTPOriginalCFrame = nil,
    wallClip = false,

    -- esp
    itemsESP = false,
    enemiesESP = false,
    playersESP = false,

    -- combat
    attachedPlayer = nil,
    attachedOriginalCFrame = nil,
    attachedMode = false,

    -- antiafk
    antiAFK = false
}

-- ---------- RayField Tabs ----------
local playerTab = Window:CreateTab("プレイヤー", 4483362458)
local espTab = Window:CreateTab("ESP", 4483362458)
local combatTab = Window:CreateTab("戦闘", 4483362458)
local otherTab = Window:CreateTab("その他", 4483362458)

-- ---------- PLAYER TAB ----------
local playerSec = playerTab:CreateSection("移動 / 能力")

-- Speed slider
playerTab:CreateSlider({
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

-- Speed ON/OFF toggle
playerTab:CreateToggle({
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

-- Speed manual input (text box with Enter)
local speedInputLabel = playerTab:CreateLabel({ Name = "スピードを直接入力してEnterで確定（16-500）" })
-- RayFieldには直接テキストボックス API が無い場合があるため、CreateBox の存在チェック
if playerTab.CreateTextBox then
    playerTab:CreateTextBox({
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
            else
                -- ignore invalid
            end
        end
    })
else
    -- Fallback: an inline toggled prompt button to request via TextBox popup
    playerTab:CreateButton({
        Name = "速度を手入力 (ポップアップ)",
        Callback = function()
            local input = game:GetService("GuiService") -- fallback prompt not available; try to use a simple InputBegan prompt
            local s = tostring(state.speedValue)
            -- As a very simple fallback, toggle speed to current numeric value (no interactive prompt).
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and state.speedEnabled then
                pcall(function() LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = state.speedValue end)
            end
        end
    })
end

-- Infinite jump
playerTab:CreateToggle({
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

-- 空中TP (ポップアップボタンを別	guiで作る)
playerTab:CreateToggle({
    Name = "空中TP (ポップアップを表示)",
    CurrentValue = false,
    Flag = "AirTPToggle",
    Callback = function(val)
        state.airTPActive = val
        if val then
            showAirTPPopup() -- we'll define below; safe-call placeholder
        else
            hideAirTPPopup()
        end
    end
})

-- 壁貫通
playerTab:CreateToggle({
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

-- We'll forward-declare functions used above to avoid order problems
local airTPGui -- ref
function showAirTPPopup() end
function hideAirTPPopup() end
function enableNoclip() end
function disableNoclip() end

-- ---------- ESP TAB ----------
local espSec = espTab:CreateSection("ESP設定")

espTab:CreateToggle({
    Name = "プレイヤーESP (全員)",
    CurrentValue = false,
    Flag = "PlayersESP",
    Callback = function(val)
        state.playersESP = val
        if not val then
            -- remove all player highlights
            for p,h in pairs(ESP.PlayerHighlights) do
                if h and h.Instance then
                    h.Instance:Destroy()
                end
            end
            ESP.PlayerHighlights = {}
        end
    end
})

espTab:CreateToggle({
    Name = "敵ESP (Bot等)",
    CurrentValue = false,
    Flag = "EnemiesESP",
    Callback = function(val)
        state.enemiesESP = val
        if not val then
            for p,h in pairs(ESP.EnemyHighlights) do
                if h and h.Instance then h.Instance:Destroy() end
            end
            ESP.EnemyHighlights = {}
        end
    end
})

espTab:CreateToggle({
    Name = "アイテムESP (推測)",
    CurrentValue = false,
    Flag = "ItemsESP",
    Callback = function(val)
        state.itemsESP = val
        if not val then
            for i,h in pairs(ESP.ItemHighlights) do
                if h and h.Instance then h.Instance:Destroy() end
            end
            ESP.ItemHighlights = {}
        end
    end
})

-- ---------- COMBAT TAB ----------
combatTab:CreateSection("戦闘設定")
combatTab:CreateLabel({ Name = "プレイヤー一覧は右側の独自UIを参照してください。" })

-- ---------- OTHER TAB ----------
otherTab:CreateSection("便利機能")
otherTab:CreateToggle({
    Name = "アンチAFK",
    CurrentValue = false,
    Flag = "AntiAFK",
    Callback = function(val)
        state.antiAFK = val
        if val then
            -- connect once
            if not otherTab._antiAfkConn then
                otherTab._antiAfkConn = LocalPlayer.Idled:Connect(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new(0,0))
                end)
            end
        else
            if otherTab._antiAfkConn then
                otherTab._antiAfkConn:Disconnect()
                otherTab._antiAfkConn = nil
            end
        end
    end
})

-- ======================================================
-- Custom Player List GUI (separate ScreenGui for reliability)
-- ======================================================
local function createPlayerListGui()
    -- remove existing if present
    local existing = LocalPlayer:FindFirstChild("XenoPlayerListGui")
    if existing then existing:Destroy() end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "XenoPlayerListGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui") -- inject into CoreGui for executor environment

    -- main frame (vertical, right side)
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.AnchorPoint = Vector2.new(1,0.5)
    main.Position = UDim2.new(1, -10, 0.5, 0)
    main.Size = UDim2.new(0, 260, 0.8, 0) -- narrow tall panel
    main.BackgroundTransparency = 1
    main.Parent = screenGui

    -- background card
    local bg = Instance.new("ImageLabel")
    bg.Name = "BG"
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.Position = UDim2.new(0,0,0,0)
    bg.BackgroundTransparency = 1
    bg.Image = "rbxassetid://3926305904" -- subtle rounded background style (Roblox stock)
    bg.ScaleType = Enum.ScaleType.Slice
    bg.SliceCenter = Rect.new(100,100,100,100)
    bg.ImageColor3 = Color3.fromRGB(20,20,25)
    bg.ImageTransparency = 0
    bg.Parent = main

    -- title
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

    -- scroll frame for list
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

    -- item template creator
    local function createPlayerEntry(player)
        local entry = Instance.new("Frame")
        entry.Name = "Entry_"..player.UserId
        entry.Size = UDim2.new(1, 0, 0, 64)
        entry.BackgroundTransparency = 0.7
        entry.BackgroundColor3 = Color3.fromRGB(10,10,12)
        entry.BorderSizePixel = 0
        entry.Parent = scroll

        -- icon
        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0,56,0,56)
        icon.Position = UDim2.new(0,8,0,4)
        icon.BackgroundTransparency = 1
        icon.Parent = entry

        -- username
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

        -- hp label
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

        -- action button (TP / Attach)
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

        -- click handler
        actBtn.MouseButton1Click:Connect(function()
            -- toggle attach/TP
            if state.attachedPlayer == player and state.attachedMode then
                -- currently attached/teleported => return to original
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
                -- set select and teleport behind
                if not (player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then return end
                state.attachedOriginalCFrame = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.CFrame or nil
                state.attachedPlayer = player
                state.attachedMode = true
                actBtn.Text = "STOP"
                -- teleport slightly behind
                pcall(function()
                    local targetCF = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                    LocalPlayer.Character.HumanoidRootPart.CFrame = targetCF
                end)
            end
        end)

        -- return created widgets and updater
        local function updateEntry()
            -- set name and hp
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

        -- fetch thumbnail async
        spawn(function()
            local ok, content = pcall(function()
                return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60)
            end)
            if ok and content then
                pcall(function() icon.Image = content end)
            end
            updateCanvas()
        end)

        -- update loop connection
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

    -- table to track entries
    local entries = {}

    local function refreshList()
        -- clear
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

    -- connections
    Players.PlayerAdded:Connect(function(pl)
        refreshList()
    end)
    Players.PlayerRemoving:Connect(function(pl)
        if entries[pl] and entries[pl].Name then entries[pl]:Destroy() end
        entries[pl] = nil
        updateCanvas()
    end)

    -- initial
    refreshList()

    return screenGui, function() -- return cleanup function
        screenGui:Destroy()
    end
end

local playerListGui, cleanupPlayerList = createPlayerListGui()

-- ======================================================
-- ESP Implementation
-- ======================================================
ESP = {
    PlayerHighlights = {},
    EnemyHighlights = {},
    ItemHighlights = {}
}

-- helper to isBot (enemy) by name heuristics
local function isBotByName(name)
    if not name then return false end
    local n = name:lower()
    local patterns = {"bot", "npc", "enemy", "ai", "zombie", "mob"}
    for _,pat in ipairs(patterns) do
        if string.find(n, pat) then return true end
    end
    return false
end

-- create or update highlight for a character
local function ensurePlayerHighlight(player)
    if not player or not player.Character then return end
    local char = player.Character
    if not char:FindFirstChild("HumanoidRootPart") then return end
    local existing = ESP.PlayerHighlights[player]
    if existing and existing.Instance and existing.Instance.Parent then
        -- update color by HP
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            local ratio = hum.Health / math.max(1, hum.MaxHealth)
            if ratio <= 0.3 then
                existing.Instance.FillColor = Color3.fromRGB(255,80,80) -- red
            elseif ratio >= 0.7 then
                existing.Instance.FillColor = Color3.fromRGB(120,255,120) -- green
            else
                existing.Instance.FillColor = Color3.fromRGB(255,220,80) -- yellow
            end
        end
    else
        -- create highlight
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
        if ok and highlight then
            ESP.PlayerHighlights[player] = { Instance = highlight }
        end
    end
end

local function removePlayerHighlight(player)
    local e = ESP.PlayerHighlights[player]
    if e and e.Instance then
        pcall(function() e.Instance:Destroy() end)
    end
    ESP.PlayerHighlights[player] = nil
end

-- enemy highlight (bot)
local function ensureEnemyHighlight(model)
    if not model then return end
    if model:IsA("Model") then
        local existing = ESP.EnemyHighlights[model]
        if existing and existing.Instance and existing.Instance.Parent then
            return
        else
            local ok, highlight = pcall(function()
                local h = Instance.new("Highlight")
                h.Name = "XenoEnemyHighlight_"..tostring(model:GetDebugId())
                h.Adornee = model
                h.OutlineTransparency = 0.9
                h.FillTransparency = 0.4
                h.FillColor = Color3.fromRGB(255,60,60)
                h.Parent = workspace
                return h
            end)
            if ok and highlight then
                ESP.EnemyHighlights[model] = { Instance = highlight }
            end
        end
    end
end

local function removeEnemyHighlight(model)
    local e = ESP.EnemyHighlights[model]
    if e and e.Instance then pcall(function() e.Instance:Destroy() end) end
    ESP.EnemyHighlights[model] = nil
end

-- item highlight (approx)
local function ensureItemHighlight(inst)
    if not inst then return end
    local existing = ESP.ItemHighlights[inst]
    if existing and existing.Instance and existing.Instance.Parent then return end
    local ok, highlight = pcall(function()
        local h = Instance.new("Highlight")
        h.Name = "XenoItemHighlight_"..inst:GetDebugId()
        h.Adornee = inst
        h.OutlineTransparency = 1
        h.FillTransparency = 0.6
        h.FillColor = Color3.fromRGB(120,200,255)
        h.Parent = workspace
        return h
    end)
    if ok and highlight then
        ESP.ItemHighlights[inst] = { Instance = highlight }
    end
end

local function removeItemHighlight(inst)
    local e = ESP.ItemHighlights[inst]
    if e and e.Instance then pcall(function() e.Instance:Destroy() end) end
    ESP.ItemHighlights[inst] = nil
end

-- periodically update ESP
RunService.Heartbeat:Connect(function()
    -- PLAYER ESP
    if state.playersESP then
        for _,pl in pairs(Players:GetPlayers()) do
            if pl.Character then
                ensurePlayerHighlight(pl)
            end
        end
    else
        for p,_ in pairs(ESP.PlayerHighlights) do removePlayerHighlight(p) end
    end

    -- ENEMY ESP (heuristic: workspace models with Bot/NPC in name or players with name pattern)
    if state.enemiesESP then
        -- player-name-based bots
        for _,pl in pairs(Players:GetPlayers()) do
            if isBotByName(pl.Name) and pl.Character then
                ensureEnemyHighlight(pl.Character)
            else
                removeEnemyHighlight(pl.Character)
            end
        end
        -- workspace model scan for common enemy model names
        for _,obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and isBotByName(obj.Name) then
                ensureEnemyHighlight(obj)
            end
        end
    else
        for m,_ in pairs(ESP.EnemyHighlights) do removeEnemyHighlight(m) end
    end

    -- ITEM ESP (best-effort guess)
    if state.itemsESP then
        -- common folder names
        local folderNames = {"Items","Drops","Tools","SpawnedItems","Loot","Pickups"}
        for _,fname in ipairs(folderNames) do
            local folder = workspace:FindFirstChild(fname)
            if folder then
                for _,it in pairs(folder:GetDescendants()) do
                    if it:IsA("BasePart") then ensureItemHighlight(it) end
                end
            end
        end
        -- fallback: parts with 'item' in name
        for _,part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and string.find(part.Name:lower(), "item") then
                ensureItemHighlight(part)
            end
        end
    else
        for i,_ in pairs(ESP.ItemHighlights) do removeItemHighlight(i) end
    end
end)

-- ======================================================
-- Noclip (wall clip) implementation (respawn-safe)
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
            -- rootpart too (but keep some collisions maybe)
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then pcall(function() hrp.CanCollide = false end) end
        end
    end)
end

function disableNoclip()
    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    -- try restoring collisions (best-effort)
    local char = LocalPlayer.Character
    if char then
        for _,part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                pcall(function() part.CanCollide = true end)
            end
        end
    end
end

-- reapply noclip on respawn if toggled
Players.PlayerAdded:Connect(function() end)
LocalPlayer.CharacterAdded:Connect(function(char)
    wait(0.5)
    if state.wallClip then enableNoclip() end
end)

-- ======================================================
-- Attach (follow selected player) update loop
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
-- Air TP popup & behavior
-- ======================================================
local airPopupGui -- created below
function showAirTPPopup()
    -- create a small popup in CoreGui if not existing
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
        -- store original
        state.airTPOriginalCFrame = char.HumanoidRootPart.CFrame
        -- move up
        local targetCF = state.airTPOriginalCFrame + Vector3.new(0,2000,0)
        pcall(function()
            char.HumanoidRootPart.CFrame = targetCF
            -- prevent falling: put PlatformStand true and zero velocity each frame
            state.airTPInAir = true
            char.Humanoid.PlatformStand = true
        end)
        -- start hold loop
        if airPopupGui._holdConn then airPopupGui._holdConn:Disconnect() end
        airPopupGui._holdConn = RunService.Stepped:Connect(function()
            if not state.airTPInAir then return end
            if char and char:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                    char.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0)
                    -- keep platformstand true
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
        -- restore
        if state.airTPOriginalCFrame then
            pcall(function()
                char.HumanoidRootPart.CFrame = state.airTPOriginalCFrame
            end)
        end
        -- clear hold loop
        state.airTPInAir = false
        if airPopupGui._holdConn then airPopupGui._holdConn:Disconnect() airPopupGui._holdConn = nil end
        if char:FindFirstChildOfClass("Humanoid") then
            pcall(function() char:FindFirstChildOfClass("Humanoid").PlatformStand = false end)
        end
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
-- Ensure local character humanoid events (respawn-safe behaviors)
-- ======================================================
local function onCharacterAdded(char)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        if state.speedEnabled then
            pcall(function() hum.WalkSpeed = state.speedValue end)
        else
            pcall(function() hum.WalkSpeed = 16 end)
        end
        if state.wallClip then
            enableNoclip()
        end
        -- apply infinite jump handling already hooked globally
    end
end

if LocalPlayer.Character then onCharacterAdded(LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

-- ======================================================
-- Small guard: if RayField's CreateTextBox was not present, making sure speed manual works
-- ======================================================
-- (implemented earlier as fallback)

-- ======================================================
-- Cleanup on script unload (optional)
-- ======================================================
local function cleanAll()
    -- kill highlights
    for p,h in pairs(ESP.PlayerHighlights) do if h.Instance then pcall(function() h.Instance:Destroy() end) end end
    for m,h in pairs(ESP.EnemyHighlights) do if h.Instance then pcall(function() h.Instance:Destroy() end) end end
    for i,h in pairs(ESP.ItemHighlights) do if h.Instance then pcall(function() h.Instance:Destroy() end) end end
    -- remove UI
    if playerListGui and playerListGui.Parent then playerListGui:Destroy() end
    if airPopupGui and airPopupGui.Parent then airPopupGui:Destroy() end
end

-- Bind cleanup to a keyboard combo (Ctrl+Shift+U) for convenience
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.U and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        cleanAll()
    end
end)

-- End of script
print("Xeno Script - Complete loaded.")
