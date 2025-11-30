--========================================================--
--               GUI AUTO CREATION (DRAG + COLOR)          --
--========================================================--

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "UtilityGUI"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 300, 0, 260)
frame.Position = UDim2.new(0.35, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 34)
title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
title.Text = "Utility Menu"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = frame

-- Section: Theme Colors
local sectionLabel = Instance.new("TextLabel")
sectionLabel.Size = UDim2.new(1, -20, 0, 26)
sectionLabel.Position = UDim2.new(0, 10, 0, 45)
sectionLabel.BackgroundTransparency = 1
sectionLabel.Text = "Theme Colors"
sectionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
sectionLabel.Font = Enum.Font.GothamBold
sectionLabel.TextSize = 16
sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
sectionLabel.Parent = frame

-- Neon Blue Button
local neonBtn = Instance.new("TextButton")
neonBtn.Size = UDim2.new(0, 120, 0, 40)
neonBtn.Position = UDim2.new(0, 10, 0, 80)
neonBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
neonBtn.Text = "Neon Blue"
neonBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
neonBtn.Font = Enum.Font.GothamBold
neonBtn.TextSize = 16
neonBtn.Parent = frame

-- Nebula Button
local nebulaBtn = Instance.new("TextButton")
nebulaBtn.Size = UDim2.new(0, 120, 0, 40)
nebulaBtn.Position = UDim2.new(0, 160, 0, 80)
nebulaBtn.BackgroundColor3 = Color3.fromRGB(130, 0, 255)
nebulaBtn.Text = "Nebula"
nebulaBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
nebulaBtn.Font = Enum.Font.GothamBold
nebulaBtn.TextSize = 16
nebulaBtn.Parent = frame

-- Color Picker Slider (R,G,B)
local colorPickerLabel = Instance.new("TextLabel")
colorPickerLabel.Size = UDim2.new(1, -20, 0, 26)
colorPickerLabel.Position = UDim2.new(0, 10, 0, 140)
colorPickerLabel.BackgroundTransparency = 1
colorPickerLabel.Text = "Custom Color"
colorPickerLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
colorPickerLabel.Font = Enum.Font.GothamBold
colorPickerLabel.TextSize = 16
colorPickerLabel.TextXAlignment = Enum.TextXAlignment.Left
colorPickerLabel.Parent = frame

local function createSlider(name, yOffset)
    local slider = Instance.new("TextButton")
    slider.Name = name
    slider.Size = UDim2.new(1, -20, 0, 24)
    slider.Position = UDim2.new(0, 10, 0, yOffset)
    slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    slider.Text = name .. ": 255"
    slider.TextColor3 = Color3.fromRGB(255, 255, 255)
    slider.Font = Enum.Font.GothamBold
    slider.TextSize = 14
    slider.Parent = frame
    return slider
end

local rSlider = createSlider("R", 170)
local gSlider = createSlider("G", 200)
local bSlider = createSlider("B", 230)

-- Current selected color
local currentColor = Color3.fromRGB(40,40,40)


--========================================================--
--                       FUNCTIONS                        --
--========================================================--

-- Apply theme color
local function applyThemeColor(col)
    currentColor = col
    frame.BackgroundColor3 = col
end

-- Neon blue
neonBtn.MouseButton1Click:Connect(function()
    applyThemeColor(Color3.fromRGB(0, 170, 255))
end)

-- Nebula
nebulaBtn.MouseButton1Click:Connect(function()
    applyThemeColor(Color3.fromRGB(140, 0, 255))
end)

-- Sliders
local UIS = game:GetService("UserInputService")

local function sliderDrag(slider)
    local holding = false
    slider.MouseButton1Down:Connect(function()
        holding = true
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            holding = false
        end
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if holding then
            local x = math.clamp((UIS:GetMouseLocation().X - slider.AbsolutePosition.X), 0, slider.AbsoluteSize.X)
            local value = math.floor(x / slider.AbsoluteSize.X * 255)
            slider.Text = slider.Name .. ": " .. value

            local r = tonumber(rSlider.Text:split(": ")[2])
            local g = tonumber(gSlider.Text:split(": ")[2])
            local b = tonumber(bSlider.Text:split(": ")[2])

            applyThemeColor(Color3.fromRGB(r,g,b))
        end
    end)
