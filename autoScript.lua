--==================================================
-- Services
--==================================================
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local VirtualInput = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

--==================================================
-- Rejoin後も自動でスクリプトを読み込む設定
--==================================================
Players.LocalPlayer.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.Started then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/<ユーザー名>/<リポジトリ名>/main/autoScript.lua"))()
    end
end)

--==================================================
-- 0️⃣ 最初に5秒待機
--==================================================
task.wait(5)

--==================================================
-- ① マリン強制選択（画面クリック）
--==================================================
task.spawn(function()
    task.wait(2) -- 選択UI待ち

    local cam = workspace.CurrentCamera.ViewportSize
    local x = cam.X * 0.65
    local y = cam.Y * 0.55

    VirtualInput:SendMouseButtonEvent(x, y, 0, true, game, 0)
    task.wait(0.05)
    VirtualInput:SendMouseButtonEvent(x, y, 0, false, game, 0)
end)

--==================================================
-- キャラロード待ち
--==================================================
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

--==================================================
-- ② 見聞色（Eキー）1回
--==================================================
task.wait(1)
VirtualInput:SendKeyEvent(true, Enum.KeyCode.E, false, game)
task.wait(0.05)
VirtualInput:SendKeyEvent(false, Enum.KeyCode.E, false, game)

--==================================================
-- Trainee取得
--==================================================
local function getNearestTrainee()
    local nearest, dist = nil, math.huge
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name == "Trainee" then
            local hum = v:FindFirstChildOfClass("Humanoid")
            local hrp = v:FindFirstChild("HumanoidRootPart")
            if hum and hrp and hum.Health > 0 then
                local d = (root.Position - hrp.Position).Magnitude
                if d < dist then
                    dist = d
                    nearest = hrp
                end
            end
        end
    end
    return nearest
end

--==================================================
-- ③ Traineeに1回TP
--==================================================
task.wait(0.5)
local traineeRoot = getNearestTrainee()
if traineeRoot then
    root.CFrame = traineeRoot.CFrame * CFrame.new(0, 0, -3)
end

--==================================================
-- ④ HP減少検知 → 自動Rejoin
--==================================================
local maxHP = humanoid.Health
local damaged = false

humanoid.HealthChanged:Connect(function(hp)
    if hp < maxHP and not damaged then
        damaged = true
        task.wait(0.2)
        TeleportService:Teleport(game.PlaceId, player)
    end
end)
