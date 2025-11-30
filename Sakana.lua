--========================================================--
--                  UtilityHub v3 完全統合              --
--                   Part 1: GUI基盤                   --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--================ 設定 =================
local thumbnailSize = Enum.ThumbnailSize.Size48x48
local guiColor = Color3.fromRGB(30,30,30)
local accentColor = Color3.fromRGB(100,150,255)

--================ GUI =================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UtilityHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

--================ メインフレーム =================
local main = Instance.new("Frame")
main.Size, main.Position = UDim2.new(0, 420, 0, 380), UDim2.new(0, 10, 0, 50)
main.BackgroundColor3 = guiColor
main.BackgroundTransparency = 0.1
main.BorderSizePixel = 0
main.Parent = screenGui
main.Active = true

--================ タイトルバー =================
local titleBar = Instance.new("Frame")
titleBar.Size, titleBar.Position = UDim2.new(1,0,0,30), UDim2.new(0,0,0,0)
titleBar.BackgroundTransparency = 0.3
titleBar.BackgroundColor3 = accentColor
titleBar.Parent = main

local titleLabel = Instance.new("TextLabel")
titleLabel.Size, titleLabel.Position = UDim2.new(1,-60,1,0), UDim2.new(0,10,0,0)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.new(1,1,1)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 20
titleLabel.Text = "Utility Hub"
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

--================ 最小化ボタン =================
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size, minimizeBtn.Position = UDim2.new(0,30,0,0), UDim2.new(1,-30,0,0)
minimizeBtn.Text, minimizeBtn.Font, minimizeBtn.TextSize = "-", Enum.Font.SourceSansBold, 20
minimizeBtn.BackgroundTransparency = 0.5
minimizeBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
minimizeBtn.TextColor3 = Color3.new(1,1,1)
minimizeBtn.Parent = titleBar

--================ 魚アイコン（最小化復帰用） =================
local fishIcon = Instance.new("ImageButton")
fishIcon.Size, fishIcon.Position = UDim2.new(0,48,0,48), UDim2.new(0,10,0,10)
fishIcon.Image = "rbxassetid://10852908795" -- 例の魚アイコンID
fishIcon.BackgroundTransparency = 0.5
fishIcon.BackgroundColor3 = guiColor
fishIcon.Visible = false
fishIcon.Parent = screenGui

--================ ドラッグ機能 =================
local dragging, dragStart, startPos = false, Vector2.new(), main.Position
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
titleBar.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

--================ タブボタン作成 =================
local tabs = {"透視","プレイヤー","戦闘"}
local tabFrames = {}
local tabButtons = {}

local tabButtonContainer = Instance.new("Frame")
tabButtonContainer.Size, tabButtonContainer.Position = UDim2.new(1,0,0,30), UDim2.new(0,0,0,30)
tabButtonContainer.BackgroundTransparency = 1
tabButtonContainer.Parent = main

for i, tabName in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size, btn.Position = UDim2.new(0, 130, 0, 30), UDim2.new(0,(i-1)*130,0,0)
    btn.Text, btn.Font, btn.TextSize = tabName, Enum.Font.SourceSansBold, 16
    btn.BackgroundColor3 = accentColor
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Parent = tabButtonContainer
    tabButtons[tabName] = btn

    local frame = Instance.new("Frame")
    frame.Size, frame.Position = UDim2.new(1,0,1,-30), UDim2.new(0,0,0,30)
    frame.BackgroundColor3 = guiColor
    frame.BackgroundTransparency = 0.1
    frame.Visible = (i==1) -- 初期表示は最初のタブ
    frame.Parent = main
    tabFrames[tabName] = frame

    btn.MouseButton1Click:Connect(function()
        for _, f in pairs(tabFrames) do f.Visible = false end
        frame.Visible = true
    end)
end

--================ 最小化・復帰処理 =================
minimizeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    fishIcon.Visible = true
end)
fishIcon.MouseButton1Click:Connect(function()
    main.Visible = true
    fishIcon.Visible = false
end)

--========================================================--
--              UtilityHub v3 完全統合                  --
--                Part 2: プレイヤータブ               --
--========================================================--

local playerTab = tabFrames["プレイヤー"]

--================ スピード =================
local speedLabel = Instance.new("TextLabel")
speedLabel.Size, speedLabel.Position = UDim2.new(0,200,0,10), UDim2.new(0,10,0,10)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Font, speedLabel.TextSize = Enum.Font.SourceSans, 14
speedLabel.Text = "Speed: 16"
speedLabel.Parent = playerTab

