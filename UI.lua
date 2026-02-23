--====================================
-- XENO HUB - 完全版（プレイヤータブ統合）
--====================================

local players = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local lighting = game:GetService("Lighting")
local workspace = game:GetService("Workspace")
local player = players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--====================================
-- ユーティリティ関数
--====================================
local function getCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    return char, hum, hrp
end

local function getLevel(plr)
    local success, lvl = pcall(function()
        local ls = plr:FindFirstChild("leaderstats")
        if ls and ls:FindFirstChild("Level") then return ls.Level.Value end
        local data = plr:FindFirstChild("Data")
        if data and data:FindFirstChild("Level") then return data.Level.Value end
        for _, c in ipairs(plr:GetDescendants()) do
            if c.Name == "Level" and c:IsA("NumberValue") then return c.Value end
        end
        return 0
    end)
    return success and lvl or 0
end

local function getBounty(plr)
    local success, bounty = pcall(function()
        local locs = {
            plr:FindFirstChild("leaderstats"),
            plr:FindFirstChild("Data"),
            plr:FindFirstChild("stats"),
            plr:FindFirstChild("PlayerData"),
            plr:FindFirstChild("SaveData"),
            plr
        }
        local names = {"Bounty","bounty","BOUNTY","Beli","beli","BELI","Money","money","Cash","cash"}
        for _, loc in ipairs(locs) do
            if loc then
                for _, c in ipairs(loc:GetDescendants()) do
                    if c:IsA("NumberValue") or c:IsA("IntValue") or c:IsA("DoubleValue") then
                        for _, n in ipairs(names) do
                            if c.Name == n or c.Name:find(n) then return c.Value end
                        end
                    end
                end
            end
        end
        return 0
    end)
    return success and bounty or 0
end

local function formatBounty(v)
    if v >= 1e6 then return string.format("$%.1fM", v/1e6)
    elseif v >= 1e3 then return string.format("$%.1fK", v/1e3)
    else return "$"..tostring(v) end
end

--====================================
-- 機能状態管理
--====================================
local Features = {
    speedEnabled = false,
    speedValue = 30,
    originalWalkSpeed = nil,
    jumpEnabled = false,
    jumpPowerValue = 50,
    originalJumpPower = nil,
    infiniteJumpEnabled = false,
    noclipEnabled = false,
    noclipConn = nil,
    originalCanCollideCache = {},
    airTPActive = false,
    airHeight = 2000,
    airOriginCFrame = nil,
    airBodyVelocity = nil,
    freezeEnabled = false,
    freezeConnection = nil,
    freezeCFrame = nil,
    createdPlatforms = {},
    savedPosition = nil,
    flyEnabled = false,
    flySpeed = 50,
    flyMovement = {W=false, A=false, S=false, D=false, Space=false, LeftShift=false},
    fullBrightEnabled = false,
    fullBrightConn = nil,
}

--====================================
-- 既存UI削除
--====================================
local existingUI = playerGui:FindFirstChild("XenoCustomUI")
if existingUI then existingUI:Destroy() end
local existingIcon = playerGui:FindFirstChild("XenoFloatingIcon")
if existingIcon then existingIcon:Destroy() end

--====================================
-- フローティングアイコン
--====================================
local iconGui = Instance.new("ScreenGui")
iconGui.Name = "XenoFloatingIcon"
iconGui.ResetOnSpawn = false
iconGui.IgnoreGuiInset = true
iconGui.Parent = playerGui

local iconFrame = Instance.new("Frame")
iconFrame.Name = "IconFrame"
iconFrame.Size = UDim2.new(0, 50, 0, 50)
iconFrame.Position = UDim2.new(0, 20, 0.5, -25)
iconFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
iconFrame.BackgroundTransparency = 0.1
iconFrame.Active = true
iconFrame.Draggable = true
iconFrame.Parent = iconGui

local iconImage = Instance.new("ImageLabel")
iconImage.Name = "IconImage"
iconImage.Size = UDim2.new(1, -10, 1, -10)
iconImage.Position = UDim2.new(0, 5, 0, 5)
iconImage.BackgroundTransparency = 1
iconImage.Image = "rbxassetid://14416705268"
iconImage.ScaleType = Enum.ScaleType.Fit
iconImage.Parent = iconFrame

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 25)
iconCorner.Parent = iconFrame

local iconStroke = Instance.new("UIStroke")
iconStroke.Thickness = 2
iconStroke.Color = Color3.fromRGB(100, 150, 255)
iconStroke.Parent = iconFrame

