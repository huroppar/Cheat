local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--================ 設定 =================
local speedDefault, speedMin, speedMax = 16, 0, 200
local speedEnabled, infiniteJumpEnabled, wallClipEnabled = false,false,false
local desiredSpeed = speedDefault
local followEnabled, followTarget = false,nil
local attackRange = 10
local showHitbox = false
local airTPActive, airTPAnchored, airTPOriginalCFrame = false,false,nil
local airTPVisible = true
local followDistance = 5
local followInterval = 0.1
local thumbnailSize = Enum.ThumbnailSize.Size48x48
local selectedEnemy = nil

--================ Helper =================
local function getCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
    return char,hum,root
end

local function setWallClip(enable)
    local char = player.Character
    if not char then return end
    for _,part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not not enable
        end
    end
end

--================ GUI =================
local Window = Library.CreateLib("Utility Hub v6", "Synapse")

--================ Player Tab =================
local PlayerTab = Window:NewTab("Player")
local MovementSection = PlayerTab:NewSection("Movement")

MovementSection:NewToggle("Speed", "Toggle Speed", function(val)
    speedEnabled = val
end)
MovementSection:NewSlider("Speed Amount", "Adjust Speed", speedMax, speedMin, function(val)
    desiredSpeed = val
end)
MovementSection:NewToggle("Infinite Jump", "Toggle Infinite Jump", function(val)
    infiniteJumpEnabled = val
end)
MovementSection:NewToggle("WallClip", "Toggle WallClip", function(val)
    wallClipEnabled = val
    setWallClip(val)
end)
MovementSection:NewToggle("Air TP Button Visible", "Toggle Air TP GUI", function(val)
    airTPVisible = val
    airTPBtn.Visible = val
end)
MovementSection:NewButton("Air TP", "Teleport Up", function()
    local _,hum,root = getCharacter()
    if not root or not hum then return end
    if not airTPActive then
        airTPOriginalCFrame = root.CFrame
        root.CFrame = root.CFrame + Vector3.new(0,2000,0)
        pcall(function() root.Anchored=true end)
        airTPAnchored, airTPActive = true,true
    else
        if airTPAnchored then pcall(function() root.Anchored=false end)
        if airTPOriginalCFrame then root.CFrame = airTPOriginalCFrame end
        airTPActive=false
    end
end)
MovementSection:NewColorPicker("Accent Color", Color3.fromRGB(0,170,255), function(color)
    Library:ChangeThemeColor(color)
end)

--================ Combat Tab =================
local CombatTab = Window:NewTab("Combat")
local EnemySection = CombatTab:NewSection("Enemies")

-- プレイヤー一覧（敵選択用）
local playerButtons = {}
local function makePlayerEntry(p)
    local frame = Instance.new("Frame")
    local img = Instance.new("ImageLabel", frame)
    local nameLabel = Instance.new("TextLabel", frame)
    local btn = Instance.new("TextButton", frame)

    spawn(function()
        local ok, thumb = pcall(function()
            return Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, thumbnailSize)
        end)
        if ok then img.Image = thumb end
    end)

    btn.MouseButton1Click:Connect(function()
        selectedEnemy = p
        for pl,info in pairs(playerButtons) do
            info.frame.BackgroundTransparency = (pl==selectedEnemy) and 0.6 or 1
        end
    end)
    return frame
end

local function refreshPlayerList()
    playerButtons = {}
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=player then
            local entry = makePlayerEntry(p)
            playerButtons[p] = {frame=entry}
        end
    end
end
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(function(pl)
    refreshPlayerList()
    if selectedEnemy==pl then selectedEnemy=nil end
end)
refreshPlayerList()

EnemySection:NewButton("TP Behind Selected", "Teleport behind enemy", function()
    if not selectedEnemy then return end
    local selRoot = selectedEnemy.Character and (selectedEnemy.Character:FindFirstChild("HumanoidRootPart") or selectedEnemy.Character:FindFirstChildWhichIsA("BasePart"))
    local _,_,myRoot = getCharacter()
    if selRoot and myRoot then
        local backPos = selRoot.Position - selRoot.CFrame.LookVector*followDistance
        myRoot.CFrame = CFrame.new(backPos+Vector3.new(0,2,0), selRoot.Position)
    end
end)
local followBtnVal = false
EnemySection:NewToggle("Follow Selected", "Follow enemy 0.1s", function(val)
    followBtnVal = val
    followTarget = val and selectedEnemy or nil
end)
EnemySection:NewSlider("Attack Range", "Enemy auto-follow range", 50,1,function(val)
    attackRange = val
end)
EnemySection:NewToggle("Show Hitbox", "Show enemy hitboxes", function(val)
    showHitbox = val
end)

--================ ESP Tab =================
local ESPTab = Window:NewTab("ESP")
local ESPSection = ESPTab:NewSection("ESP")
local showPlayerESP, showBotESP, showEnemyESP = false,false,false
ESPSection:NewToggle("Player ESP", "", function(val) showPlayerESP=val end)
ESPSection:NewToggle("Bot ESP", "", function(val) showBotESP=val end)
ESPSection:NewToggle("Enemy ESP", "", function(val) showEnemyESP=val end)

--================ 内部処理 =================
spawn(function() while true do
    local _,hum = getCharacter()
    if speedEnabled and hum then pcall(function() hum.WalkSpeed=desiredSpeed end) end
    wait(0.1)
end end)

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
                newPos = Vector3.new(newPos.X, selRoot.Position.Y+1.5, newPos.Z)
                myRoot.CFrame = CFrame.new(newPos, selRoot.Position)
            end
        end
        wait(followInterval)
    end
end)

RunService.RenderStepped:Connect(function()
    local _,_,root = getCharacter()
    if not root then return end
    for _,enemy in pairs(workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChildOfClass("Humanoid") then
            local eRoot = enemy:FindFirstChild("HumanoidRootPart")
            if eRoot then
                if (eRoot.Position-root.Position).Magnitude <= attackRange then
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
            local _,_,root = getCharacter()
            if root then pcall(function() root.Velocity=Vector3.new(0,0,0); root.RotVelocity=Vector3.new(0,0,0) end) end
        end
        wait(0.2)
    end
end)