local speedToggle = Instance.new("TextButton")
speedToggle.Size, speedToggle.Position = UDim2.new(0,80,0,24), UDim2.new(0,220,0,10)
speedToggle.Text, speedToggle.Font, speedToggle.TextSize = "Speed OFF", Enum.Font.SourceSans,14
speedToggle.Parent = playerTab

local speedSliderFrame = Instance.new("Frame")
speedSliderFrame.Size, speedSliderFrame.Position = UDim2.new(0,300,0,50), UDim2.new(0,10,0,50)
speedSliderFrame.BackgroundColor3 = Color3.fromRGB(60,60,60)
speedSliderFrame.BorderSizePixel = 0
speedSliderFrame.Parent = playerTab

local speedSliderFill = Instance.new("Frame")
speedSliderFill.Size = UDim2.new(0.08,0,1,0)
speedSliderFill.BackgroundColor3 = accentColor
speedSliderFill.BorderSizePixel = 0
speedSliderFill.Parent = speedSliderFrame

local speedSliderDragger = Instance.new("ImageButton")
speedSliderDragger.Size, speedSliderDragger.Position = UDim2.new(0,16,1,0), UDim2.new(0,0,0,0)
speedSliderDragger.Image = "rbxassetid://3570695787"
speedSliderDragger.BackgroundTransparency = 1
speedSliderDragger.Parent = speedSliderFrame

local speedEnabled = false
local speedValue = 16
local speedMin, speedMax = 0, 200

speedToggle.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedToggle.Text = speedEnabled and "Speed ON" or "Speed OFF"
end)

-- スライダー制御（長押しだけ追従）
local draggingSpeed = false
local function updateSpeed(x)
    local rel = math.clamp(x/speedSliderFrame.AbsoluteSize.X,0,1)
    speedValue = math.floor(speedMin + rel*(speedMax-speedMin) + 0.5)
    speedLabel.Text = "Speed: "..speedValue
    speedSliderFill.Size = UDim2.new(rel,0,1,0)
    speedSliderDragger.Position = UDim2.new(rel-0.02,0,0,0)
end

speedSliderDragger.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        draggingSpeed = true
    end
end)
speedSliderDragger.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        draggingSpeed = false
    end
end)
speedSliderFrame.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        updateSpeed(input.Position.X - speedSliderFrame.AbsolutePosition.X)
        draggingSpeed = true
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if draggingSpeed and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
        updateSpeed(input.Position.X - speedSliderFrame.AbsolutePosition.X)
    end
end)

--================ 無限ジャンプ =================
local jumpToggle = Instance.new("TextButton")
jumpToggle.Size, jumpToggle.Position = UDim2.new(0,140,0,90), UDim2.new(0,10,0,90)
jumpToggle.Text, jumpToggle.Font, jumpToggle.TextSize = "Infinite Jump: OFF", Enum.Font.SourceSans,14
jumpToggle.Parent = playerTab

local infiniteJumpEnabled = false
jumpToggle.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    jumpToggle.Text = infiniteJumpEnabled and "Infinite Jump: ON" or "Infinite Jump: OFF"
end)

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local char = player.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

--================ WallClip =================
local wallClipToggle = Instance.new("TextButton")
wallClipToggle.Size, wallClipToggle.Position = UDim2.new(0,120,0,130), UDim2.new(0,10,0,130)
wallClipToggle.Text, wallClipToggle.Font, wallClipToggle.TextSize = "WallClip: OFF", Enum.Font.SourceSans,14
wallClipToggle.Parent = playerTab

local wallClipEnabled = false
local function setWallClip(enable)
    local char = player.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not not enable
        end
    end
end

wallClipToggle.MouseButton1Click:Connect(function()
    wallClipEnabled = not wallClipEnabled
    wallClipToggle.Text = "WallClip: "..(wallClipEnabled and "ON" or "OFF")
end)

RunService.RenderStepped:Connect(function()
    if wallClipEnabled then
        setWallClip(true)
    end
end)

--================ 空中TP =================
local airTPVisible = true
local airTPBtn = Instance.new("TextButton")
airTPBtn.Size, airTPBtn.Position = UDim2.new(0,100,0,170), UDim2.new(0,10,0,170)
airTPBtn.Text, airTPBtn.Font, airTPBtn.TextSize = "Air TP", Enum.Font.SourceSans,14
airTPBtn.Visible = false
airTPBtn.Parent = screenGui -- 別GUIとして表示
local airTPToggleBtn = Instance.new("TextButton")
airTPToggleBtn.Size, airTPToggleBtn.Position = UDim2.new(0,160,0,210), UDim2.new(0,10,0,210)
airTPToggleBtn.Text, airTPToggleBtn.Font, airTPToggleBtn.TextSize = "Show AirTP Button: ON", Enum.Font.SourceSans,14
airTPToggleBtn.Parent = playerTab