--====================================
-- メインUI
--====================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "XenoCustomUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui
screenGui.IgnoreGuiInset = true

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 900, 0, 600)
mainFrame.Position = UDim2.new(0.5, -450, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
mainFrame.BackgroundTransparency = 0.05
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local bgImage = Instance.new("ImageLabel")
bgImage.Name = "Background"
bgImage.Size = UDim2.new(1, 0, 1, 0)
bgImage.BackgroundTransparency = 1
bgImage.Image = "rbxassetid://17856187773"
bgImage.ScaleType = Enum.ScaleType.Crop
bgImage.Parent = mainFrame

local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 40, 1, 40)
shadow.Position = UDim2.new(0, -20, 0, -20)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = mainFrame
shadow.ZIndex = -1

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

--====================================
-- 左パネル（プレイヤー情報）
--====================================
local leftPanel = Instance.new("Frame")
leftPanel.Name = "LeftPanel"
leftPanel.Size = UDim2.new(0, 220, 1, 0)
leftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
leftPanel.BackgroundTransparency = 0.1
leftPanel.BorderSizePixel = 0
leftPanel.Parent = mainFrame

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, 12)
leftCorner.Parent = leftPanel

-- アバター
local avatarFrame = Instance.new("Frame")
avatarFrame.Name = "AvatarFrame"
avatarFrame.Size = UDim2.new(0, 180, 0, 180)
avatarFrame.Position = UDim2.new(0.5, -90, 0, 20)
avatarFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
avatarFrame.BackgroundTransparency = 0.2
avatarFrame.BorderSizePixel = 0
avatarFrame.Parent = leftPanel

local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(0, 90)
avatarCorner.Parent = avatarFrame

local avatarImage = Instance.new("ImageLabel")
avatarImage.Name = "AvatarImage"
avatarImage.Size = UDim2.new(1, -10, 1, -10)
avatarImage.Position = UDim2.new(0, 5, 0, 5)
avatarImage.BackgroundTransparency = 1
avatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=420&height=420&format=png"
avatarImage.ScaleType = Enum.ScaleType.Fit
avatarImage.Parent = avatarFrame

local playerName = Instance.new("TextLabel")
playerName.Name = "PlayerName"
playerName.Size = UDim2.new(1, -20, 0, 30)
playerName.Position = UDim2.new(0, 10, 0, 210)
playerName.BackgroundTransparency = 1
playerName.Text = player.Name
playerName.TextColor3 = Color3.fromRGB(255, 255, 255)
playerName.TextXAlignment = Enum.TextXAlignment.Center
playerName.Font = Enum.Font.GothamBlack
playerName.TextSize = 22
playerName.Parent = leftPanel

local displayName = Instance.new("TextLabel")
displayName.Name = "DisplayName"
displayName.Size = UDim2.new(1, -20, 0, 20)
displayName.Position = UDim2.new(0, 10, 0, 240)
displayName.BackgroundTransparency = 1
displayName.Text = "@" .. player.DisplayName
displayName.TextColor3 = Color3.fromRGB(180, 180, 180)
displayName.TextXAlignment = Enum.TextXAlignment.Center
displayName.Font = Enum.Font.Gotham
displayName.TextSize = 14
displayName.Parent = leftPanel

-- レベル
local levelFrame = Instance.new("Frame")
levelFrame.Name = "LevelFrame"
levelFrame.Size = UDim2.new(1, -20, 0, 45)
levelFrame.Position = UDim2.new(0, 10, 0, 280)
levelFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
levelFrame.BackgroundTransparency = 0.2
levelFrame.BorderSizePixel = 0
levelFrame.Parent = leftPanel

local levelCorner = Instance.new("UICorner")
levelCorner.CornerRadius = UDim.new(0, 8)
levelCorner.Parent = levelFrame

local levelIcon = Instance.new("ImageLabel")
levelIcon.Name = "LevelIcon"
levelIcon.Size = UDim2.new(0, 28, 0, 28)
levelIcon.Position = UDim2.new(0, 8, 0.5, -14)
levelIcon.BackgroundTransparency = 1
levelIcon.Image = "rbxassetid://6023426923"
levelIcon.Parent = levelFrame

local levelText = Instance.new("TextLabel")
levelText.Name = "LevelText"
levelText.Size = UDim2.new(0, 150, 1, 0)
levelText.Position = UDim2.new(0, 45, 0, 0)
levelText.BackgroundTransparency = 1
levelText.Text = "レベル: " .. getLevel(player)
levelText.TextColor3 = Color3.fromRGB(255, 255, 255)
levelText.TextXAlignment = Enum.TextXAlignment.Left
levelText.TextYAlignment = Enum.TextYAlignment.Center
levelText.Font = Enum.Font.GothamBold
levelText.TextSize = 16
levelText.Parent = levelFrame