end

sliderDrag(rSlider)
sliderDrag(gSlider)
sliderDrag(bSlider)

print("[GUI READY]  この下にメイン処理を書けば完成。")

-- LocalScript (StarterPlayerScripts に入れて使ってください)
-- 機能:
--  - WalkSpeed スライダー (強制上書き)
--  - 無限ジャンプ ON/OFF
--  - プレイヤー一覧 (名前 + アイコン)
--     - 選んだプレイヤーに瞬間TP（後ろ）/ 追従（張り付く）できる
--  - 空中TPボタン表示のON/OFF。押すと 2000 studs 上へ TP -> 押すと戻る。上にいる間は落ちない（Anchored）
-- 注意: ゲーム側の保護（サーバー側の厳重な検査）があると一部機能は動かないことがあります。

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer

-- 設定（必要なら調整）
local speedDefault = 16
local speedMin, speedMax = 0, 200
local speedEnforceInterval = 0.1 -- WalkSpeedを再設定する間隔（秒）
local followUpdateInterval = 0.1 -- 追従の更新間隔
local followDistance = 3         -- 対象の後ろに張り付く距離（studs）
local airHeight = 2000
local thumbnailSize = Enum.ThumbnailSize.Size48x48

-- 状態
local speedEnabled = false
local desiredSpeed = speedDefault
local infiniteJumpEnabled = false
local followEnabled = false
local followTarget = nil
local airTPActive = false
local airTPOriginalCFrame = nil
local airTPAnchored = false

-- helper: get local character and humanoid/root
local function getCharacter()
    local char = player.Character
    if not char then
        char = player.CharacterAdded:Wait()
    end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
    return char, humanoid, root
end

-- GUI 作成
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UtilityHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- メインフレーム
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 420, 0, 380)
main.Position = UDim2.new(0, 10, 0, 50)
main.BackgroundTransparency = 0.15
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.BorderSizePixel = 0
main.Parent = screenGui
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Text = "Utility Hub"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20

-- スピードスライダー & 表示
local speedLabel = Instance.new("TextLabel", main)
speedLabel.Size = UDim2.new(0, 200, 0, 24)
speedLabel.Position = UDim2.new(0, 10, 0, 40)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Text = "Speed: "..tostring(speedDefault)

local speedToggle = Instance.new("TextButton", main)
speedToggle.Size = UDim2.new(0,80,0,24)
speedToggle.Position = UDim2.new(0, 220, 0, 40)
speedToggle.Text = "Speed OFF"
speedToggle.Font = Enum.Font.SourceSans
speedToggle.TextSize = 14

-- スライダー（簡易）
local sliderFrame = Instance.new("Frame", main)
sliderFrame.Size = UDim2.new(0, 300, 0, 18)
sliderFrame.Position = UDim2.new(0, 10, 0, 70)
sliderFrame.BackgroundColor3 = Color3.fromRGB(60,60,60)
sliderFrame.BorderSizePixel = 0

local sliderFill = Instance.new("Frame", sliderFrame)
sliderFill.Size = UDim2.new((speedDefault - speedMin)/(speedMax - speedMin), 0, 1, 0)
sliderFill.BackgroundColor3 = Color3.fromRGB(120,120,255)
sliderFill.BorderSizePixel = 0

local sliderDragger = Instance.new("ImageButton", sliderFrame)
sliderDragger.Size = UDim2.new(0, 18, 0, 18)
sliderDragger.Position = UDim2.new((speedDefault - speedMin)/(speedMax - speedMin) - 0.018, 0, 0, 0)
sliderDragger.BackgroundTransparency = 1
sliderDragger.Image = "rbxassetid://3570695787" -- simple circle

-- 無限ジャンプトグル
local jumpToggle = Instance.new("TextButton", main)
jumpToggle.Size = UDim2.new(0,120,0,24)
jumpToggle.Position = UDim2.new(0, 10, 0, 100)
jumpToggle.Text = "Infinite Jump: OFF"
jumpToggle.Font = Enum.Font.SourceSans
jumpToggle.TextSize = 14