local airTPActive, airTPOriginalCFrame = false, nil

airTPToggleBtn.MouseButton1Click:Connect(function()
    airTPVisible = not airTPVisible
    airTPToggleBtn.Text = "Show AirTP Button: "..(airTPVisible and "ON" or "OFF")
    airTPBtn.Visible = airTPVisible
end)

airTPBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root or not hum then return end
    if not airTPActive then
        airTPOriginalCFrame = root.CFrame
        root.CFrame = root.CFrame + Vector3.new(0,2000,0)
        pcall(function() root.Anchored = true end)
        airTPActive = true
        airTPBtn.Text = "Return from Air"
    else
        if airTPOriginalCFrame then root.CFrame = airTPOriginalCFrame end
        pcall(function() root.Anchored = false end)
        airTPActive = false
        airTPBtn.Text = "Air TP"
    end
end)

--================ WalkSpeed 強制 =================
RunService.RenderStepped:Connect(function()
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if speedEnabled and hum then
        pcall(function() hum.WalkSpeed = speedValue end)
    end
end)

--========================================================--
--               UtilityHub v3 完全統合                 --
--                Part 3: 戦闘タブ機能                  --
--========================================================--

local combatTab = tabFrames["戦闘"]

--================ プレイヤー選択用 =================
local selectedPlayer = nil
local followEnabled = false
local followTarget = nil
local followDistance = 5 -- 後ろ5スタッド

-- プレイヤーリスト表示（名前＋アイコン）
local playersListFrame = Instance.new("ScrollingFrame")
playersListFrame.Size, playersListFrame.Position = UDim2.new(1,0,1,-50), UDim2.new(0,0,0,30)
playersListFrame.BackgroundTransparency = 1
playersListFrame.ScrollBarThickness = 6
playersListFrame.Parent = combatTab

local playersLayout = Instance.new("UIListLayout")
playersLayout.Padding = UDim.new(0,6)
playersLayout.Parent = playersListFrame

local playerButtons = {}
local function makePlayerEntry(p)
    local entry = Instance.new("Frame")
    entry.Size, entry.BackgroundTransparency = UDim2.new(1,-12,0,48), 1

    local img = Instance.new("ImageLabel", entry)
    img.Size, img.Position, img.BackgroundTransparency = UDim2.new(0,48,0,48), UDim2.new(0,0,0,0), 1

    local nameLabel = Instance.new("TextLabel", entry)
    nameLabel.Size, nameLabel.Position = UDim2.new(1,-60,0,48), UDim2.new(0,60,0,0)
    nameLabel.BackgroundTransparency, nameLabel.TextXAlignment = 1, Enum.TextXAlignment.Left
    nameLabel.Text, nameLabel.TextColor3, nameLabel.Font, nameLabel.TextSize = p.Name, Color3.new(1,1,1), Enum.Font.SourceSans,16

    local selectBtn = Instance.new("TextButton", entry)
    selectBtn.Size, selectBtn.Position = UDim2.new(0,48,0,24), UDim2.new(1,-50,0,12)
    selectBtn.Text, selectBtn.Font, selectBtn.TextSize = "Select", Enum.Font.SourceSans,14

    selectBtn.MouseButton1Click:Connect(function()
        selectedPlayer = p
        for pl, btns in pairs(playerButtons) do
            btns.frame.BackgroundTransparency = (pl==selectedPlayer) and 0.6 or 1
        end
    end)

    spawn(function()
        local ok, thumb = pcall(function()
            return Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, thumbnailSize)
        end)
        if ok then img.Image = thumb end
    end)

    return entry
end

