--========================================================--
--                    UtilityHub v3                       --
--========================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

--================ 設定 =================
local speedDefault, speedMin, speedMax = 16, 0, 200
local speedInterval = 0.1
local followInterval, followDistance = 0.1, 3
local airHeight = 2000
local thumbnailSize = Enum.ThumbnailSize.Size48x48

--================ 状態 =================
local speedEnabled, infiniteJumpEnabled = false, false
local followEnabled, followTarget = false, nil
local airTPActive, airTPAnchored, airTPOriginalCFrame = false, false, nil
local desiredSpeed = speedDefault
local selectedPlayer = nil
local wallClipEnabled = false

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
            part.CanCollide = not not enable -- true/false切り替え
        end
    end
end


--================ GUI =================
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "UtilityHub"
screenGui.ResetOnSpawn = false

local main = Instance.new("Frame", screenGui)
main.Size, main.Position = UDim2.new(0,420,0,380), UDim2.new(0,10,0,50)
main.BackgroundColor3, main.BackgroundTransparency = Color3.fromRGB(30,30,30), 0.1
main.BorderSizePixel = 0

-- ドラッグ対応
main.Active = true
local dragging, dragStart, startPos = false, Vector2.new(), main.Position
main.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
main.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- タイトル
local title = Instance.new("TextLabel", main)
title.Size, title.Position = UDim2.new(1,0,0,30), UDim2.new(0,0,0,0)
title.BackgroundTransparency, title.TextColor3 = 1, Color3.new(1,1,1)
title.Text, title.Font, title.TextSize = "Utility Hub", Enum.Font.SourceSansBold, 20

-- Speed ラベル＆トグル
local speedLabel = Instance.new("TextLabel", main)
speedLabel.Size, speedLabel.Position = UDim2.new(0,200,0,40), UDim2.new(0,10,0,40)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.fromRGB(255,255,255)
speedLabel.Text = "Speed: "..speedDefault
speedLabel.Font, speedLabel.TextSize = Enum.Font.SourceSans,14

local speedToggle = Instance.new("TextButton", main)
speedToggle.Size, speedToggle.Position = UDim2.new(0,80,0,24), UDim2.new(0,220,0,40)
speedToggle.Text, speedToggle.Font, speedToggle.TextSize = "Speed OFF", Enum.Font.SourceSans,14

-- スライダー
local sliderFrame = Instance.new("Frame", main)
sliderFrame.Size, sliderFrame.Position = UDim2.new(0,300,0,18), UDim2.new(0,10,0,70)
sliderFrame.BackgroundColor3, sliderFrame.BorderSizePixel = Color3.fromRGB(60,60,60),0

local sliderFill = Instance.new("Frame", sliderFrame)
sliderFill.Size, sliderFill.BackgroundColor3, sliderFill.BorderSizePixel = UDim2.new((speedDefault-speedMin)/(speedMax-speedMin),0,1,0), Color3.fromRGB(100,150,255),0

local sliderDragger = Instance.new("ImageButton", sliderFrame)
sliderDragger.Size, sliderDragger.Position = UDim2.new((speedDefault-speedMin)/(speedMax-speedMin)-0.018,0,0,0), UDim2.new((speedDefault-speedMin)/(speedMax-speedMin)-0.018,0,0,0)
sliderDragger.BackgroundTransparency, sliderDragger.Image = 1, "rbxassetid://3570695787"

-- 無限ジャンプトグル
local jumpToggle = Instance.new("TextButton", main)
jumpToggle.Size, jumpToggle.Position = UDim2.new(0,120,0,24), UDim2.new(0,10,0,100)
jumpToggle.Text, jumpToggle.Font, jumpToggle.TextSize = "Infinite Jump: OFF", Enum.Font.SourceSans,14

-- プレイヤーリスト
local playersFrame = Instance.new("Frame", main)
playersFrame.Size, playersFrame.Position = UDim2.new(0,200,0,210), UDim2.new(0,10,0,140)
playersFrame.BackgroundTransparency, playersFrame.BorderSizePixel = 0.2,0