-- 賞金
local bountyFrame = Instance.new("Frame")
bountyFrame.Name = "BountyFrame"
bountyFrame.Size = UDim2.new(1, -20, 0, 45)
bountyFrame.Position = UDim2.new(0, 10, 0, 335)
bountyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
bountyFrame.BackgroundTransparency = 0.2
bountyFrame.BorderSizePixel = 0
bountyFrame.Parent = leftPanel

local bountyCorner = Instance.new("UICorner")
bountyCorner.CornerRadius = UDim.new(0, 8)
bountyCorner.Parent = bountyFrame

local bountyIcon = Instance.new("ImageLabel")
bountyIcon.Name = "BountyIcon"
bountyIcon.Size = UDim2.new(0, 28, 0, 28)
bountyIcon.Position = UDim2.new(0, 8, 0.5, -14)
bountyIcon.BackgroundTransparency = 1
bountyIcon.Image = "rbxassetid://6023426923"
bountyIcon.Parent = bountyFrame

local bountyText = Instance.new("TextLabel")
bountyText.Name = "BountyText"
bountyText.Size = UDim2.new(0, 150, 1, 0)
bountyText.Position = UDim2.new(0, 45, 0, 0)
bountyText.BackgroundTransparency = 1
bountyText.Text = "賞金: " .. formatBounty(getBounty(player))
bountyText.TextColor3 = Color3.fromRGB(255, 215, 0)
bountyText.TextXAlignment = Enum.TextXAlignment.Left
bountyText.TextYAlignment = Enum.TextYAlignment.Center
bountyText.Font = Enum.Font.GothamBold
bountyText.TextSize = 16
bountyText.Parent = bountyFrame

-- サーバー情報
local serverFrame = Instance.new("Frame")
serverFrame.Name = "ServerFrame"
serverFrame.Size = UDim2.new(1, -20, 0, 80)
serverFrame.Position = UDim2.new(0, 10, 1, -90)
serverFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
serverFrame.BackgroundTransparency = 0.2
serverFrame.BorderSizePixel = 0
serverFrame.Parent = leftPanel

local serverCorner = Instance.new("UICorner")
serverCorner.CornerRadius = UDim.new(0, 8)
serverCorner.Parent = serverFrame

local serverTitle = Instance.new("TextLabel")
serverTitle.Name = "ServerTitle"
serverTitle.Size = UDim2.new(1, -10, 0, 20)
serverTitle.Position = UDim2.new(0, 5, 0, 5)
serverTitle.BackgroundTransparency = 1
serverTitle.Text = "サーバー情報"
serverTitle.TextColor3 = Color3.fromRGB(200, 200, 255)
serverTitle.TextXAlignment = Enum.TextXAlignment.Left
serverTitle.Font = Enum.Font.GothamBold
serverTitle.TextSize = 14
serverTitle.Parent = serverFrame

local serverInfo = Instance.new("TextLabel")
serverInfo.Name = "ServerInfo"
serverInfo.Size = UDim2.new(1, -10, 0, 20)
serverInfo.Position = UDim2.new(0, 5, 0, 25)
serverInfo.BackgroundTransparency = 1
serverInfo.Text = ""
serverInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
serverInfo.TextXAlignment = Enum.TextXAlignment.Left
serverInfo.Font = Enum.Font.Gotham
serverInfo.TextSize = 14
serverInfo.Parent = serverFrame

local barBg = Instance.new("Frame")
barBg.Name = "BarBg"
barBg.Size = UDim2.new(1, -10, 0, 6)
barBg.Position = UDim2.new(0, 5, 0, 50)
barBg.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
barBg.BorderSizePixel = 0
barBg.Parent = serverFrame

local barBgCorner = Instance.new("UICorner")
barBgCorner.CornerRadius = UDim.new(0, 3)
barBgCorner.Parent = barBg

local barFill = Instance.new("Frame")
barFill.Name = "BarFill"
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

local barFillCorner = Instance.new("UICorner")
barFillCorner.CornerRadius = UDim.new(0, 3)
barFillCorner.Parent = barFill

--====================================
-- 右側メインエリア
--====================================
local rightArea = Instance.new("Frame")
rightArea.Name = "RightArea"
rightArea.Size = UDim2.new(1, -220, 1, 0)
rightArea.Position = UDim2.new(0, 220, 0, 0)
rightArea.BackgroundTransparency = 1
rightArea.Parent = mainFrame

