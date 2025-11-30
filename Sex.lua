--========================================================--
--                  UtilityHub v3 OrionLib               --
--========================================================--

-- OrionLib取得
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/WRUyYTdY"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- 初期設定
local speedDefault, speedMin, speedMax = 16, 0, 200
local desiredSpeed = speedDefault
local speedEnabled, infiniteJumpEnabled, wallClipEnabled = false, false, false
local airTPActive, airTPOriginalCFrame = false, nil
local followEnabled, followTarget = false, nil
local attackRange, maxRange = 5, 50
local showHitbox = false

-- カラー設定
local accentColor = Color3.fromRGB(0,170,255) -- デフォルトアクセント
local backgroundColor = Color3.fromRGB(30,30,30)
local textColor = Color3.fromRGB(255,255,255)

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
            part.CanCollide = not not enable
        end
    end
end

--================ GUI 作成 =================
local Window = OrionLib:MakeWindow({Name = "UtilityHub v3", HidePremium = true, SaveConfig = true, ConfigFolder = "UtilityHubConfig", IntroText = "UtilityHub v3"})
Window:MakeNotification({
    Name = "Loaded",
    Content = "UtilityHub v3 Loaded Successfully",
    Image = "rbxassetid://4483345998",
    Time = 5
})

--================ プレイヤータブ =================
local playerTab = Window:MakeTab({Name = "プレイヤー", Icon = "rbxassetid://6031075995", PremiumOnly = false})

-- Speed Toggle + Slider
playerTab:AddToggle({
    Name = "Speed",
    Default = false,
    Callback = function(value)
        speedEnabled = value
    end
})
playerTab:AddSlider({
    Name = "Speed Value",
    Min = speedMin,
    Max = speedMax,
    Default = speedDefault,
    Color = accentColor,
    Increment = 1,
    ValueName = "WalkSpeed",
    Callback = function(value)
        desiredSpeed = value
    end
})

-- Infinite Jump
playerTab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(value)
        infiniteJumpEnabled = value
    end
})

-- Wall Clip
playerTab:AddToggle({
    Name = "WallClip",
    Default = false,
    Callback = function(value)
        wallClipEnabled = value
        setWallClip(value)
    end
})

-- Air TP
playerTab:AddButton({
    Name = "Air TP",
    Callback = function()
        local _, hum, root = getCharacter()
        if not root or not hum then return end
        if not airTPActive then
            airTPOriginalCFrame = root.CFrame
            root.CFrame = root.CFrame + Vector3.new(0,2000,0)
            pcall(function() root.Anchored=true end)
            airTPActive = true
        else
            if airTPOriginalCFrame then root.CFrame = airTPOriginalCFrame end
            pcall(function() root.Anchored=false end)
            airTPActive = false
        end
    end
})

-- GUI Color Picker
playerTab:AddColorPicker({
    Name = "Accent Color",
    Default = accentColor,
    Callback = function(color)
        accentColor = color
    end
})
playerTab:AddColorPicker({
    Name = "Background Color",
    Default = backgroundColor,
    Callback = function(color)
        backgroundColor = color
    end
})
playerTab:AddColorPicker({
    Name = "Text Color",
    Default = textColor,
    Callback = function(color)
        textColor = color
    end
})

--================ 戦闘タブ =================
local combatTab = Window:MakeTab({Name = "戦闘", Icon = "rbxassetid://6031075933", PremiumOnly = false})

-- Attack Range Slider
combatTab:AddSlider({
    Name = "Attack Range",
    Min = 1,
    Max = maxRange,
    Default = attackRange,
    Color = accentColor,
    Increment = 1,
    ValueName = "Studs",
    Callback = function(value)
        attackRange = value
    end
})

-- Hitbox Toggle
combatTab:AddToggle({
    Name = "Show Hitbox",
    Default = false,
    Callback = function(value)
        showHitbox = value
    end
})

--================ プレイヤー選択リスト =================
local selectedPlayer = nil
local playersList = {}
combatTab:AddButton({
    Name = "Refresh Player List",
    Callback = function()
        for _,pl in pairs(Players:GetPlayers()) do
            if pl ~= player then
                playersList[pl.Name] = pl
            end
        end
    end
})

--================ 透視タブ =================
local overlayTab = Window:MakeTab({Name = "透視", Icon = "rbxassetid://6031075935", PremiumOnly = false})
local playerESP, botESP, enemyESP = false, false, false

overlayTab:AddToggle({
    Name = "Players",
    Default = false,
    Callback = function(value) playerESP = value end
})
overlayTab:AddToggle({
    Name = "Bots",
    Default = false,
    Callback = function(value) botESP = value end
})
overlayTab:AddToggle({
    Name = "Enemies",
    Default = false,
    Callback = function(value) enemyESP = value end
})

--================ Main Loops =================
spawn(function()
    while true do
        local _,hum = getCharacter()
        if speedEnabled and hum then pcall(function() hum.WalkSpeed=desiredSpeed end) end
        if wallClipEnabled then setWallClip(true) end
        wait(0.1)
    end
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _,hum = getCharacter()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

-- Enemy Auto Follow + Attack Range + Hitbox
RunService.RenderStepped:Connect(function()
    local char, hum, root = getCharacter()
    if not root then return end
    for _, enemy in pairs(workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChildOfClass("Humanoid") then
            local eRoot = enemy:FindFirstChild("HumanoidRootPart")
            if eRoot then
                -- 距離判定
                local dist = (eRoot.Position-root.Position).Magnitude
                if dist <= attackRange then
                    root.CFrame = CFrame.new(eRoot.Position - eRoot.CFrame.LookVector*5, eRoot.Position)
                end
                -- Hitbox表示
                for _, part in pairs(enemy:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = showHitbox and 0.5 or 1
                        part.Color = showHitbox and Color3.fromRGB(255,0,0) or part.Color
                    end
                end
            end
        end
    end
end)


--================ GUI 再表示用（魚アイコン） =================
local fishIcon = Instance.new("ImageButton")
fishIcon.Size = UDim2.new(0,50,0,50)
fishIcon.Position = UDim2.new(0,10,0,50)
fishIcon.Image = "rbxassetid://6031075937" -- 好きな魚アイコン
fishIcon.BackgroundTransparency = 0.5
fishIcon.Visible = false
fishIcon.Parent = player:WaitForChild("PlayerGui")

-- GUI非表示時にアイコン表示
Window:OnClosed(function()
    fishIcon.Visible = true
end)

-- 魚アイコンを押したら再表示
fishIcon.MouseButton1Click:Connect(function()
    Window:Show()
    fishIcon.Visible = false
end)
