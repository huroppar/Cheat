--========================================================--
--          XENO (PC) LOCAL SCRIPT: AUTO & ESP HUB       --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")

--=================== SETTINGS ===================--
local settings = {
    AttackEnabled = false,
    AttackRange = 10,
    AttackSpeed = 0.3,
    GodModeEnabled = false,
    WalkSpeed = 16,
    ESPEnabled = true,
    ESPColor = Color3.fromRGB(0,255,255),
    ESPItemsEnabled = true,
    ESPChestsEnabled = true
}

--=================== TARGET FUNCTIONS ===================--
local function getEnemies()
    local enemies = {}
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:FindFirstChild("EnemyTag") or obj.Name:match("Enemy") then
            table.insert(enemies, obj)
        end
    end
    return enemies
end

local function getItems()
    local items = {}
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:FindFirstChild("ItemTag") or obj.Name:match("Item") then
            table.insert(items, obj)
        end
    end
    return items
end

local function getChests()
    local chests = {}
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:FindFirstChild("ChestTag") or obj.Name:match("Chest") then
            table.insert(chests, obj)
        end
    end
    return chests
end

--=================== ESP FUNCTION ===================--
local function createESP(target, labelText)
    if not target then return end
    if target:FindFirstChild("ESP") then return end
    local primaryPart = target:FindFirstChild("HumanoidRootPart") or target.PrimaryPart
    if not primaryPart then return end

    local esp = Instance.new("BillboardGui")
    esp.Name = "ESP"
    esp.Adornee = primaryPart
    esp.Size = UDim2.new(0,100,0,50)
    esp.AlwaysOnTop = true
    esp.Parent = target

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.TextColor3 = settings.ESPColor
    label.TextScaled = true
    label.Text = labelText or target.Name
    label.Font = Enum.Font.GothamBold
    label.Parent = esp
end

--=================== AUTO ATTACK ===================--
local attackCooldown = 0
local function attackEnemies(dt)
    if not settings.AttackEnabled then return end
    attackCooldown = attackCooldown - dt
    if attackCooldown > 0 then return end
    attackCooldown = settings.AttackSpeed

    for _, enemy in ipairs(getEnemies()) do
        if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
            local distance = (hrp.Position - enemy.HumanoidRootPart.Position).Magnitude
            if distance <= settings.AttackRange then
                enemy.Humanoid:TakeDamage(10)
            end
        end
    end
end

--=================== GOD MODE ===================--
humanoid.HealthChanged:Connect(function(newHealth)
    if settings.GodModeEnabled and newHealth < humanoid.MaxHealth then
        hrp.CFrame = hrp.CFrame + Vector3.new(0,30,0)
    end
end)

--=================== GUI (RayField) ===================--
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()
local Window = Rayfield:CreateWindow({
    Name = "Xeno Hub",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "Masashi Edition",
    ConfigurationSaving = { Enabled = true, FolderName = "XenoHub", FileName = "Settings" },
    KeySystem = false
})

-- Auto Attack Toggle
Window:CreateToggle({
    Name = "Auto Attack",
    CurrentValue = settings.AttackEnabled,
    Flag = "AutoAttack",
    Callback = function(value) settings.AttackEnabled = value end
})

-- Attack Range Slider
Window:CreateSlider({
    Name = "Attack Range",
    Min = 1,
    Max = 50,
    CurrentValue = settings.AttackRange,
    Flag = "AttackRange",
    Callback = function(value) settings.AttackRange = value end
})

-- Attack Speed Slider
Window:CreateSlider({
    Name = "Attack Speed",
    Min = 0.1,
    Max = 2,
    CurrentValue = settings.AttackSpeed,
    Flag = "AttackSpeed",
    Callback = function(value) settings.AttackSpeed = value end
})

-- God Mode Toggle
Window:CreateToggle({
    Name = "God Mode",
    CurrentValue = settings.GodModeEnabled,
    Flag = "GodMode",
    Callback = function(value) settings.GodModeEnabled = value end
})

-- WalkSpeed Slider
Window:CreateSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    CurrentValue = settings.WalkSpeed,
    Flag = "WalkSpeed",
    Callback = function(value) humanoid.WalkSpeed = value end
})

-- ESP Toggle
Window:CreateToggle({
    Name = "ESP",
    CurrentValue = settings.ESPEnabled,
    Flag = "ESP",
    Callback = function(value) settings.ESPEnabled = value end
})

-- ESP Color Picker
Window:CreateColorPicker({
    Name = "ESP Color",
    CurrentColor = settings.ESPColor,
    Flag = "ESPColor",
    Callback = function(color) settings.ESPColor = color end
})

-- Item ESP Toggle
Window:CreateToggle({
    Name = "Item ESP",
    CurrentValue = settings.ESPItemsEnabled,
    Flag = "ESPItems",
    Callback = function(value) settings.ESPItemsEnabled = value end
})

-- Chest ESP Toggle
Window:CreateToggle({
    Name = "Chest ESP",
    CurrentValue = settings.ESPChestsEnabled,
    Flag = "ESPChests",
    Callback = function(value) settings.ESPChestsEnabled = value end
})

--=================== MAIN LOOP ===================--
RunService.RenderStepped:Connect(function(dt)
    attackEnemies(dt)

    if settings.ESPEnabled then
        for _, enemy in ipairs(getEnemies()) do
            createESP(enemy, "Enemy")
        end
    end

    if settings.ESPItemsEnabled then
        for _, item in ipairs(getItems()) do
            createESP(item, "Item")
        end
    end

    if settings.ESPChestsEnabled then
        for _, chest in ipairs(getChests()) do
            createESP(chest, "Chest")
        end
    end
end)