local function refreshPlayerList()
    for _, child in ipairs(playersListFrame:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    playerButtons = {}
    for _, pl in ipairs(Players:GetPlayers()) do
        if pl ~= player then
            local entry = makePlayerEntry(pl)
            entry.Parent = playersListFrame
            playersListFrame.CanvasSize = UDim2.new(0,0,0,#playersListFrame:GetChildren()*54)
            playerButtons[pl] = {frame=entry}
        end
    end
end

refreshPlayerList()
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(function(pl)
    refreshPlayerList()
    if selectedPlayer == pl then
        selectedPlayer, followEnabled, followTarget = nil,false,nil
    end
end)

--================ アクションボタン =================
local function makeActionButton(parent,text,posY)
    local btn = Instance.new("TextButton",parent)
    btn.Size, btn.Position = UDim2.new(0,160,0,30),UDim2.new(0,10,0,posY)
    btn.Text, btn.Font, btn.TextSize = text, Enum.Font.SourceSans, 14
    return btn
end

local tpBehindBtn = makeActionButton(combatTab,"TP Behind Selected",10)
local followBtn = makeActionButton(combatTab,"Follow Selected: OFF",50)

tpBehindBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then return end
    local selRoot = selectedPlayer.Character and (selectedPlayer.Character:FindFirstChild("HumanoidRootPart") or selectedPlayer.Character:FindFirstChildWhichIsA("BasePart"))
    local char = player.Character
    local myRoot = char and char:FindFirstChild("HumanoidRootPart")
    if selRoot and myRoot then
        local backPos = selRoot.Position - selRoot.CFrame.LookVector*followDistance
        myRoot.CFrame = CFrame.new(backPos + Vector3.new(0,2,0), selRoot.Position)
    end
end)

followBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then return end
    followEnabled = not followEnabled
    followBtn.Text = "Follow Selected: "..(followEnabled and "ON" or "OFF")
    followTarget = followEnabled and selectedPlayer or nil
end)

--================ 追従ループ =================
RunService.RenderStepped:Connect(function()
    if followEnabled and followTarget and followTarget.Character and followTarget.Character.Parent then
        local selRoot = followTarget.Character:FindFirstChild("HumanoidRootPart") or followTarget.Character:FindFirstChildWhichIsA("BasePart")
        local char = player.Character
        local myRoot = char and char:FindFirstChild("HumanoidRootPart")
        if selRoot and myRoot then
            local newPos = selRoot.Position - selRoot.CFrame.LookVector*followDistance
            newPos = Vector3.new(newPos.X, selRoot.Position.Y+1.5, newPos.Z)
            myRoot.CFrame = CFrame.new(newPos, selRoot.Position)
        end
    end
end)

--========================================================--
--               UtilityHub v3 完全統合                 --
--                Part 4: 敵吸い付き・攻撃範囲          --
--========================================================--

local combatTab = tabFrames["戦闘"]

--================ 敵吸い付きスライダー =================
local rangeLabel = Instance.new("TextLabel")
rangeLabel.Size, rangeLabel.Position = UDim2.new(0,200,0,100), UDim2.new(0,10,0,100)
rangeLabel.Text, rangeLabel.TextColor3, rangeLabel.BackgroundTransparency, rangeLabel.Font, rangeLabel.TextSize =
    "Attack Range: 5", Color3.new(1,1,1), 1, Enum.Font.SourceSans, 14
rangeLabel.Parent = combatTab

local rangeSliderFrame = Instance.new("Frame")
rangeSliderFrame.Size, rangeSliderFrame.Position = UDim2.new(0,300,0,130), UDim2.new(0,10,0,130)
rangeSliderFrame.BackgroundColor3 = Color3.fromRGB(60,60,60)
rangeSliderFrame.BorderSizePixel = 0
rangeSliderFrame.Parent = combatTab

local rangeSliderFill = Instance.new("Frame")
rangeSliderFill.Size = UDim2.new(0.05,0,1,0)
rangeSliderFill.BackgroundColor3 = accentColor
rangeSliderFill.BorderSizePixel = 0
rangeSliderFill.Parent = rangeSliderFrame

local rangeSliderDragger = Instance.new("ImageButton")
rangeSliderDragger.Size, rangeSliderDragger.Position = UDim2.new(0,16,1,0), UDim2.new(0,0,0,0)
rangeSliderDragger.Image = "rbxassetid://3570695787"
rangeSliderDragger.BackgroundTransparency = 1
rangeSliderDragger.Parent = rangeSliderFrame

local attackRange = 5
local maxRange = 50 -- ギリギリまで広げられる

-- スライダー制御（長押し追従）
local draggingRange = false
local function updateRange(x)
    local rel = math.clamp(x/rangeSliderFrame.AbsoluteSize.X,0,1)
    attackRange = math.floor(1 + rel*(maxRange-1))
    rangeLabel.Text = "Attack Range: "..attackRange
    rangeSliderFill.Size = UDim2.new(rel,0,1,0)
    rangeSliderDragger.Position = UDim2.new(rel-0.02,0,0,0)
end