-- プレイヤー一覧フレーム
local playersFrame = Instance.new("Frame", main)
playersFrame.Size = UDim2.new(0, 200, 0, 210)
playersFrame.Position = UDim2.new(0, 10, 0, 140)
playersFrame.BackgroundTransparency = 0.2
playersFrame.BorderSizePixel = 0

local playersTitle = Instance.new("TextLabel", playersFrame)
playersTitle.Size = UDim2.new(1,0,0,24)
playersTitle.Position = UDim2.new(0,0,0,0)
playersTitle.BackgroundTransparency = 1
playersTitle.Text = "Players"
playersTitle.TextColor3 = Color3.new(1,1,1)
playersTitle.TextSize = 16
playersTitle.Font = Enum.Font.SourceSansBold

local playersList = Instance.new("ScrollingFrame", playersFrame)
playersList.Size = UDim2.new(1,0,1,-24)
playersList.Position = UDim2.new(0,0,0,24)
playersList.CanvasSize = UDim2.new(0,0,0,0)
playersList.BackgroundTransparency = 1
playersList.ScrollBarThickness = 6

local playersLayout = Instance.new("UIListLayout", playersList)
playersLayout.Padding = UDim.new(0,6)

-- アクションボタン群（右側）
local actionsFrame = Instance.new("Frame", main)
actionsFrame.Size = UDim2.new(0, 190, 0, 210)
actionsFrame.Position = UDim2.new(0, 220, 0, 140)
actionsFrame.BackgroundTransparency = 0.2

local actionsTitle = Instance.new("TextLabel", actionsFrame)
actionsTitle.Size = UDim2.new(1,0,0,24)
actionsTitle.Position = UDim2.new(0,0,0,0)
actionsTitle.BackgroundTransparency = 1
actionsTitle.Text = "Actions"
actionsTitle.TextColor3 = Color3.new(1,1,1)
actionsTitle.TextSize = 16
actionsTitle.Font = Enum.Font.SourceSansBold

local tpBehindBtn = Instance.new("TextButton", actionsFrame)
tpBehindBtn.Size = UDim2.new(0, 160, 0, 30)
tpBehindBtn.Position = UDim2.new(0, 10, 0, 40)
tpBehindBtn.Text = "TP Behind Selected"
tpBehindBtn.Font = Enum.Font.SourceSans
tpBehindBtn.TextSize = 14

local followBtn = Instance.new("TextButton", actionsFrame)
followBtn.Size = UDim2.new(0, 160, 0, 30)
followBtn.Position = UDim2.new(0, 10, 0, 80)
followBtn.Text = "Follow Selected: OFF"
followBtn.Font = Enum.Font.SourceSans
followBtn.TextSize = 14

local airTPToggleBtn = Instance.new("TextButton", actionsFrame)
airTPToggleBtn.Size = UDim2.new(0,160,0,30)
airTPToggleBtn.Position = UDim2.new(0,10,0,120)
airTPToggleBtn.Text = "Show AirTP Button: ON"
airTPToggleBtn.Font = Enum.Font.SourceSans
airTPToggleBtn.TextSize = 14

local airTPBtn = Instance.new("TextButton", actionsFrame)
airTPBtn.Size = UDim2.new(0,160,0,30)
airTPBtn.Position = UDim2.new(0,10,0,160)
airTPBtn.Text = "Air TP"
airTPBtn.Font = Enum.Font.SourceSans
airTPBtn.TextSize = 14

-- 初期: AirTPボタンは表示ON設定。ユーザーが切れば非表示
local airTPVisible = true

-- 選択中プレイヤー
local selectedPlayer = nil

-- プレイヤーリスト作成/更新
local playerButtons = {}

