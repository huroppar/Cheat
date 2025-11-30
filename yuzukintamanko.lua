--================ Kavo-UI 読み込み =================
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Utility Hub v6", "Synapse")

--================ サービス =================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--================ 設定 =================
local speedDefault, speedMin, speedMax = 16, 0, 200
local speedInterval = 0.1
local followInterval, followDistance = 0.1, 5
local airHeight = 2000
local thumbnailSize = Enum.ThumbnailSize.Size48x48
local attackRange = 10
local showHitbox = false

--================ 状態 =================
local speedEnabled, infiniteJumpEnabled = false, false
local followEnabled, followTarget = false, nil
local airTPActive, airTPAnchored, airTPOriginalCFrame = false, false, nil
local wallClipEnabled = false
local desiredSpeed = speedDefault
local selectedPlayer, selectedEnemy = nil, nil
local airTPVisible = true

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

--================ タブ作成 =================
local playerTab = Window:NewTab("Player")
local combatTab = Window:NewTab("Combat")
local espTab = Window:NewTab("ESP")

--================ プレイヤータブ =================
playerTab:NewToggle("Speed", "Toggle WalkSpeed", function(val) speedEnabled = val end)
playerTab:NewSlider("Speed Amount", "Adjust WalkSpeed", speedMin, speedMax, speedDefault, function(val) desiredSpeed = val end)
playerTab:NewToggle("Infinite Jump", "Toggle Infinite Jump", function(val) infiniteJumpEnabled = val end)
playerTab:NewToggle("WallClip", "Toggle WallClip", function(val) wallClipEnabled = val; setWallClip(val) end)
playerTab:NewToggle("AirTP Button Visible", "Toggle AirTP Button", function(val) airTPVisible = val; airTPBtn.Visible = val end)
playerTab:NewButton("Air TP", "Teleport Up/Down", function()
    local _,hum,root = getCharacter()
    if not root or not hum then return end
    if not airTPActive then
        airTPOriginalCFrame = root.CFrame
        root.CFrame = root.CFrame + Vector3.new(0, airHeight, 0)
        pcall(function() root.Anchored = true end)
        airTPAnchored, airTPActive = true, true
    else
        if airTPAnchored then pcall(function() root.Anchored = false end) end
        if airTPOriginalCFrame then root.CFrame = airTPOriginalCFrame end
        airTPActive = false
    end
end)
playerTab:NewColorPicker("Accent Color", "Change GUI Color", Color3.fromRGB(0, 170, 255), function(color) Kavo:ChangeColor(color) end)

--================ 戦闘タブ =================
local playerButtons = {}
local playersFrame = Instance.new("Frame") -- ダミー