rangeSliderDragger.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then draggingRange=true end
end)
rangeSliderDragger.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then draggingRange=false end
end)
rangeSliderFrame.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        updateRange(input.Position.X-rangeSliderFrame.AbsolutePosition.X)
        draggingRange=true
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if draggingRange and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
        updateRange(input.Position.X-rangeSliderFrame.AbsolutePosition.X)
    end
end)

--================ ヒットボックス表示 =================
local showHitbox = false
local hitboxToggle = Instance.new("TextButton")
hitboxToggle.Size, hitboxToggle.Position = UDim2.new(0,140,0,170), UDim2.new(0,10,0,170)
hitboxToggle.Text, hitboxToggle.Font, hitboxToggle.TextSize = "Show Hitbox: OFF", Enum.Font.SourceSans, 14
hitboxToggle.Parent = combatTab

hitboxToggle.MouseButton1Click:Connect(function()
    showHitbox = not showHitbox
    hitboxToggle.Text = "Show Hitbox: "..(showHitbox and "ON" or "OFF")
end)

--================ 敵自動吸い付き =================
RunService.RenderStepped:Connect(function()
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    for _, enemy in pairs(workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChildOfClass("Humanoid") and (enemy:FindFirstChild("Team") == nil or enemy:FindFirstChild("Team").Value ~= player.Team) then
            local eRoot = enemy:FindFirstChild("HumanoidRootPart")
            if eRoot then
                local dist = (eRoot.Position-root.Position).Magnitude
                if dist <= attackRange then
                    -- 吸い付き：後ろ5スタッド
                    local backPos = eRoot.Position - eRoot.CFrame.LookVector*5
                    root.CFrame = CFrame.new(backPos, eRoot.Position)
                end
                -- ヒットボックス表示
                if showHitbox then
                    for _, part in pairs(enemy:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 0.5
                            part.Color = Color3.fromRGB(255,0,0)
                        end
                    end
                else
                    for _, part in pairs(enemy:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 1
                        end
                    end
                end
            end
        end
    end
end)

--========================================================--
--               UtilityHub v3 完全統合                 --
--                Part 5: 透視タブ・再表示              --
--========================================================--

local overlayTab = tabFrames["透視"]

--================ 透視チェックボックス =================
local function createToggle(parent,labelText,posY,callback)
    local btn = Instance.new("TextButton",parent)
    btn.Size, btn.Position = UDim2.new(0,160,0,30), UDim2.new(0,10,0,posY)
    btn.Text, btn.Font, btn.TextSize = labelText.." OFF", Enum.Font.SourceSans, 14
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = labelText.." "..(state and "ON" or "OFF")
        callback(state)
    end)
    return btn
end

-- プレイヤー透視
createToggle(overlayTab,"Players",10,function(state)
    for _, pl in pairs(Players:GetPlayers()) do
        if pl ~= player and pl.Character then
            for _, part in pairs(pl.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = state and 0.5 or 1
                end
            end
        end
    end
end)

-- Bot透視
createToggle(overlayTab,"Bots",50,function(state)
    for _, bot in pairs(workspace:GetChildren()) do
        if bot:IsA("Model") and bot:FindFirstChild("Bot") then
            for _, part in pairs(bot:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = state and 0.5 or 1
                end
            end
        end
    end
end)

-- 敵透視
createToggle(overlayTab,"Enemies",90,function(state)
    for _, enemy in pairs(workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChildOfClass("Humanoid") then
            for _, part in pairs(enemy:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = state and 0.5 or 1
                end
            end
        end
    end
end)

--================ GUI再表示用魚アイコン =================
local fishIcon = Instance.new("ImageButton")
fishIcon.Size, fishIcon.Position = UDim2.new(0,50,0,50), UDim2.new(1,-60,1,-60)
fishIcon.Image = "rbxassetid://133809232" -- 魚アイコン適当
fishIcon.BackgroundTransparency = 1
fishIcon.Visible = false
fishIcon.Parent = player:WaitForChild("PlayerGui")

-- GUI閉じたとき
screenGui.Enabled = true -- 初期状態
local closeBtn = Instance.new("TextButton", screenGui)
closeBtn.Text, closeBtn.Size, closeBtn.Position = "X", UDim2.new(0,30,0,0), UDim2.new(1,-35,0,5)
closeBtn.BackgroundTransparency = 0.5
closeBtn.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
    fishIcon.Visible = true
end)

-- 魚アイコン押したら再表示
fishIcon.MouseButton1Click:Connect(function()
    screenGui.Enabled = true
    fishIcon.Visible = false
end)