-- ヘッダー
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, -20, 0, 50)
header.Position = UDim2.new(0, 10, 0, 10)
header.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
header.BackgroundTransparency = 0.15
header.BorderSizePixel = 0
header.Parent = rightArea

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 10)
headerCorner.Parent = header

local logo = Instance.new("TextLabel")
logo.Name = "Logo"
logo.Size = UDim2.new(0, 200, 1, 0)
logo.Position = UDim2.new(0, 15, 0, 0)
logo.BackgroundTransparency = 1
logo.Text = "XENO HUB"
logo.TextColor3 = Color3.fromRGB(255, 255, 255)
logo.TextXAlignment = Enum.TextXAlignment.Left
logo.TextYAlignment = Enum.TextYAlignment.Center
logo.Font = Enum.Font.GothamBlack
logo.TextSize = 22
logo.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -42, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
closeBtn.Text = "✖"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamBold
closeBtn.AutoButtonColor = false
closeBtn.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

local minBtn = Instance.new("TextButton")
minBtn.Name = "MinimizeButton"
minBtn.Size = UDim2.new(0, 32, 0, 32)
minBtn.Position = UDim2.new(1, -84, 0.5, -16)
minBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 50)
minBtn.Text = "−"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 24
minBtn.Font = Enum.Font.GothamBold
minBtn.AutoButtonColor = false
minBtn.Parent = header

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 6)
minCorner.Parent = minBtn

--====================================
-- タブメニュー（5タブ）
--====================================
local tabFrame = Instance.new("Frame")
tabFrame.Name = "TabFrame"
tabFrame.Size = UDim2.new(1, -20, 0, 60)
tabFrame.Position = UDim2.new(0, 10, 0, 70)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = rightArea

local function createTab(name, iconAssetId, pos)
    local tab = Instance.new("TextButton")
    tab.Name = name.."Tab"
    tab.Size = UDim2.new(0, 50, 0, 50)
    tab.Position = UDim2.new(0, pos, 0, 5)
    tab.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    tab.BackgroundTransparency = 0.2
    tab.Text = ""
    tab.AutoButtonColor = false
    tab.Parent = tabFrame
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 10)
    tabCorner.Parent = tab
    
    local tabIcon = Instance.new("ImageLabel")
    tabIcon.Name = "Icon"
    tabIcon.Size = UDim2.new(0, 30, 0, 30)
    tabIcon.Position = UDim2.new(0.5, -15, 0.5, -15)
    tabIcon.BackgroundTransparency = 1
    tabIcon.Image = "rbxassetid://" .. iconAssetId
    tabIcon.ScaleType = Enum.ScaleType.Fit
    tabIcon.Parent = tab
    
    local activeBar = Instance.new("Frame")
    activeBar.Name = "ActiveBar"
    activeBar.Size = UDim2.new(0.8, 0, 0, 3)
    activeBar.Position = UDim2.new(0.1, 0, 1, -3)
    activeBar.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    activeBar.BackgroundTransparency = 1
    activeBar.BorderSizePixel = 0
    activeBar.Parent = tab
    
    return tab, activeBar
end

local playerTab, playerActive = createTab("プレイヤー", "93859671981602", 10)
local espTab, espActive = createTab("ESP", "132518718337307", 70)
local combatTab, combatActive = createTab("戦闘", "132853579915999", 130)
local bloxfruitTab, bloxfruitActive = createTab("BloxFruit", "71663476018424", 190)
local serverTab, serverActive = createTab("サーバー", "76539322644518", 250)

--====================================
-- コンテンツエリア（左右分割）
--====================================
local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -20, 1, -140)
contentArea.Position = UDim2.new(0, 10, 0, 140)
contentArea.BackgroundTransparency = 1
contentArea.Parent = rightArea

-- 左：ボタンパネル
local buttonPanel = Instance.new("ScrollingFrame")
buttonPanel.Name = "ButtonPanel"
buttonPanel.Size = UDim2.new(0, 200, 1, 0)
buttonPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
buttonPanel.BackgroundTransparency = 0.2
buttonPanel.BorderSizePixel = 0
buttonPanel.CanvasSize = UDim2.new(0, 0, 0, 0)
buttonPanel.ScrollBarThickness = 4
buttonPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y
buttonPanel.Parent = contentArea

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = buttonPanel