local function makePlayerEntry(p)
    local entry = Instance.new("Frame")
    entry.Size = UDim2.new(1, -12, 0, 48)
    entry.BackgroundTransparency = 1

    local image = Instance.new("ImageLabel", entry)
    image.Size = UDim2.new(0, 48, 0, 48)
    image.Position = UDim2.new(0, 0, 0, 0)
    image.BackgroundTransparency = 1
    image.Image = "" -- 後で入れる

    local nameLabel = Instance.new("TextLabel", entry)
    nameLabel.Size = UDim2.new(1, -60, 0, 48)
    nameLabel.Position = UDim2.new(0, 60, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Text = p.Name
    nameLabel.TextColor3 = Color3.new(1,1,1)
    nameLabel.Font = Enum.Font.SourceSans
    nameLabel.TextSize = 16

    local selectBtn = Instance.new("TextButton", entry)
    selectBtn.Size = UDim2.new(0, 48, 0, 24)
    selectBtn.Position = UDim2.new(1, -50, 0, 12)
    selectBtn.Text = "Select"
    selectBtn.Font = Enum.Font.SourceSans
    selectBtn.TextSize = 14

    selectBtn.MouseButton1Click:Connect(function()
        selectedPlayer = p
        -- 選択表示を更新（簡易）
        for pl, btns in pairs(playerButtons) do
            btns.frame.BackgroundTransparency = (pl == selectedPlayer) and 0.6 or 1
        end
    end)

    -- サムネを非同期で取る（headshot）
    spawn(function()
        local success, thumbnail = pcall(function()
            return Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, thumbnailSize)
        end)
        if success and thumbnail then
            image.Image = thumbnail
        end
    end)

    return entry
end

local function refreshPlayerList()
    -- 既存をクリア
    for _, child in ipairs(playersList:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    playerButtons = {}

    for _, pl in ipairs(Players:GetPlayers()) do
        if pl ~= player then
            local entry = makePlayerEntry(pl)
            entry.Parent = playersList
            playersList.CanvasSize = UDim2.new(0,0,0, #playersList:GetChildren() * 54)
            playerButtons[pl] = {frame = entry}
        end
    end
end

-- 初回リスト作成
refreshPlayerList()
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(function()
    refreshPlayerList()
    if selectedPlayer and not Players:FindFirstChild(selectedPlayer.Name) then
        selectedPlayer = nil
    end
end)

-- UI ハンドラ
speedToggle.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedToggle.Text = speedEnabled and "Speed ON" or "Speed OFF"
end)

jumpToggle.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    jumpToggle.Text = infiniteJumpEnabled and "Infinite Jump: ON" or "Infinite Jump: OFF"
end)

tpBehindBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then return end
    local selChar = selectedPlayer.Character
    if not selChar then return end
    local selRoot = selChar:FindFirstChild("HumanoidRootPart") or selChar:FindFirstChildWhichIsA("BasePart")
    if not selRoot then return end
    local myChar, myHum, myRoot = getCharacter()
    if not myRoot then return end

    -- 後ろの位置（followDistance分後ろ）
    local backPos = selRoot.CFrame.Position - (selRoot.CFrame.LookVector * followDistance)
    myRoot.CFrame = CFrame.new(backPos + Vector3.new(0, 2, 0)) * CFrame.Angles(0, selRoot.CFrame.LookVector:Angle(Vector3.new(0,0,1)), 0)
    -- (単純に配置)
end)

followBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then return end
    followEnabled = not followEnabled
    followBtn.Text = "Follow Selected: " .. (followEnabled and "ON" or "OFF")
    if not followEnabled then
        followTarget = nil
    else
        followTarget = selectedPlayer
    end
end)

airTPToggleBtn.MouseButton1Click:Connect(function()
    airTPVisible = not airTPVisible
    airTPToggleBtn.Text = "Show AirTP Button: " .. (airTPVisible and "ON" or "OFF")
    airTPBtn.Visible = airTPVisible
end)

airTPBtn.MouseButton1Click:Connect(function()
    local char, hum, root = getCharacter()
    if not root or not hum then return end
    if not airTPActive then
        -- 有効化: 保存して 2000 上に飛ばす。落ちないように Anchored = true
        airTPOriginalCFrame = root.CFrame
        -- move up
        root.CFrame = root.CFrame + Vector3.new(0, airHeight, 0)
        -- anchor root to prevent falling
        local anchoredSuccess, err = pcall(function()
            root.Anchored = true
        end)
        airTPAnchored = anchoredSuccess
        airTPActive = true
        airTPBtn.Text = "Return from Air"
    else
        -- 戻す: アンカー外して元に戻す
        if airTPAnchored then
            pcall(function() root.Anchored = false end)
        end
        if airTPOriginalCFrame then
            root.CFrame = airTPOriginalCFrame
        end
        airTPActive = false
        airTPBtn.Text = "Air TP"
    end
end)

