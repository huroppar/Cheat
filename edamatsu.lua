--================ Rayfield ライブラリ読み込み =================
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)
if not success or not Rayfield then
    warn("Rayfield ライブラリの読み込みに失敗しました")
    return
end

--================ 基本サービス =================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--================ 状態管理 =================
local speedEnabled, infiniteJumpEnabled, wallClipEnabled = false, false, false
local airTPActive, airTPAnchored, airTPOriginalCFrame = false,false,nil
local desiredSpeed = 16
local followEnabled, followTarget = false, nil
local selectedPlayer = nil
local showHitbox = false
local attackRange = 10
local guiVisible = true

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

--================ Rayfield Window =================
local Window = Rayfield:CreateWindow({
    Name = "Utility Hub v3",
    LoadingTitle = "Loading UtilityHub...",
    LoadingSubtitle = "by Masashi",
    ConfigurationSaving = {Enabled = true, FolderName = "UtilityHub", FileName = "Config"},
    Discord = false,
})

--================ GUI 再表示用アイコン =================
local icon = Instance.new("ImageButton")
icon.Size, icon.Position = UDim2.new(0,50,0,50), UDim2.new(0,10,0,10)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://6031094671" -- 魚アイコン
icon.Visible = false
icon.Parent = player:WaitForChild("PlayerGui")

icon.MouseButton1Click:Connect(function()
    Window:Toggle()
    guiVisible = true
    icon.Visible = false
end)

--================ タブ作成 =================
local playerTab = Window:CreateTab("プレイヤー")
local combatTab = Window:CreateTab("戦闘")
local espTab = Window:CreateTab("透視")

--================ プレイヤータブ =================
playerTab:CreateToggle({Name="Speed", CurrentValue=false, Flag="SpeedToggle", Callback=function(val) speedEnabled=val end})
playerTab:CreateSlider({Name="Speed Slider", Range={0,200}, Increment=1, Suffix="WalkSpeed", CurrentValue=16, Flag="SpeedSlider", Callback=function(val) desiredSpeed=val end})
playerTab:CreateToggle({Name="Infinite Jump", CurrentValue=false, Flag="JumpToggle", Callback=function(val) infiniteJumpEnabled=val end})
playerTab:CreateToggle({Name="WallClip", CurrentValue=false, Flag="WallClipToggle", Callback=function(val) wallClipEnabled=val setWallClip(val) end})
playerTab:CreateButton({Name="Air TP", Callback=function()
    local _,hum,root=getCharacter()
    if not root or not hum then return end
    if not airTPActive then
        airTPOriginalCFrame=root.CFrame
        root.CFrame=root.CFrame+Vector3.new(0,2000,0)
        pcall(function() root.Anchored=true end)
        airTPAnchored, airTPActive=true,true
    else
        if airTPAnchored then pcall(function() root.Anchored=false end) end
        if airTPOriginalCFrame then root.CFrame=airTPOriginalCFrame end
        airTPActive=false
    end
end})
playerTab:CreateColorPicker({Name="GUI Accent Color", Default=Color3.fromRGB(100,150,255), Flag="AccentColor", Callback=function(c) Rayfield:ChangeAccentColor(c) end})

--================ 戦闘タブ =================
combatTab:CreateSlider({Name="Attack Range", Range={1,50}, Increment=1, Suffix="Studs", CurrentValue=10, Flag="AttackRange", Callback=function(val) attackRange=val end})
combatTab:CreateToggle({Name="Show Hitbox", CurrentValue=false, Flag="HitboxToggle", Callback=function(val) showHitbox=val end})

local playerButtons = {}
local playerListFrame = Instance.new("ScrollingFrame")
playerListFrame.Size = UDim2.new(1,0,0,150)
playerListFrame.Position = UDim2.new(0,0,0,50)
playerListFrame.BackgroundTransparency = 1
playerListFrame.ScrollBarThickness = 6
playerListFrame.Parent = combatTab["TabObjects"].Page

local playersLayout = Instance.new("UIListLayout", playerListFrame)
playersLayout.Padding = UDim.new(0,4)