local buttonPadding = Instance.new("UIPadding")
buttonPadding.PaddingTop = UDim.new(0, 10)
buttonPadding.PaddingBottom = UDim.new(0, 10)
buttonPadding.PaddingLeft = UDim.new(0, 10)
buttonPadding.PaddingRight = UDim.new(0, 10)
buttonPadding.Parent = buttonPanel

local buttonList = Instance.new("UIListLayout")
buttonList.Padding = UDim.new(0, 8)
buttonList.HorizontalAlignment = Enum.HorizontalAlignment.Center
buttonList.SortOrder = Enum.SortOrder.LayoutOrder
buttonList.Parent = buttonPanel

-- 右：設定パネル（トグル・スライダー）
local settingsPanel = Instance.new("ScrollingFrame")
settingsPanel.Name = "SettingsPanel"
settingsPanel.Size = UDim2.new(1, -210, 1, 0)
settingsPanel.Position = UDim2.new(0, 210, 0, 0)
settingsPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
settingsPanel.BackgroundTransparency = 0.2
settingsPanel.BorderSizePixel = 0
settingsPanel.CanvasSize = UDim2.new(0, 0, 0, 0)
settingsPanel.ScrollBarThickness = 4
settingsPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y
settingsPanel.Parent = contentArea

local settingsCorner = Instance.new("UICorner")
settingsCorner.CornerRadius = UDim.new(0, 8)
settingsCorner.Parent = settingsPanel

local settingsPadding = Instance.new("UIPadding")
settingsPadding.PaddingTop = UDim.new(0, 10)
settingsPadding.PaddingBottom = UDim.new(0, 10)
settingsPadding.PaddingLeft = UDim.new(0, 10)
settingsPadding.PaddingRight = UDim.new(0, 10)
settingsPadding.Parent = settingsPanel

local settingsList = Instance.new("UIListLayout")
settingsList.Padding = UDim.new(0, 8)
settingsList.HorizontalAlignment = Enum.HorizontalAlignment.Center
settingsList.SortOrder = Enum.SortOrder.LayoutOrder
settingsList.Parent = settingsPanel

--====================================
-- UI要素作成関数
--====================================
local function createButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Name = text.."Button"
    btn.Size = UDim2.new(1, -10, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.AutoButtonColor = false
    btn.Parent = buttonPanel
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

local function createToggle(text, default, callback)
    local frame = Instance.new("Frame")
    frame.Name = text.."Toggle"
    frame.Size = UDim2.new(1, -10, 0, 45)
    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 52)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Parent = settingsPanel
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.6, -10, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Name = "Button"
    btn.Size = UDim2.new(0, 50, 0, 28)
    btn.Position = UDim2.new(1, -60, 0.5, -14)
    btn.BackgroundColor3 = default and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(100, 100, 100)
    btn.Text = default and "ON" or "OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = frame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 14)
    btnCorner.Parent = btn
    
    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(100, 100, 100)
        btn.Text = state and "ON" or "OFF"
        callback(state)
    end)
    
    return frame
end

local function createSlider(text, min, max, default, callback)
    local frame = Instance.new("Frame")
    frame.Name = text.."Slider"
    frame.Size = UDim2.new(1, -10, 0, 70)
    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 52)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Parent = settingsPanel
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.6, -10, 0, 22)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.Parent = frame
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "Value"
    valueLabel.Size = UDim2.new(0.3, 0, 0, 22)
    valueLabel.Position = UDim2.new(0.7, 0, 0, 5)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(default)
    valueLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.TextYAlignment = Enum.TextYAlignment.Center
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.TextSize = 14
    valueLabel.Parent = frame
    
    local slider = Instance.new("Frame")
    slider.Name = "Slider"
    slider.Size = UDim2.new(0.9, 0, 0, 4)
    slider.Position = UDim2.new(0.05, 0, 0, 40)
    slider.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
    slider.BorderSizePixel = 0
    slider.Parent = frame
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 2)
    sliderCorner.Parent = slider
    
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    fill.BorderSizePixel = 0
    fill.Parent = slider
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 2)
    fillCorner.Parent = fill
    
    local dragButton = Instance.new("ImageButton")
    dragButton.Name = "DragButton"
    dragButton.Size = UDim2.new(0, 18, 0, 18)
    dragButton.Position = UDim2.new((default - min) / (max - min), -9, 0, -7)
    dragButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dragButton.BackgroundTransparency = 0
    dragButton.Image = "rbxassetid://14416705268"
    dragButton.AutoButtonColor = false
    dragButton.ZIndex = 2
    dragButton.Parent = slider
    
    local dragCorner = Instance.new("UICorner")
    dragCorner.CornerRadius = UDim.new(0, 9)
    dragCorner.Parent = dragButton
    
    local dragging = false
    local conn
    
    dragButton.MouseButton1Down:Connect(function()
        dragging = true
        conn = runService.RenderStepped:Connect(function()
            if not dragging then
                conn:Disconnect()
                return
            end
            local mouse = userInputService:GetMouseLocation()
            local absPos = slider.AbsolutePosition
            local absSize = slider.AbsoluteSize
            local relX = math.clamp(mouse.X - absPos.X, 0, absSize.X)
            local percent = relX / absSize.X
            local val = min + (max - min) * percent
            fill.Size = UDim2.new(percent, 0, 1, 0)
            dragButton.Position = UDim2.new(percent, -9, 0, -7)
            valueLabel.Text = tostring(math.floor(val * 10) / 10)
            callback(val)
        end)
    end)
    
    userInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            if conn then
                conn:Disconnect()
                conn = nil
            end
        end
    end)
    
    return frame