-- スライダー操作（タッチ/ドラッグ対応）
local dragging = false
local function setSliderFromX(x)
    local rel = math.clamp(x / sliderFrame.AbsoluteSize.X, 0, 1)
    sliderFill.Size = UDim2.new(rel, 0, 1, 0)
    sliderDragger.Position = UDim2.new(rel - 0.018, 0, 0, 0)
    desiredSpeed = math.floor(speedMin + rel * (speedMax - speedMin) + 0.5)
    speedLabel.Text = "Speed: "..tostring(desiredSpeed)
end

sliderDragger.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
    end
end)
sliderDragger.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
sliderFrame.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        local absX = inp.Position.X - sliderFrame.AbsolutePosition.X
        setSliderFromX(absX)
        dragging = true
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local absX = input.Position.X - sliderFrame.AbsolutePosition.X
        setSliderFromX(absX)
    end
end)

-- 無限ジャンプ処理（JumpRequest を使う）
local function onJumpRequest()
    if infiniteJumpEnabled then
        local char, hum = getCharacter()
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end
UserInputService.JumpRequest:Connect(onJumpRequest)

-- WalkSpeed強制上書きループ（軽量）
spawn(function()
    local accum = 0
    while true do
        local _, hum = getCharacter()
        if speedEnabled and hum then
            pcall(function() hum.WalkSpeed = desiredSpeed end)
        end
        wait(speedEnforceInterval)
    end
end)

-- 追従（張り付く）ループ
spawn(function()
    while true do
        if followEnabled and followTarget and followTarget.Character and followTarget.Character.Parent then
            local selRoot = followTarget.Character:FindFirstChild("HumanoidRootPart") or followTarget.Character:FindFirstChildWhichIsA("BasePart")
            local myChar, myHum, myRoot = getCharacter()
            if selRoot and myRoot then
                local targetPos = selRoot.Position - selRoot.CFrame.LookVector * followDistance
                -- 高さは対象に合わせて少し上げる
                local newPos = Vector3.new(targetPos.X, selRoot.Position.Y + 1.5, targetPos.Z)
                -- テレポート（平滑化は行わない：即張り付く）
                myRoot.CFrame = CFrame.new(newPos, selRoot.Position)
            end
        end
        wait(followUpdateInterval)
    end
end)

-- AirTP 安全維持ループ（落ちないようにする）: 何か上下運動を止めたいとき補助
spawn(function()
    while true do
        if airTPActive then
            -- 追加の安全処理: zero velocity
            local _, _, root = getCharacter()
            if root then
                pcall(function()
                    root.Velocity = Vector3.new(0,0,0)
                    root.RotVelocity = Vector3.new(0,0,0)
                end)
            end
        end
        wait(0.2)
    end
end)

-- プレイヤー追従・選択の安全化: 選択プレイヤーが消えたら解除
Players.PlayerRemoving:Connect(function(pl)
    if selectedPlayer == pl then
        selectedPlayer = nil
        followEnabled = false
        followTarget = nil
        followBtn.Text = "Follow Selected: OFF"
    end
end)

-- GUI の初期表示設定
airTPBtn.Visible = airTPVisible

-- Keyboard 簡易ショートカット (Tで自動伐採のON/OFFみたいなキーを好むなら追加可能)
-- 例: Speed toggle をキーボード T で行いたければ下記を有効化（コメント外す）
-- UserInputService.InputBegan:Connect(function(input, gameProcessed)
--     if gameProcessed then return end
--     if input.KeyCode == Enum.KeyCode.T then
--         speedEnabled = not speedEnabled
--         speedToggle.Text = speedEnabled and "Speed ON" or "Speed OFF"
--     end
-- end)

-- ここまでで基本機能は完成
print("UtilityHub loaded.")
