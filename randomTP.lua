--=============================
-- ランダムプレイヤー追跡スクリプト
--=============================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

--=======================
-- GUI作成
--=======================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FollowGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "FollowToggle"
ToggleButton.Size = UDim2.new(0, 140, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "追跡: OFF"
ToggleButton.Parent = ScreenGui

--=======================
-- 追跡ロジック
--=======================
local followEnabled = false
local currentTarget = nil

-- ランダムなプレイヤー選択
local function getRandomTarget()
    local candidates = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
            table.insert(candidates, p)
        end
    end
    if #candidates == 0 then return nil end
    return candidates[math.random(1, #candidates)]
end

-- ボタンでオンオフ切り替え
ToggleButton.MouseButton1Click:Connect(function()
    followEnabled = not followEnabled
    ToggleButton.Text = followEnabled and "追跡: ON" or "追跡: OFF"
    if followEnabled then
        currentTarget = getRandomTarget()
    end
end)

-- 毎フレーム追従
RunService.RenderStepped:Connect(function()
    if followEnabled and currentTarget then
        -- ターゲットが死んでたら次を選ぶ
        if not currentTarget.Character or currentTarget.Character.Humanoid.Health <= 0 then
            currentTarget = getRandomTarget()
        end

        -- 追跡
        if currentTarget and currentTarget.Character and currentTarget.Character:FindFirstChild("HumanoidRootPart") then
            local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myHRP then
                local targetHRP = currentTarget.Character.HumanoidRootPart
                -- 後ろ3スタッドに張り付く
                local newPos = targetHRP.Position - targetHRP.CFrame.LookVector * 3
                myHRP.CFrame = CFrame.new(newPos, targetHRP.Position)
            end
        end
    end
end)