end

--====================================
-- 各タブの要素を格納
--====================================
local tabContents = {
    player = { buttons = {}, settings = {} },
    esp = { buttons = {}, settings = {} },
    combat = { buttons = {}, settings = {} },
    bloxfruit = { buttons = {}, settings = {} },
    server = { buttons = {}, settings = {} },
}

--====================================
-- プレイヤータブ（Furo Hubの全機能を集約）
--====================================

-- 【左側：ボタン】
-- 空中TP
tabContents.player.buttons[#tabContents.player.buttons+1] = createButton("空中TP (2000m)", function()
    local _, _, hrp = getCharacter()
    if hrp then
        if not Features.airTPActive then
            Features.airOriginCFrame = hrp.CFrame
            hrp.CFrame = hrp.CFrame + Vector3.new(0, Features.airHeight, 0)
            Features.airBodyVelocity = Instance.new("BodyVelocity")
            Features.airBodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
            Features.airBodyVelocity.Velocity = Vector3.new()
            Features.airBodyVelocity.Parent = hrp
            Features.airTPActive = true
        else
            if Features.airBodyVelocity then
                Features.airBodyVelocity:Destroy()
                Features.airBodyVelocity = nil
            end
            if Features.airOriginCFrame then
                hrp.CFrame = Features.airOriginCFrame
            end
            Features.airTPActive = false
        end
    end
end)

-- 足場生成
tabContents.player.buttons[#tabContents.player.buttons+1] = createButton("足場生成", function()
    local _, _, root = getCharacter()
    if root then
        local p = Instance.new("Part")
        p.Size = Vector3.new(6, 1, 6)
        p.Anchored = true
        p.CanCollide = true
        p.Color = Color3.fromRGB(255, 200, 0)
        p.Material = Enum.Material.Neon
        p.CFrame = root.CFrame * CFrame.new(0, -3.1, 0)
        p.Parent = workspace
        table.insert(Features.createdPlatforms, p)
    end
end)

-- 足場全削除
tabContents.player.buttons[#tabContents.player.buttons+1] = createButton("足場全削除", function()
    for _, p in ipairs(Features.createdPlatforms) do
        p:Destroy()
    end
    table.clear(Features.createdPlatforms)
end)

-- 現在位置保存
tabContents.player.buttons[#tabContents.player.buttons+1] = createButton("現在位置保存", function()
    local _, _, hrp = getCharacter()
    if hrp then
        Features.savedPosition = hrp.CFrame
        print("📍 位置を保存しました") -- Rayfield通知の代わり
    end
end)

-- 保存位置へ
tabContents.player.buttons[#tabContents.player.buttons+1] = createButton("保存位置へ", function()
    if Features.savedPosition then
        local _, _, hrp = getCharacter()
        if hrp then
            hrp.CFrame = Features.savedPosition
        end
    else
        print("⚠️ 位置が保存されていません")
    end
end)

-- 【右側：トグル・スライダー】

-- スピード
tabContents.player.settings[#tabContents.player.settings+1] = createToggle("スピード", false, function(state)
    Features.speedEnabled = state
    local _, hum = getCharacter()
    if hum then
        if state then
            Features.originalWalkSpeed = hum.WalkSpeed
            hum.WalkSpeed = Features.speedValue
        else
            hum.WalkSpeed = Features.originalWalkSpeed or 16
        end
    end
end)

tabContents.player.settings[#tabContents.player.settings+1] = createSlider("速度値", 16, 500, 30, function(v)
    Features.speedValue = v
    if Features.speedEnabled then
        local _, hum = getCharacter()
        if hum then hum.WalkSpeed = v end
    end
end)