local playersTitle = Instance.new("TextLabel", playersFrame)
playersTitle.Size, playersTitle.Position = UDim2.new(1,0,0,24), UDim2.new(0,0,0,0)
playersTitle.BackgroundTransparency, playersTitle.TextColor3 = 1, Color3.fromRGB(255,255,255)
playersTitle.Text, playersTitle.TextSize, playersTitle.Font = "Players",16,Enum.Font.SourceSansBold

local playersList = Instance.new("ScrollingFrame", playersFrame)
playersList.Size, playersList.Position = UDim2.new(1,0,1,-24), UDim2.new(0,0,0,24)
playersList.BackgroundTransparency, playersList.ScrollBarThickness = 1,6
local playersLayout = Instance.new("UIListLayout", playersList)
playersLayout.Padding = UDim.new(0,6)

-- アクションボタン
local actionsFrame = Instance.new("Frame", main)
actionsFrame.Size, actionsFrame.Position = UDim2.new(0,190,0,210), UDim2.new(0,220,0,140)
actionsFrame.BackgroundTransparency = 0.2

local wallClipBtn = Instance.new("TextButton", actionsFrame)
wallClipBtn.Size = UDim2.new(0, 160, 0, 30)
wallClipBtn.Position = UDim2.new(0, 10, 0, 200) -- 他のボタンの下
wallClipBtn.Text = "WallClip: OFF"
wallClipBtn.Font = Enum.Font.SourceSans
wallClipBtn.TextSize = 14


local function makeActionButton(parent,text,posY)
    local btn = Instance.new("TextButton",parent)
    btn.Size,btn.Position = UDim2.new(0,160,0,30),UDim2.new(0,10,0,posY)
    btn.Text,btn.Font,btn.TextSize = text,Enum.Font.SourceSans,14
    return btn
end

local tpBehindBtn = makeActionButton(actionsFrame,"TP Behind Selected",40)
local followBtn = makeActionButton(actionsFrame,"Follow Selected: OFF",80)
local airTPToggleBtn = makeActionButton(actionsFrame,"Show AirTP Button: ON",120)
local airTPBtn = makeActionButton(actionsFrame,"Air TP",160)
local airTPVisible = true
airTPBtn.Visible = airTPVisible

--================ プレイヤーリスト作成 =================
local playerButtons = {}
local function makePlayerEntry(p)
    local entry = Instance.new("Frame")
    entry.Size, entry.BackgroundTransparency = UDim2.new(1,-12,0,48), 1

    local image = Instance.new("ImageLabel", entry)
    image.Size, image.Position, image.BackgroundTransparency = UDim2.new(0,48,0,48), UDim2.new(0,0,0,0),1

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
        if ok then image.Image = thumb end
    end)

    return entry
end

local function refreshPlayerList()
    for _,child in ipairs(playersList:GetChildren()) do if child:IsA("Frame") then child:Destroy() end end
    playerButtons = {}
    for _,pl in ipairs(Players:GetPlayers()) do
        if pl~=player then
            local entry = makePlayerEntry(pl)
            entry.Parent = playersList
            playersList.CanvasSize = UDim2.new(0,0,0,#playersList:GetChildren()*54)
            playerButtons[pl] = {frame=entry}
        end
    end
end

refreshPlayerList()
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(function(pl)
    refreshPlayerList()
    if selectedPlayer==pl then
        selectedPlayer, followEnabled, followTarget = nil,false,nil
        followBtn.Text="Follow Selected: OFF"
    end
end)

--================ UIハンドラ =================
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
    local selRoot = selectedPlayer.Character and (selectedPlayer.Character:FindFirstChild("HumanoidRootPart") or selectedPlayer.Character:FindFirstChildWhichIsA("BasePart"))
    local _,_,myRoot = getCharacter()
    if selRoot and myRoot then
        local backPos = selRoot.Position - selRoot.CFrame.LookVector*followDistance
        myRoot.CFrame = CFrame.new(backPos+Vector3.new(0,2,0), selRoot.Position)
    end
end)

followBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then return end
    followEnabled = not followEnabled
    followBtn.Text = "Follow Selected: "..(followEnabled and "ON" or "OFF")
    followTarget = followEnabled and selectedPlayer or nil
end)

airTPToggleBtn.MouseButton1Click:Connect(function()
    airTPVisible = not airTPVisible
    airTPToggleBtn.Text = "Show AirTP Button: "..(airTPVisible and "ON" or "OFF")
    airTPBtn.Visible = airTPVisible
end)

airTPBtn.MouseButton1Click:Connect(function()
    local _,hum,root = getCharacter()
    if not root or not hum then return end
    if not airTPActive then
        airTPOriginalCFrame=root.CFrame
        root.CFrame=root.CFrame+Vector3.new(0,airHeight,0)
        pcall(function() root.Anchored=true end)
        airTPAnchored, airTPActive = true,true
        airTPBtn.Text="Return from Air"
    else
        if airTPAnchored then pcall(function() root.Anchored=false end) end
        if airTPOriginalCFrame then root.CFrame=airTPOriginalCFrame end
        airTPActive=false
        airTPBtn.Text="Air TP"
    end
end)

wallClipBtn.MouseButton1Click:Connect(function()
    wallClipEnabled = not wallClipEnabled
    setWallClip(wallClipEnabled)
    wallClipBtn.Text = "WallClip: " .. (wallClipEnabled and "ON" or "OFF")
end)


--================ スライダー =================
local draggingSlider=false
local function setSliderFromX(x)
    local rel=math.clamp(x/sliderFrame.AbsoluteSize.X,0,1)
    sliderFill.Size=UDim2.new(rel,0,1,0)
    sliderDragger.Position=UDim2.new(rel-0.018,0,0,0)
    desiredSpeed=math.floor(speedMin+rel*(speedMax-speedMin)+0.5)
    speedLabel.Text="Speed: "..desiredSpeed
end

sliderDragger.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then draggingSlider=true end
end)
sliderDragger.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then draggingSlider=false end
end)
sliderFrame.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        setSliderFromX(input.Position.X-sliderFrame.AbsolutePosition.X)
        draggingSlider=true
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if draggingSlider and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
        setSliderFromX(input.Position.X-sliderFrame.AbsolutePosition.X)
    end
end)

--================ 無限ジャンプ =================
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _,hum=getCharacter()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

--================ WalkSpeed 強制 =================
spawn(function()
    while true do
        local _,hum=getCharacter()
        if speedEnabled and hum then pcall(function() hum.WalkSpeed=desiredSpeed end) end
        wait(speedInterval)
    end
end)

--================ Follow ループ =================
spawn(function()
    while true do
        if followEnabled and followTarget and followTarget.Character and followTarget.Character.Parent then
            local selRoot=followTarget.Character:FindFirstChild("HumanoidRootPart") or followTarget.Character:FindFirstChildWhichIsA("BasePart")
            local _,_,myRoot=getCharacter()
            if selRoot and myRoot then
                local newPos=selRoot.Position - selRoot.CFrame.LookVector*followDistance
                newPos=Vector3.new(newPos.X, selRoot.Position.Y+1.5, newPos.Z)
                myRoot.CFrame=CFrame.new(newPos, selRoot.Position)
            end
        end
        wait(followInterval)
    end
end)

--================ AirTP 安全維持 =================
spawn(function()
    while true do
        if airTPActive then
            local _,_,root=getCharacter()
            if root then pcall(function() root.Velocity=Vector3.new(0,0,0) root.RotVelocity=Vector3.new(0,0,0) end) end
        end
        wait(0.2)
    end
end)

spawn(function()
    while true do
        if wallClipEnabled then
            setWallClip(true)
        end
        wait(0.2)
    end
end)


print("UtilityHub v3 loaded.")
