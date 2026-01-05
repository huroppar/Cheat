--========================================================--
--           🔵 50スタッド以内のPart検出ビューア           --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

-- GUI作成
local gui = Instance.new("ScreenGui", game.CoreGui)
local button = Instance.new("TextButton", gui)

button.Size = UDim2.new(0, 200, 0, 40)
button.Position = UDim2.new(0, 20, 0, 200)
button.Text = "Part Finder：OFF"
button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 18

-- 状態
local enabled = false
local foundParts = {} -- {instance → BillboardGui}

-- Billboard作成
local function createBillboard(part)
    local b = Instance.new("BillboardGui")
    b.Size = UDim2.new(0, 60, 0, 20)
    b.Adornee = part
    b.AlwaysOnTop = true
    b.Parent = gui

    local label = Instance.new("TextLabel", b)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.TextStrokeTransparency = 0.3
    label.Text = part.Name
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14

    return b
end

-- 全削除
local function clearAll()
    for part, bb in pairs(foundParts) do
        if bb then bb:Destroy() end
    end
    foundParts = {}
end

-- 50スタッド以内のPartを更新
local function updateParts()
    if not enabled then return end
    local hrpPos = root.Position

    -- 今フレームで見つかったやつ
    local current = {}

    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local dist = (obj.Position - hrpPos).Magnitude
            if dist <= 50 then
                current[obj] = true
                if not foundParts[obj] then
                    foundParts[obj] = createBillboard(obj)
                end
            end
        end
    end

    -- 50m外に出たやつ削除
    for obj, bb in pairs(foundParts) do
        if not current[obj] then
            bb:Destroy()
            foundParts[obj] = nil
        end
    end
end

-- 0.5秒ごとに更新
task.spawn(function()
    while true do
        if enabled then
            updateParts()
        end
        task.wait(0.5)
    end
end)

-- ボタン切替
button.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        button.Text = "Part Finder：ON"
        button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    else
        button.Text = "Part Finder：OFF"
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        clearAll()
    end
end)