-- ジャンプ力
tabContents.player.settings[#tabContents.player.settings+1] = createToggle("ジャンプ力変更", false, function(state)
    Features.jumpEnabled = state
    local _, hum = getCharacter()
    if hum then
        if state then
            Features.originalJumpPower = hum.JumpPower
            hum.JumpPower = Features.jumpPowerValue
        else
            hum.JumpPower = Features.originalJumpPower or 50
        end
    end
end)

tabContents.player.settings[#tabContents.player.settings+1] = createSlider("ジャンプ力", 50, 700, 50, function(v)
    Features.jumpPowerValue = v
    if Features.jumpEnabled then
        local _, hum = getCharacter()
        if hum then hum.JumpPower = v end
    end
end)

-- 無限ジャンプ
tabContents.player.settings[#tabContents.player.settings+1] = createToggle("無限ジャンプ", false, function(state)
    Features.infiniteJumpEnabled = state
end)

-- フライ
tabContents.player.settings[#tabContents.player.settings+1] = createToggle("フライ (Fly)", false, function(state)
    Features.flyEnabled = state
end)

tabContents.player.settings[#tabContents.player.settings+1] = createSlider("飛行速度", 10, 2000, 50, function(v)
    Features.flySpeed = v
end)

-- 壁抜け
tabContents.player.settings[#tabContents.player.settings+1] = createToggle("壁抜け (Noclip)", false, function(state)
    Features.noclipEnabled = state
    if state then
        local char = player.Character
        if char then
            Features.originalCanCollideCache = {}
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") then
                    Features.originalCanCollideCache[p] = p.CanCollide
                end
            end
            Features.noclipConn = runService.Stepped:Connect(function()
                local c = player.Character
                if c then
                    for _, p in ipairs(c:GetDescendants()) do
                        if p:IsA("BasePart") then p.CanCollide = false end
                    end
                end
            end)
        end
    else
        if Features.noclipConn then
            Features.noclipConn:Disconnect()
            Features.noclipConn = nil
        end
        local char = player.Character
        if char then
            for part, can in pairs(Features.originalCanCollideCache) do
                if part and part.Parent then part.CanCollide = can end
            end
        end
        table.clear(Features.originalCanCollideCache)
    end
end)

-- 位置固定
tabContents.player.settings[#tabContents.player.settings+1] = createToggle("位置固定 (Freeze)", false, function(state)
    Features.freezeEnabled = state
    local _, _, hrp = getCharacter()
    if hrp then
        if state then
            Features.freezeCFrame = hrp.CFrame
            Features.freezeConnection = runService.RenderStepped:Connect(function()
                if hrp then hrp.CFrame = Features.freezeCFrame end
            end)
        else
            if Features.freezeConnection then
                Features.freezeConnection:Disconnect()
                Features.freezeConnection = nil
            end
        end
    end
end)

--====================================
-- キー入力処理
--====================================
userInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        local k = input.KeyCode.Name
        if Features.flyMovement[k] ~= nil then
            Features.flyMovement[k] = true
        end
    end
end)

userInputService.InputEnded:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        local k = input.KeyCode.Name
        if Features.flyMovement[k] ~= nil then
            Features.flyMovement[k] = false
        end
    end
end)

