-- RayFieldロード（Delta対応）
local RayField = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--================ 設定 =================
local speedDefaultOn, speedDefaultOff = 16, 16
local speedMin, speedMax = 0, 200
local infiniteJumpEnabled = false
local wallClipEnabled = false
local airTPActive = false
local airHeight = 2000
local airTPOriginalCFrame = nil

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
            part.CanCollide = not enable
        end
    end
end

--================ GUI =================
local Window = RayField:CreateWindow({
    Name = "Utility Hub v5",
    LoadingTitle = "Utility Hub",
    LoadingSubtitle = "by Masashi",
    ConfigurationSaving = {Enabled=true, FolderName="UtilityHubConfigs", FileName="Config"},
    Discord={Enabled=false},
    KeySystem=false,
    HidePremium=true
})

-- Deltaスマホ用ドラッグ対応
-- RayFieldは標準でドラッグ可能だが、タッチ対応チェック
local function enableTouchDrag(frame)
    frame.Active = true
    frame.Draggable = true
end
-- Window自体のフレーム取得してドラッグ可能化
pcall(function() enableTouchDrag(Window.MainFrame) end)

--================ プレイヤータブ =================
local playerTab = Window:CreateTab("Player", 4483362458)

local speedEnabled = false
local speedOn = speedDefaultOn
local speedOff = speedDefaultOff

playerTab:CreateToggle({Name="Speed", CurrentValue=false, Callback=function(val) speedEnabled=val end})
playerTab:CreateSlider({Name="Speed On", Range={speedMin,speedMax}, Increment=1, Suffix="WalkSpeed", CurrentValue=speedDefaultOn, Callback=function(val) speedOn=val end})
playerTab:CreateSlider({Name="Speed Off", Range={speedMin,speedMax}, Increment=1, Suffix="WalkSpeed", CurrentValue=speedDefaultOff, Callback=function(val) speedOff=val end})
playerTab:CreateToggle({Name="Infinite Jump", CurrentValue=false, Callback=function(val) infiniteJumpEnabled=val end})
playerTab:CreateToggle({Name="WallClip", CurrentValue=false, Callback=function(val) wallClipEnabled=val end})

local airTPBtn = playerTab:CreateButton({Name="Air TP", Callback=function()
    local _,hum,root = getCharacter()
    if not hum or not root then return end
    if not airTPActive then
        airTPOriginalCFrame = root.CFrame
        root.CFrame = root.CFrame + Vector3.new(0,airHeight,0)
        pcall(function() root.Anchored=true end)
        airTPActive = true
    else
        if airTPOriginalCFrame then root.CFrame = airTPOriginalCFrame end
        pcall(function() root.Anchored=false end)
        airTPActive = false
    end
end})

--================ 内部処理 =================
RunService.RenderStepped:Connect(function()
    local _, hum = getCharacter()
    if hum then
        hum.WalkSpeed = speedEnabled and speedOn or speedOff
    end
    setWallClip(wallClipEnabled)
end)

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local _, hum = getCharacter()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

--================ ESP & X-Ray / FullBright =================
-- （先ほど提示したX-Ray/FullBright定義・espTab作成部分をここに統合）
-- espTab作成後にドラッグ可能化も適用
local espTab = Window:CreateTab("ESP",4483362458)
pcall(function() enableTouchDrag(espTab.TabFrame) end)
-- 以下、X-Rayトグル・FullBrightトグル・Player/Enemy/ItemESPトグルを追加（先ほどのコードそのまま）
-- ...（略、先ほどのコードと同じ）...

--================ Combat Tab =================
local combatTab = Window:CreateTab("Combat",4483362458)
pcall(function() enableTouchDrag(combatTab.TabFrame) end)

local selectedTarget = nil
local followActive = false
local originalPos = nil

-- TP / Follow ボタンを固定
combatTab:CreateButton({
    Name="選択中のプレイヤーへ TP",
    Callback=function()
        if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = selectedTarget.Character.HumanoidRootPart
            player.Character:PivotTo(hrp.CFrame * CFrame.new(0,0,-3))
        else
            RayField:Notify({Title="エラー",Content="ターゲット無効！",Duration=3})
        end
    end
})

combatTab:CreateToggle({
    Name="張り付き（Follow）",
    CurrentValue=false,
    Callback=function(state)
        if not selectedTarget then
            RayField:Notify({Title="エラー",Content="先にプレイヤー選んで！",Duration=3})
            return
        end
        followActive=state
        local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if state then
            if myHRP then originalPos=myHRP.CFrame end
            RayField:Notify({Title="張り付き開始",Content=selectedTarget.Name.." の後ろへ追従中",Duration=3})
        else
            if originalPos and myHRP then player.Character:PivotTo(originalPos) end
            RayField:Notify({Title="解除",Content="元の位置に戻ったよ！",Duration=3})
        end
    end
})

-- プレイヤー一覧ボタン
combatTab:CreateLabel("プレイヤー一覧（HPリアルタイム表示）")
local playerButtons = {}
local function GetHP(plr)
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        local hum = plr.Character.Humanoid
        return math.floor(hum.Health), math.floor(hum.MaxHealth)
    end
    return 0,0
end
local function CreatePlayerButton(plr)
    local hp,maxhp = GetHP(plr)
    local btnName = plr.Name.." ["..hp.."/"..maxhp.."]"
    local btn = combatTab:CreateButton({Name=btnName, Callback=function()
        selectedTarget=plr
        RayField:Notify({Title="ターゲット選択",Content=plr.Name.." を選択したよ",Duration=3})
    end})
    playerButtons[plr]=btn
end
local function UpdatePlayerList()
    local currentPlayers={}
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=player then
            currentPlayers[p]=true
            if not playerButtons[p] then CreatePlayerButton(p) end
        end
    end
    for p,btn in pairs(playerButtons) do
        if not currentPlayers[p] then
            pcall(function() btn:Remove() end)
            playerButtons[p]=nil
        end
    end
end
UpdatePlayerList()
Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)

-- HP更新 + Follow
RunService.Heartbeat:Connect(function()
    for plr, btn in pairs(playerButtons) do
        if plr and plr.Character then
            local hp,maxhp=GetHP(plr)
            local text=(maxhp>0) and (plr.Name.." ["..hp.."/"..maxhp.."]") or (plr.Name.." [Dead]")
            pcall(function() btn:Set(text) end)
        end
    end
    if followActive and selectedTarget and selectedTarget.Character and player.Character then
        local targetHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
        local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
        if targetHRP and myHRP then
            myHRP.CFrame = targetHRP.CFrame * CFrame.new(0,0,3)
        end
    end
end)