local function makePlayerEntry(p)
    local entry = Instance.new("Frame")
    entry.Size = UDim2.new(1, -12, 0, 48)
    entry.BackgroundTransparency = 1

    local image = Instance.new("ImageLabel", entry)
    image.Size, image.Position = UDim2.new(0,48,0,48), UDim2.new(0,0,0,0)
    image.BackgroundTransparency = 1
    spawn(function()
        local ok, thumb = pcall(function() return Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, thumbnailSize) end)
        if ok then image.Image = thumb end
    end)

    local nameLabel = Instance.new("TextLabel", entry)
    nameLabel.Size, nameLabel.Position = UDim2.new(1,-60,0,48), UDim2.new(0,60,0,0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Text = p.Name
    nameLabel.TextColor3 = Color3.new(1,1,1)
    nameLabel.Font = Enum.Font.SourceSans
    nameLabel.TextSize = 16

    local selectBtn = Instance.new("TextButton", entry)
    selectBtn.Size, selectBtn.Position = UDim2.new(0,48,0,24), UDim2.new(1,-50,0,12)
    selectBtn.Text, selectBtn.Font, selectBtn.TextSize = "Select", Enum.Font.SourceSans, 14
    selectBtn.MouseButton1Click:Connect(function()
        selectedEnemy = p
        for pl, btns in pairs(playerButtons) do
            btns.frame.BackgroundTransparency = (pl == selectedEnemy) and 0.6 or 1
        end
    end)
    return entry
end

local function refreshPlayerList()
    playerButtons = {}
    for _,pl in ipairs(Players:GetPlayers()) do
        if pl ~= player then
            local entry = makePlayerEntry(pl)
            entry.Parent = playersFrame
            playerButtons[pl] = {frame=entry}
        end
    end
end
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(function(pl) refreshPlayerList(); if selectedEnemy==pl then selectedEnemy=nil end end)
refreshPlayerList()

combatTab:NewButton("TP Behind Selected", "Teleport Behind Selected Enemy", function()
    if not selectedEnemy then return end
    local selRoot = selectedEnemy.Character and (selectedEnemy.Character:FindFirstChild("HumanoidRootPart") or selectedEnemy.Character:FindFirstChildWhichIsA("BasePart"))
    local _,_,myRoot = getCharacter()
    if selRoot and myRoot then
        local backPos = selRoot.Position - selRoot.CFrame.LookVector*followDistance
        myRoot.CFrame = CFrame.new(backPos+Vector3.new(0,2,0), selRoot.Position)
    end
end)

local followBtnVal = false
combatTab:NewToggle("Follow Selected", "Follow selected enemy", function(val)
    followBtnVal = val
    followTarget = val and selectedEnemy or nil
end)
combatTab:NewSlider("Attack Range", "Set attack range", 1, 50, attackRange, function(val) attackRange = val end)
combatTab:NewToggle("Show Hitbox", "Show enemy hitbox", function(val) showHitbox = val end)

--================ ESPタブ =================
local showPlayerESP, showBotESP, showEnemyESP = false, false, false
espTab:NewToggle("Player ESP", "Toggle Player ESP", function(val) showPlayerESP = val end)
espTab:NewToggle("Bot ESP", "Toggle Bot ESP", function(val) showBotESP = val end)
espTab:NewToggle("Enemy ESP", "Toggle Enemy ESP", function(val) showEnemyESP = val end)

--================ GUI再表示用魚アイコン =================
local icon = Instance.new("TextButton")
icon.Size = UDim2.new(0,50,0,50)
icon.Position = UDim2.new(0,10,0,10)
icon.Text = "🐟"
icon.BackgroundColor3 = Color3.fromRGB(0,170,255)
icon.Visible = false
icon.Parent = player:WaitForChild("PlayerGui")
icon.MouseButton1Click:Connect(function()
    Window:Toggle()
    icon.Visible = false
end)
Window.CloseCallback = function()
    icon.Visible = true
end

--================ 内部処理 =================
spawn(function()
    while true do
        local _,hum=getCharacter()
        if speedEnabled and hum then pcall(function() hum.WalkSpeed = desiredSpeed end) end
        wait(speedInterval)
    end
end)

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _,hum=getCharacter()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

spawn(function()
    while true do
        if wallClipEnabled then setWallClip(true) end
        wait(0.2)
    end
end)

spawn(function()
    while true do
        if followBtnVal and followTarget and followTarget.Character and followTarget.Character.Parent then
            local selRoot = followTarget.Character:FindFirstChild("HumanoidRootPart") or followTarget.Character:FindFirstChildWhichIsA("BasePart")
            local _,_,myRoot = getCharacter()
            if selRoot and myRoot then
                local newPos = selRoot.Position - selRoot.CFrame.LookVector*followDistance
                newPos = Vector3.new(newPos.X, selRoot.Position.Y + 1.5, newPos.Z)
                myRoot.CFrame = CFrame.new(newPos, selRoot.Position)
            end
        end
        wait(followInterval)
    end
end)

RunService.RenderStepped:Connect(function()
    local char, hum, root = getCharacter()
    if not root then return end
    for _, enemy in pairs(workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChildOfClass("Humanoid") then
            local eRoot = enemy:FindFirstChild("HumanoidRootPart")
            if eRoot then
                local dist = (eRoot.Position - root.Position).Magnitude
                if dist <= attackRange then
                    root.CFrame = CFrame.new(eRoot.Position - eRoot.CFrame.LookVector*5, eRoot.Position)
                end
                if showHitbox then
                    for _, part in pairs(enemy:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 0.5
                            part.Color = Color3.fromRGB(255,0,0)
                        end
                    end
                end
            end
        end
    end
end)

spawn(function()
    while true do
        if airTPActive then
            local _,_,root=getCharacter()
            if root then pcall(function() root.Velocity=Vector3.new(0,0,0); root.RotVelocity=Vector3.new(0,0,0) end) end
        end
        wait(0.2)
    end
end)
