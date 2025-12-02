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