local function refreshPlayerList()
    for _, c in ipairs(playerListFrame:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
    playerButtons = {}
    for _, pl in ipairs(Players:GetPlayers()) do
        if pl ~= player then
            local entry = Instance.new("Frame")
            entry.Size = UDim2.new(1,-10,0,36)
            entry.BackgroundColor3 = Color3.fromRGB(50,50,50)
            entry.BackgroundTransparency = 0.5
            entry.Parent = playerListFrame

            local nameLabel = Instance.new("TextLabel", entry)
            nameLabel.Size = UDim2.new(0.6,0,1,0)
            nameLabel.Position = UDim2.new(0,4,0,0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = pl.Name
            nameLabel.TextColor3 = Color3.fromRGB(255,255,255)
            nameLabel.TextXAlignment = Enum.TextXAlignment.Left

            local selectBtn = Instance.new("TextButton", entry)
            selectBtn.Size = UDim2.new(0.35,0,0.8,0)
            selectBtn.Position = UDim2.new(0.63,0,0.1,0)
            selectBtn.Text = "選択"
            selectBtn.BackgroundColor3 = Color3.fromRGB(100,150,255)
            selectBtn.TextColor3 = Color3.fromRGB(255,255,255)
            selectBtn.Font = Enum.Font.SourceSans
            selectBtn.TextSize = 14
            selectBtn.MouseButton1Click:Connect(function()
                selectedPlayer = pl
                for _, btn in pairs(playerButtons) do
                    btn.Frame.BackgroundColor3 = (btn.Player==selectedPlayer) and Color3.fromRGB(70,70,70) or Color3.fromRGB(50,50,50)
                end
            end)

            table.insert(playerButtons,{Frame=entry,Player=pl})
        end
    end
    playerListFrame.CanvasSize=UDim2.new(0,0,0,#Players:GetPlayers()*40)
end

refreshPlayerList()
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

local tpBehindBtn=combatTab:CreateButton({Name="瞬間TP（後ろ5スタッド）", Callback=function()
    if not selectedPlayer or not selectedPlayer.Character then return end
    local selRoot = selectedPlayer.Character:FindFirstChild("HumanoidRootPart") or selectedPlayer.Character:FindFirstChildWhichIsA("BasePart")
    local _,_,myRoot=getCharacter()
    if selRoot and myRoot then
        local backPos = selRoot.Position - selRoot.CFrame.LookVector*5
        myRoot.CFrame = CFrame.new(backPos + Vector3.new(0,2,0), selRoot.Position)
    end
end})

local followBtn=combatTab:CreateButton({Name="追従（0.1秒更新）", Callback=function()
    if not selectedPlayer then return end
    followEnabled = not followEnabled
    followTarget = followEnabled and selectedPlayer or nil
end})

--================ 透視タブ =================
local playerESP, botESP, enemyESP = false,false,false
espTab:CreateToggle({Name="プレイヤー ESP", CurrentValue=false, Callback=function(val) playerESP=val end})
espTab:CreateToggle({Name="Bot ESP", CurrentValue=false, Callback=function(val) botESP=val end})
espTab:CreateToggle({Name="敵 ESP", CurrentValue=false, Callback=function(val) enemyESP=val end})

--================ 無限ジャンプ =================
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _,hum=getCharacter()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

--================ WalkSpeed =================
spawn(function()
    while true do
        local _,hum=getCharacter()
        if speedEnabled and hum then pcall(function() hum.WalkSpeed=desiredSpeed end) end
        wait(0.1)
    end
end)

--================ Follow Loop =================
spawn(function()
    while true do
        if followEnabled and followTarget and followTarget.Character and followTarget.Character.Parent then
            local selRoot = followTarget.Character:FindFirstChild("HumanoidRootPart") or followTarget.Character:FindFirstChildWhichIsA("BasePart")
            local _,_,myRoot=getCharacter()
            if selRoot and myRoot then
                local newPos = selRoot.Position - selRoot.CFrame.LookVector*5
                newPos = Vector3.new(newPos.X, selRoot.Position.Y+1.5, newPos.Z)
                myRoot.CFrame = CFrame.new(newPos, selRoot.Position)
            end
        end
        wait(0.1)
    end
end)

--================ Enemy Auto Follow + Attack Range + Hitbox =================
RunService.RenderStepped:Connect(function()
    local _,_,root=getCharacter()
    if not root then return end
    for _, enemy in pairs(workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChildOfClass("Humanoid") then
            local eRoot = enemy:FindFirstChild("HumanoidRootPart")
            if eRoot then
                local dist = (eRoot.Position-root.Position).Magnitude
                if dist <= attackRange then
                    root.CFrame=CFrame.new(eRoot.Position - eRoot.CFrame.LookVector*5, eRoot.Position)
                end
                for _, part in pairs(enemy:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = showHitbox and 0.5 or 1
                        part.Color = showHitbox and Color3.fromRGB(255,0,0) or part.Color
                    end
                end
            end
        end
    end
end)

--================ WallClip 永続 =================
spawn(function()
    while true do
        if wallClipEnabled then setWallClip(true) end
        wait(0.2)
    end
end)

--================ GUI トグル =================
Window:CreateButton({Name="閉じる", Callback=function()
    guiVisible=false
    Window:Toggle()
    icon.Visible=true
end})

print("UtilityHub v3 Rayfield 完全版 Loaded")