userInputService.JumpRequest:Connect(function()
    if Features.infiniteJumpEnabled then
        local _, hum = getCharacter()
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

--====================================
-- 常時反映ループ
--====================================
runService.RenderStepped:Connect(function(dt)
    -- スピード
    if Features.speedEnabled then
        local _, hum = getCharacter()
        if hum then hum.WalkSpeed = Features.speedValue end
    end
    -- ジャンプ力
    if Features.jumpEnabled then
        local _, hum = getCharacter()
        if hum then hum.JumpPower = Features.jumpPowerValue end
    end
    -- フライ
    if Features.flyEnabled then
        local _, hum, root = getCharacter()
        if root and hum then
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
            local cam = workspace.CurrentCamera
            local dir = Vector3.zero
            if Features.flyMovement.W then dir = dir + cam.CFrame.LookVector end
            if Features.flyMovement.S then dir = dir - cam.CFrame.LookVector end
            if Features.flyMovement.A then dir = dir - cam.CFrame.RightVector end
            if Features.flyMovement.D then dir = dir + cam.CFrame.RightVector end
            if Features.flyMovement.Space then dir = dir + Vector3.new(0,1,0) end
            if Features.flyMovement.LeftShift then dir = dir - Vector3.new(0,1,0) end
            if dir.Magnitude > 0 then
                root.CFrame = root.CFrame + dir.Unit * Features.flySpeed * dt
            end
        end
    end
end)

--====================================
-- タブ切り替え
--====================================
local function hideAllTabs()
    for _, btn in ipairs(tabContents.player.buttons) do btn.Visible = false end
    for _, btn in ipairs(tabContents.esp.buttons) do btn.Visible = false end
    for _, btn in ipairs(tabContents.combat.buttons) do btn.Visible = false end
    for _, btn in ipairs(tabContents.bloxfruit.buttons) do btn.Visible = false end
    for _, btn in ipairs(tabContents.server.buttons) do btn.Visible = false end
    
    for _, s in ipairs(tabContents.player.settings) do s.Visible = false end
    for _, s in ipairs(tabContents.esp.settings) do s.Visible = false end
    for _, s in ipairs(tabContents.combat.settings) do s.Visible = false end
    for _, s in ipairs(tabContents.bloxfruit.settings) do s.Visible = false end
    for _, s in ipairs(tabContents.server.settings) do s.Visible = false end
end

local function resetTabActive()
    playerActive.BackgroundTransparency = 1
    espActive.BackgroundTransparency = 1
    combatActive.BackgroundTransparency = 1
    bloxfruitActive.BackgroundTransparency = 1
    serverActive.BackgroundTransparency = 1
end

playerTab.MouseButton1Click:Connect(function()
    hideAllTabs()
    resetTabActive()
    playerActive.BackgroundTransparency = 0
    for _, btn in ipairs(tabContents.player.buttons) do btn.Visible = true end
    for _, s in ipairs(tabContents.player.settings) do s.Visible = true end
end)

espTab.MouseButton1Click:Connect(function()
    hideAllTabs()
    resetTabActive()
    espActive.BackgroundTransparency = 0
    for _, btn in ipairs(tabContents.esp.buttons) do btn.Visible = true end
    for _, s in ipairs(tabContents.esp.settings) do s.Visible = true end
end)

combatTab.MouseButton1Click:Connect(function()
    hideAllTabs()
    resetTabActive()
    combatActive.BackgroundTransparency = 0
    for _, btn in ipairs(tabContents.combat.buttons) do btn.Visible = true end
    for _, s in ipairs(tabContents.combat.settings) do s.Visible = true end
end)

bloxfruitTab.MouseButton1Click:Connect(function()
    hideAllTabs()
    resetTabActive()
    bloxfruitActive.BackgroundTransparency = 0
    for _, btn in ipairs(tabContents.bloxfruit.buttons) do btn.Visible = true end
    for _, s in ipairs(tabContents.bloxfruit.settings) do s.Visible = true end
end)

serverTab.MouseButton1Click:Connect(function()
    hideAllTabs()
    resetTabActive()
    serverActive.BackgroundTransparency = 0
    for _, btn in ipairs(tabContents.server.buttons) do btn.Visible = true end
    for _, s in ipairs(tabContents.server.settings) do s.Visible = true end
end)

--====================================
-- ボタン機能
--====================================
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    iconGui:Destroy()
end)

minBtn.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
    uiVisible = false
    iconStroke.Color = Color3.fromRGB(255, 100, 100)
end)

local uiVisible = true
iconFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        tweenService:Create(iconFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, 45, 0, 45)}):Play()
    end
end)

iconFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        tweenService:Create(iconFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, 50, 0, 50)}):Play()
        uiVisible = not uiVisible
        screenGui.Enabled = uiVisible
        iconStroke.Color = uiVisible and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
    end
end)

--====================================
-- 定期更新（レベル・賞金）
--====================================
task.spawn(function()
    while true do
        task.wait(1)
        levelText.Text = "レベル: " .. getLevel(player)
        bountyText.Text = "賞金: " .. formatBounty(getBounty(player))
        local cnt = #players:GetPlayers()
        local max = 12
        serverInfo.Text = string.format("プレイヤー: %d/%d", cnt, max)
        barFill.Size = UDim2.new(cnt / max, 0, 1, 0)
    end
end)

-- 初期表示：プレイヤータブ
hideAllTabs()
resetTabActive()
playerActive.BackgroundTransparency = 0
for _, btn in ipairs(tabContents.player.buttons) do btn.Visible = true end
for _, s in ipairs(tabContents.player.settings) do s.Visible = true end

print("=== XENO HUB 完全版 読み込み完了 ===")
print("タブ: プレイヤー / ESP / 戦闘 / BloxFruit / サーバー")
print("プレイヤータブに全機能を搭載しました！")
