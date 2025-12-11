-- OrionLibロード
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/WRUyYTdY"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

--=============================
-- Window作成
--=============================
local Window = OrionLib:MakeWindow({Name = "Utility Hub v5", HidePremium = true, SaveConfig = true, ConfigFolder = "UtilityHubConfigs"})

--=============================
-- プレイヤータブ
--=============================
local playerTab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

-- Fly
local flyActive = false
local flySpeed = 50
local flyKeys = {W=false, A=false, S=false, D=false, Space=false, LeftShift=false}

playerTab:AddToggle({
    Name = "Fly",
    Default = false,
    Callback = function(val)
        flyActive = val
    end
})

playerTab:AddSlider({
    Name = "Fly速度",
    Min = 10,
    Max = 200,
    Default = flySpeed,
    Increment = 5,
    Suffix = " stud/s",
    Callback = function(val)
        flySpeed = val
    end
})

-- Cylinder.015追従
local moveActive = false
local targetName = "Cylinder.015"
local slideSpeed = 20

playerTab:AddToggle({
    Name = "Cylinder追従",
    Default = false,
    Callback = function(val)
        moveActive = val
    end
})

playerTab:AddSlider({
    Name = "追従速度",
    Min = 5,
    Max = 50,
    Default = slideSpeed,
    Increment = 1,
    Suffix = " stud/s",
    Callback = function(val)
        slideSpeed = val
    end
})

-- Pickup自動取得
local slideActive = false
playerTab:AddToggle({
    Name = "Pickup自動取得",
    Default = false,
    Callback = function(val)
        slideActive = val
    end
})

playerTab:AddSlider({
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

--=============================
-- Helper
--=============================
local function getCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    return char, hum, root
end

local function getPickups()
    local targets = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "PickupHitbox" and obj.Parent then
            table.insert(targets, obj)
        end
    end
    return targets
end

--=============================
-- Input処理（PC用）
--=============================
UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if flyKeys[input.KeyCode.Name] ~= nil then
            flyKeys[input.KeyCode.Name] = true
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if flyKeys[input.KeyCode.Name] ~= nil then
            flyKeys[input.KeyCode.Name] = false
        end
    end
end)

--=============================
-- RenderStepped
--=============================
RunService.RenderStepped:Connect(function(dt)
    local char, hum, root = getCharacter()
    if not root or not hum then return end

    -- Fly制御
    if flyActive then
        local cam = workspace.CurrentCamera
        local move = Vector3.new(0,0,0)
        local look = cam.CFrame.LookVector

        if flyKeys.W then move = move + look end
        if flyKeys.S then move = move - look end
        if flyKeys.A then move = move - cam.CFrame.RightVector end
        if flyKeys.D then move = move + cam.CFrame.RightVector end
        if flyKeys.Space then move = move + Vector3.new(0,1,0) end
        if flyKeys.LeftShift then move = move - Vector3.new(0,1,0) end

        if move.Magnitude > 0 then
            root.CFrame = root.CFrame + move.Unit * flySpeed * dt
        end
    end

    -- Pickup自動取得
    if slideActive then
        local pickups = getPickups()
        if #pickups > 0 then
            local target = pickups[1]
            if target and target.Parent then
                root.CFrame = CFrame.new(target.Position + Vector3.new(0,3,0))
                if (root.Position - target.Position).Magnitude < 3 then
                    pcall(function()
                        firetouchinterest(root, target, 0)
                        firetouchinterest(root, target, 1)
                        if target and target.Parent then target:Destroy() end
                    end)
                end
            end
        end
    end

    -- Cylinder.015追従
    if moveActive then
        local targetPart = workspace:FindFirstChild(targetName, true)
        if targetPart then
            local targetPos = targetPart.Position + Vector3.new(0,5,0)
            root.CFrame = root.CFrame:Lerp(CFrame.new(targetPos), math.clamp(slideSpeed*dt,0,1))
        end
    end
end)
