--================ Kavo UI =================
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Utility Hub v6", "Ocean")

--================ 設定 =================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local speedEnabled, infiniteJumpEnabled, wallClipEnabled = false, false, false
local airTPActive, airTPAnchored, airTPOriginalCFrame = false, false, nil
local airTPVisible = true
local desiredSpeed = 16
local followEnabled, followTarget = false, nil
local attackRange = 10
local showHitbox = false
local selectedEnemy = nil

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

--================ プレイヤータブ =================
local playerTab = Window:NewTab("Player")
local playerSection = playerTab:NewSection("Movement")

playerSection:NewToggle("Speed", "Enable walk speed", function(val)
    speedEnabled = val
end)

playerSection:NewSlider("Speed Amount", "Set walk speed", 200, 16, function(val)
    desiredSpeed = val
end)

playerSection:NewToggle("Infinite Jump", "Toggle infinite jump", function(val)
    infiniteJumpEnabled = val
end)

playerSection:NewToggle("WallClip", "Toggle wall collision", function(val)
    wallClipEnabled = val
    setWallClip(val)
end)

local airTPBtn
playerSection:NewToggle("AirTP Button Visible", "Show/Hide AirTP Button", function(val)
    airTPVisible = val
    if airTPBtn then airTPBtn:Toggle(val) end
end)

playerSection:NewButton("Air TP", "Teleport up", function()
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

playerSection:NewColorPicker("Accent Color", "Change GUI color", Color3.fromRGB(0,170,255), function(color)
    Library:ChangeColor(color)
end)

--================ 戦闘タブ =================
local combatTab = Window:NewTab("Combat")
local combatSection = combatTab:NewSection("Enemy Actions")

combatSection:NewButton("TP Behind Selected", "Teleport behind selected enemy", function()
    if not selectedEnemy or not selectedEnemy.Character then return end
    local selRoot = selectedEnemy.Character:FindFirstChild("HumanoidRootPart") or selectedEnemy.Character:FindFirstChildWhichIsA("BasePart")
    local _,_,myRoot = getCharacter()
    if selRoot and myRoot then
        local backPos = selRoot.Position - selRoot.CFrame.LookVector*5
        myRoot.CFrame = CFrame.new(backPos + Vector3.new(0,2,0), selRoot.Position)
    end
end)

combatSection:NewToggle("Follow Selected", "Follow enemy", function(val)
    followEnabled = val
    followTarget = val and selectedEnemy or nil
end)

combatSection:NewSlider("Attack Range", "Range to auto-follow enemies", 50, 10, function(val)
    attackRange = val
end)

combatSection:NewToggle("Show Hitbox", "Display enemy hitboxes", function(val)
    showHitbox = val
end)

--================ ESPタブ =================
local espTab = Window:NewTab("ESP")
local espSection = espTab:NewSection("ESP Toggle")

local showPlayerESP, showBotESP, showEnemyESP = false, false, false
espSection:NewToggle("Player ESP", "Show players", function(val) showPlayerESP = val end)
espSection:NewToggle("Bot ESP", "Show bots", function(val) showBotESP = val end)
espSection:NewToggle("Enemy ESP", "Show enemies", function(val) showEnemyESP = val end)

--================ GUI再表示アイコン =================
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
        local _,hum = getCharacter()
        if speedEnabled and hum then
            pcall(function() hum.WalkSpeed = desiredSpeed end)
        end
        wait(0.1)
    end
end)

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _,hum = getCharacter()
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
        if followEnabled and followTarget and followTarget.Character and followTarget.Character.Parent then
            local selRoot = followTarget.Character:FindFirstChild("HumanoidRootPart") or followTarget.Character:FindFirstChildWhichIsA("BasePart")
            local _,_,myRoot = getCharacter()
            if selRoot and myRoot then
                local newPos = selRoot.Position - selRoot.CFrame.LookVector*5
                newPos = Vector3.new(newPos.X, selRoot.Position.Y+1.5, newPos.Z)
                myRoot.CFrame = CFrame.new(newPos, selRoot.Position)
            end
        end
        wait(0.1)
    end
end)

RunService.RenderStepped:Connect(function()
    local char, hum, root = getCharacter()
    if not root then return end
    for _, enemy in pairs(workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChildOfClass("Humanoid") then
            local eRoot = enemy:FindFirstChild("HumanoidRootPart")
            if eRoot then
                local dist = (eRoot.Position-root.Position).Magnitude
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
            local _,_,root = getCharacter()
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
