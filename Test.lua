-- deobfuscated by Luna
-- decompiler君が死んじゃった～

local r0_0 = Instance.new("ScreenGui")
r0_0.Name = "KeySystem"
r0_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
r0_0.Parent = game.Players.LocalPlayer.PlayerGui
local r1_0 = Instance.new("Frame")
r1_0.Name = "Purple"
r1_0.AnchorPoint = Vector2.new(0.5, 0.5)
r1_0.Size = UDim2.new(0, 500, 0, 299)
r1_0.BorderColor3 = Color3.new(0, 0, 0)
r1_0.Position = UDim2.new(0.5, 0, 0.5, 0)
r1_0.BorderSizePixel = 0
r1_0.BackgroundColor3 = Color3.new(1, 1, 1)
r1_0.Parent = r0_0
local r2_0 = Instance.new("UIGradient")
r2_0.Color = ColorSequence.new({
  ColorSequenceKeypoint.new(0, Color3.new(0.39, 0.31, 0.69)),
  ColorSequenceKeypoint.new(0.42, Color3.new(0.39, 0.31, 0.69)),
  ColorSequenceKeypoint.new(1, Color3.new(0.59, 0.67, 0.96))
})
r2_0.Rotation = 270
r2_0.Parent = r1_0
local r3_0 = Instance.new("UICorner")
r3_0.CornerRadius = UDim.new(0, 20)
r3_0.Parent = r1_0
local r4_0 = Instance.new("Frame")
r4_0.AnchorPoint = Vector2.new(0.5, 0.5)
r4_0.Size = UDim2.new(0, 195, 0, 299)
r4_0.BorderColor3 = Color3.new(0, 0, 0)
r4_0.Position = UDim2.new(0.3, 0, 0.5, 0)
r4_0.BorderSizePixel = 0
r4_0.BackgroundColor3 = Color3.new(0.11, 0.13, 0.19)
r4_0.Parent = r1_0
local r5_0 = Instance.new("TextLabel")
r5_0.Name = "Buttons"
r5_0.BorderSizePixel = 0
r5_0.BackgroundColor3 = Color3.new(1, 1, 1)
r5_0.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
r5_0.AnchorPoint = Vector2.new(0.5, 0.5)
r5_0.TextSize = 18
r5_0.Size = UDim2.new(0, 250, 0, 200)
r5_0.BorderColor3 = Color3.new(0, 0, 0)
r5_0.Text = "SolixHub is the go-to hub for \npowerful scripts at \nthe lowest prices on the market. \nWe offer top-quality, \nuser-friendly tools that enhance productivity.\nCommitted to continuous \nimprovement and customer satisfaction, \nSolixHub constantly evolves to \nmeet your needs, \nensuring we provide \nvaluable scripting solutions."
r5_0.TextColor3 = Color3.new(0.58, 0.59, 0.65)
r5_0.BackgroundTransparency = 1
r5_0.Position = UDim2.new(0.76, 0, 0.5, 0)
r5_0.Parent = r1_0
local r6_0 = Instance.new("Frame")
r6_0.Name = "Black"
r6_0.AnchorPoint = Vector2.new(0.5, 0.5)
r6_0.Size = UDim2.new(0, 250, 0, 300)
r6_0.BorderColor3 = Color3.new(0, 0, 0)
r6_0.Position = UDim2.new(0.41, 0, 0.5, 0)
r6_0.BorderSizePixel = 0
r6_0.BackgroundColor3 = Color3.new(0.11, 0.13, 0.19)
r6_0.Parent = r0_0
local r7_0 = Instance.new("UICorner")
r7_0.CornerRadius = UDim.new(0, 20)
r7_0.Parent = r6_0
local r8_0 = Instance.new("TextLabel")
r8_0.Name = "Keysystem"
r8_0.BorderSizePixel = 0
r8_0.BackgroundColor3 = Color3.new(1, 1, 1)
r8_0.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
r8_0.AnchorPoint = Vector2.new(0.5, 0.5)
r8_0.TextSize = 29
r8_0.Size = UDim2.new(0, 250, 0, 50)
r8_0.BorderColor3 = Color3.new(0, 0, 0)
r8_0.Text = "Key System"
r8_0.TextColor3 = Color3.new(0.62, 0.64, 0.67)
r8_0.BackgroundTransparency = 1
r8_0.Position = UDim2.new(0.5, 0, 0.22, 0)
r8_0.Parent = r6_0
local r9_0 = Instance.new("TextLabel")
r9_0.Name = "Undertext"
r9_0.BorderSizePixel = 0
r9_0.BackgroundColor3 = Color3.new(1, 1, 1)
r9_0.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
r9_0.AnchorPoint = Vector2.new(0.5, 0.5)
r9_0.TextSize = 18
r9_0.Size = UDim2.new(0, 200, 0, 44)
r9_0.BorderColor3 = Color3.new(0, 0, 0)
r9_0.Text = "Complete a few steps to\n"
r9_0.TextColor3 = Color3.new(0.36, 0.37, 0.41)
r9_0.BackgroundTransparency = 1
r9_0.Position = UDim2.new(0.5, 0, 0.31, 0)
r9_0.Parent = r6_0
local r10_0 = Instance.new("TextLabel")
r10_0.Name = "Undertext2"
r10_0.BorderSizePixel = 0
r10_0.BackgroundColor3 = Color3.new(1, 1, 1)
r10_0.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
r10_0.AnchorPoint = Vector2.new(0.5, 0.5)
r10_0.TextSize = 18
r10_0.Size = UDim2.new(0, 200, 0, 44)
r10_0.BorderColor3 = Color3.new(0, 0, 0)
r10_0.Text = "continue to SolixHub"
r10_0.TextColor3 = Color3.new(0.36, 0.37, 0.41)
r10_0.BackgroundTransparency = 1
r10_0.Position = UDim2.new(0.5, 0, 0.34, 0)
r10_0.Parent = r6_0
local r11_0 = Instance.new("TextLabel")
r11_0.Name = "AboveKey"
r11_0.BorderSizePixel = 0
r11_0.BackgroundColor3 = Color3.new(1, 1, 1)
r11_0.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
r11_0.AnchorPoint = Vector2.new(0.5, 0.5)
r11_0.TextSize = 18
r11_0.Size = UDim2.new(0, 100, 0, 44)
r11_0.BorderColor3 = Color3.new(0, 0, 0)
r11_0.Text = "Key"
r11_0.TextColor3 = Color3.new(0.36, 0.37, 0.41)
r11_0.BackgroundTransparency = 1
r11_0.Position = UDim2.new(0.5, 0, 0.44, 0)
r11_0.Parent = r6_0
local r12_0 = Instance.new("TextBox")
r12_0.Name = "KeyBox"
r12_0.BorderSizePixel = 5
r12_0.BackgroundColor3 = Color3.new(1, 1, 1)
r12_0.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
r12_0.AnchorPoint = Vector2.new(0.5, 0.5)
r12_0.TextSize = 14
r12_0.Size = UDim2.new(0, 130, 0, 27)
r12_0.TextColor3 = Color3.new(0, 0, 0)
r12_0.BorderColor3 = Color3.new(0, 0, 0)
r12_0.Text = ""
r12_0.BackgroundTransparency = 1
r12_0.Position = UDim2.new(0.5, 0, 0.52, 0)
r12_0.Parent = r6_0
local r13_0 = Instance.new("UICorner")
r13_0.CornerRadius = UDim.new(0, 6)
r13_0.Parent = r12_0
local r14_0 = Instance.new("UIStroke")
r14_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
r14_0.Color = Color3.new(0.2, 0.21, 0.31)
r14_0.Thickness = 1.4
r14_0.Parent = r12_0
local r15_0 = Instance.new("TextButton")
r15_0.Name = "GetKey"
r15_0.BorderSizePixel = 0
r15_0.BackgroundColor3 = Color3.new(0.28, 0.23, 0.47)
r15_0.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
r15_0.AnchorPoint = Vector2.new(0.5, 0.5)
r15_0.TextSize = 16
r15_0.Size = UDim2.new(0, 100, 0, 27)
r15_0.TextColor3 = Color3.new(0.81, 0.81, 0.81)
r15_0.BorderColor3 = Color3.new(0, 0, 0)
r15_0.Text = "Get Key"
r15_0.Position = UDim2.new(0.33, 0, 0.74, 0)
r15_0.Parent = r6_0
(function()
  -- line: [0, 0] id: 1
  local r3_1 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("KeySystem"):WaitForChild("Black")
  local r4_1 = r3_1:WaitForChild("KeyBox")
  r3_1:WaitForChild("GetKey").MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 2
    setclipboard("https://work.ink/1Vml/ly5sw7hs")
    toclipboard("https://work.ink/1Vml/ly5sw7hs")
  end)
end)()
local r17_0 = Instance.new("UICorner")
r17_0.CornerRadius = UDim.new(0, 5)
r17_0.Parent = r15_0
local r18_0 = Instance.new("TextButton")
r18_0.Name = "CheckKey"
r18_0.BorderSizePixel = 0
r18_0.BackgroundColor3 = Color3.new(0.64, 0.55, 0.96)
r18_0.FontFace = Font.new("rbxasset://fonts/families/Oswald.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
r18_0.AnchorPoint = Vector2.new(0.5, 0.5)
r18_0.TextSize = 16
r18_0.Size = UDim2.new(0, 100, 0, 27)
r18_0.TextColor3 = Color3.new(0.81, 0.81, 0.81)
r18_0.BorderColor3 = Color3.new(0, 0, 0)
r18_0.Text = "Check Key"
r18_0.Position = UDim2.new(0.75, 0, 0.74, 0)
r18_0.Parent = r6_0
local r19_0 = Instance.new("UICorner")
r19_0.CornerRadius = UDim.new(0, 5)
r19_0.Parent = r18_0
print("JHIJDW")
(function()
  -- line: [0, 0] id: 3
  local r2_3 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("KeySystem")
  local r3_3 = r2_3:WaitForChild("Black")
  local r4_3 = r3_3:WaitForChild("KeyBox")
  local r5_3 = r3_3:WaitForChild("CheckKey")
  local r6_3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ifykyklolololol/dontneedodkdowkdwok/main/dontwanttotleakpls"))()
  r5_3.MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 4
    if r4_3.Text == r6_3 then
      r4_3.Text = "Valid Key!"
      wait(0.5)
      r2_3:Destroy()
      local r0_4 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
      local r1_4 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
      local r2_4 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
      local r3_4 = r0_4:CreateWindow({
        Title = "SolixHub [Free] | Blox Fruit ",
        SubTitle = "SolixHub",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = false,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.End,
      })
      local r4_4 = {
        Main = r3_4:AddTab({
          Title = "Main",
          Icon = "home",
        }),
        Setting = r3_4:AddTab({
          Title = "Farm Settings",
          Icon = "settings",
        }),
        Stats = r3_4:AddTab({
          Title = "Stats",
          Icon = "plus-circle",
        }),
        Player = r3_4:AddTab({
          Title = "Player",
          Icon = "box",
        }),
        Teleport = r3_4:AddTab({
          Title = "Island",
          Icon = "palmtree",
        }),
        Fruit = r3_4:AddTab({
          Title = "Fruit",
          Icon = "cherry",
        }),
        Raid = r3_4:AddTab({
          Title = "Raid",
          Icon = "swords",
        }),
        Race = r3_4:AddTab({
          Title = "Race V4",
          Icon = "chevrons-right",
        }),
        Shop = r3_4:AddTab({
          Title = "Shop",
          Icon = "shopping-cart",
        }),
        Misc = r3_4:AddTab({
          Title = "Misc",
          Icon = "list-plus",
        }),
        Hop = r3_4:AddTab({
          Title = "Hop",
          Icon = "wifi",
        }),
        Configs = r3_4:AddTab({
          Title = "Configs",
          Icon = "settings",
        }),
      }
      local r5_4 = r0_4.Options
      local r6_4 = game.PlaceId
      if r6_4 == 2753915549 then
        First_Sea = true
      elseif r6_4 == 4442272183 then
        Second_Sea = true
      elseif r6_4 == 7449423635 then
        Third_Sea = true
      else
        game:Shutdown()
      end
      function AntiBan()
        -- line: [0, 0] id: 100
        for r3_100, r4_100 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
          if r4_100:IsA("LocalScript") and (r4_100.Name == "General" or r4_100.Name == "Shiftlock" or r4_100.Name == "FallDamage" or r4_100.Name == "4444" or r4_100.Name == "CamBob" or r4_100.Name == "JumpCD" or r4_100.Name == "Looking" or r4_100.Name == "Run") then
            r4_100:Destroy()
          end
        end
        for r3_100, r4_100 in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
          if r4_100:IsA("LocalScript") and (r4_100.Name == "RobloxMotor6DBugFix" or r4_100.Name == "Clans" or r4_100.Name == "Codes" or r4_100.Name == "CustomForceField" or r4_100.Name == "MenuBloodSp" or r4_100.Name == "PlayerList") then
            r4_100:Destroy()
          end
        end
      end
      AntiBan()
      game:GetService("Players").LocalPlayer.Idled:connect(function()
        -- line: [0, 0] id: 232
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
      end)
      First_Sea = false
      Second_Sea = false
      Third_Sea = false
      local r7_4 = game.PlaceId
      if r7_4 == 2753915549 then
        First_Sea = true
      elseif r7_4 == 4442272183 then
        Second_Sea = true
      elseif r7_4 == 7449423635 then
        Third_Sea = true
      end
      function CheckLevel()
        -- line: [0, 0] id: 431
        local r0_431 = game:GetService("Players").LocalPlayer.Data.Level.Value
        if First_Sea then
          if r0_431 == 1 or r0_431 <= 9 or SelectMonster == "Bandit" or SelectArea == "" then
            Ms = "Bandit"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
          elseif r0_431 == 10 or r0_431 <= 14 or SelectMonster == "Monkey" or SelectArea == "Jungle" then
            Ms = "Monkey"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
          elseif r0_431 == 15 or r0_431 <= 29 or SelectMonster == "Gorilla" or SelectArea == "Jungle" then
            Ms = "Gorilla"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
          elseif r0_431 == 30 or r0_431 <= 39 or SelectMonster == "Pirate" or SelectArea == "Buggy" then
            Ms = "Pirate"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
          elseif r0_431 == 40 or r0_431 <= 59 or SelectMonster == "Brute" or SelectArea == "Buggy" then
            Ms = "Brute"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
          elseif r0_431 == 60 or r0_431 <= 74 or SelectMonster == "Desert Bandit" or SelectArea == "Desert" then
            Ms = "Desert Bandit"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
          elseif r0_431 == 75 or r0_431 <= 89 or SelectMonster == "Desert Officer" or SelectArea == "Desert" then
            Ms = "Desert Officer"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
          elseif r0_431 == 90 or r0_431 <= 99 or SelectMonster == "Snow Bandit" or SelectArea == "Snow" then
            Ms = "Snow Bandit"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
          elseif r0_431 == 100 or r0_431 <= 119 or SelectMonster == "Snowman" or SelectArea == "Snow" then
            Ms = "Snowman"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
          elseif r0_431 == 120 or r0_431 <= 149 or SelectMonster == "Chief Petty Officer" or SelectArea == "Marine" then
            Ms = "Chief Petty Officer"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
          elseif r0_431 == 150 or r0_431 <= 174 or SelectMonster == "Sky Bandit" or SelectArea == "Sky" then
            Ms = "Sky Bandit"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
          elseif r0_431 == 175 or r0_431 <= 189 or SelectMonster == "Dark Master" or SelectArea == "Sky" then
            Ms = "Dark Master"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
          elseif r0_431 == 190 or r0_431 <= 209 or SelectMonster == "Prisoner" or SelectArea == "Prison" then
            Ms = "Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 1
            NameMon = "Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
          elseif r0_431 == 210 or r0_431 <= 249 or SelectMonster == "Dangerous Prisoner" or SelectArea == "Prison" then
            Ms = "Dangerous Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 2
            NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
          elseif r0_431 == 250 or r0_431 <= 274 or SelectMonster == "Toga Warrior" or SelectArea == "Colosseum" then
            Ms = "Toga Warrior"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
          elseif r0_431 == 275 or r0_431 <= 299 or SelectMonster == "Gladiator" or SelectArea == "Colosseum" then
            Ms = "Gladiator"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
          elseif r0_431 == 300 or r0_431 <= 324 or SelectMonster == "Military Soldier" or SelectArea == "Magma" then
            Ms = "Military Soldier"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
          elseif r0_431 == 325 or r0_431 <= 374 or SelectMonster == "Military Spy" or SelectArea == "Magma" then
            Ms = "Military Spy"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
          elseif r0_431 == 375 or r0_431 <= 399 or SelectMonster == "Fishman Warrior" or SelectArea == "Fishman" then
            Ms = "Fishman Warrior"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
            if _G.AutoLevel and 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
          elseif r0_431 == 400 or r0_431 <= 449 or SelectMonster == "Fishman Commando" or SelectArea == "Fishman" then
            Ms = "Fishman Commando"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
            if _G.AutoLevel and 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
          elseif r0_431 == 10 or r0_431 <= 474 or SelectMonster == "God\'s Guard" or SelectArea == "Sky Island" then
            Ms = "God\'s Guard"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God\'s Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
            if _G.AutoLevel and 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
          elseif r0_431 == 475 or r0_431 <= 524 or SelectMonster == "Shanda" or SelectArea == "Sky Island" then
            Ms = "Shanda"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
            if _G.AutoLevel and 3000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
          elseif r0_431 == 525 or r0_431 <= 549 or SelectMonster == "Royal Squad" or SelectArea == "Sky Island" then
            Ms = "Royal Squad"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
          elseif r0_431 == 550 or r0_431 <= 624 or SelectMonster == "Royal Soldier" or SelectArea == "Sky Island" then
            Ms = "Royal Soldier"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
          elseif r0_431 == 625 or r0_431 <= 649 or SelectMonster == "Galley Pirate" or SelectArea == "Fountain" then
            Ms = "Galley Pirate"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
          elseif 650 <= r0_431 or SelectMonster == "Galley Captain" or SelectArea == "Fountain" then
            Ms = "Galley Captain"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
          end
        end
        if Second_Sea then
          if r0_431 == 700 or r0_431 <= 724 or SelectMonster == "Raider" or SelectArea == "Area 1" then
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
          elseif r0_431 == 725 or r0_431 <= 774 or SelectMonster == "Mercenary" or SelectArea == "Area 1" then
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
          elseif r0_431 == 775 or r0_431 <= 799 or SelectMonster == "Swan Pirate" or SelectArea == "Area 2" then
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
          elseif r0_431 == 800 or r0_431 <= 874 or SelectMonster == "Factory Staff" or SelectArea == "Area 2" then
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
          elseif r0_431 == 875 or r0_431 <= 899 or SelectMonster == "Marine Lieutenan" or SelectArea == "Marine" then
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
          elseif r0_431 == 900 or r0_431 <= 949 or SelectMonster == "Marine Captain" or SelectArea == "Marine" then
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
          elseif r0_431 == 950 or r0_431 <= 974 or SelectMonster == "Zombie" or SelectArea == "Zombie" then
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
          elseif r0_431 == 975 or r0_431 <= 999 or SelectMonster == "Vampire" or SelectArea == "Zombie" then
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
          elseif r0_431 == 1000 or r0_431 <= 1049 or SelectMonster == "Snow Trooper" or SelectArea == "Snow Mountain" then
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
          elseif r0_431 == 1050 or r0_431 <= 1099 or SelectMonster == "Winter Warrior" or SelectArea == "Snow Mountain" then
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
          elseif r0_431 == 1100 or r0_431 <= 1124 or SelectMonster == "Lab Subordinate" or SelectArea == "Ice Fire" then
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
          elseif r0_431 == 1125 or r0_431 <= 1174 or SelectMonster == "Horned Warrior" or SelectArea == "Ice Fire" then
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
          elseif r0_431 == 1175 or r0_431 <= 1199 or SelectMonster == "Magma Ninja" or SelectArea == "Ice Fire" then
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
          elseif r0_431 == 1200 or r0_431 <= 1249 or SelectMonster == "Lava Pirate" or SelectArea == "Ice Fire" then
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
          elseif r0_431 == 1250 or r0_431 <= 1274 or SelectMonster == "Ship Deckhand" or SelectArea == "Ship" then
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
          elseif r0_431 == 1275 or r0_431 <= 1299 or SelectMonster == "Ship Engineer" or SelectArea == "Ship" then
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
            if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
          elseif r0_431 == 1300 or r0_431 <= 1324 or SelectMonster == "Ship Steward" or SelectArea == "Ship" then
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
          elseif r0_431 == 1325 or r0_431 <= 1349 or SelectMonster == "Ship Officer" or SelectArea == "Ship" then
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
          elseif r0_431 == 1350 or r0_431 <= 1374 or SelectMonster == "Arctic Warrior" or SelectArea == "Frost" then
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
            if _G.AutoLevel and 20000 < (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            end
          elseif r0_431 == 1375 or r0_431 <= 1424 or SelectMonster == "Snow Lurker" or SelectArea == "Frost" then
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
          elseif r0_431 == 1425 or r0_431 <= 1449 or SelectMonster == "Sea Soldier" or SelectArea == "Forgotten" then
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
          elseif 1450 <= r0_431 or SelectMonster == "Water Fighter" or SelectArea == "Forgotten" then
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
          end
        end
        if Third_Sea then
          if r0_431 == 1500 or r0_431 <= 1524 or SelectMonster == "Pirate Millionaire" or SelectArea == "Pirate Port" then
            Ms = "Pirate Millionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 1
            NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
          elseif r0_431 == 1525 or r0_431 <= 1574 or SelectMonster == "Pistol Billionaire" or SelectArea == "Pirate Port" then
            Ms = "Pistol Billionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 2
            NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
            CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
          elseif r0_431 == 1575 or r0_431 <= 1599 or SelectMonster == "Dragon Crew Warrior" or SelectArea == "Amazon" then
            Ms = "Dragon Crew Warrior"
            NameQuest = "AmazonQuest"
            QuestLv = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
          elseif r0_431 == 1600 or r0_431 <= 1624 or SelectMonster == "Dragon Crew Archer" or SelectArea == "Amazon" then
            Ms = "Dragon Crew Archer"
            NameQuest = "AmazonQuest"
            QuestLv = 2
            NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
            CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
          elseif r0_431 == 1625 or r0_431 <= 1649 or SelectMonster == "Female Islander" or SelectArea == "Amazon" then
            Ms = "Female Islander"
            NameQuest = "AmazonQuest2"
            QuestLv = 1
            NameMon = "Female Islander"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
          elseif r0_431 == 1650 or r0_431 <= 1699 or SelectMonster == "Giant Islander" or SelectArea == "Amazon" then
            Ms = "Giant Islander"
            NameQuest = "AmazonQuest2"
            QuestLv = 2
            NameMon = "Giant Islander"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
          elseif r0_431 == 1700 or r0_431 <= 1724 or SelectMonster == "Marine Commodore" or SelectArea == "Marine Tree" then
            Ms = "Marine Commodore"
            NameQuest = "MarineTreeIsland"
            QuestLv = 1
            NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
          elseif r0_431 == 1725 or r0_431 <= 1774 or SelectMonster == "Marine Rear Admiral" or SelectArea == "Marine Tree" then
            Ms = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            QuestLv = 2
            NameMon = "Marine Rear Admiral"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
          elseif r0_431 == 1775 or r0_431 <= 1799 or SelectMonster == "Fishman Raider" or SelectArea == "Deep Forest" then
            Ms = "Fishman Raider"
            NameQuest = "DeepForestIsland3"
            QuestLv = 1
            NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
            CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
          elseif r0_431 == 1800 or r0_431 <= 1824 or SelectMonster == "Fishman Captain" or SelectArea == "Deep Forest" then
            Ms = "Fishman Captain"
            NameQuest = "DeepForestIsland3"
            QuestLv = 2
            NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
            CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
          elseif r0_431 == 1825 or r0_431 <= 1849 or SelectMonster == "Forest Pirate" or SelectArea == "Deep Forest" then
            Ms = "Forest Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 1
            NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
          elseif r0_431 == 1850 or r0_431 <= 1899 or SelectMonster == "Mythological Pirate" or SelectArea == "Deep Forest" then
            Ms = "Mythological Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 2
            NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
          elseif r0_431 == 1900 or r0_431 <= 1924 or SelectMonster == "Jungle Pirate" or SelectArea == "Deep Forest" then
            Ms = "Jungle Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 1
            NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
          elseif r0_431 == 1925 or r0_431 <= 1974 or SelectMonster == "Musketeer Pirate" or SelectArea == "Deep Forest" then
            Ms = "Musketeer Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 2
            NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
          elseif r0_431 == 1975 or r0_431 <= 1999 or SelectMonster == "Reborn Skeleton" or SelectArea == "Haunted Castle" then
            Ms = "Reborn Skeleton"
            NameQuest = "HauntedQuest1"
            QuestLv = 1
            NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 0.0000000452954225, -0.999978542, 0.0000000204920472, 1, 0.0000000451620679, 0.999978542, -0.0000000201955679, -0.00655503059)
            CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301, 0.978073597, -0.000013950732, -0.208259016, -0.00000108073925, 1, -0.0000720630269, 0.208259016, 0.0000707080399, 0.978073597)
          elseif r0_431 == 2000 or r0_431 <= 2024 or SelectMonster == "Living Zombie" or SelectArea == "Haunted Castle" then
            Ms = "Living Zombie"
            NameQuest = "HauntedQuest1"
            QuestLv = 2
            NameMon = "Living Zombie"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305, -0.00655503059, 0.0000000452954225, -0.999978542, 0.0000000204920472, 1, 0.0000000451620679, 0.999978542, -0.0000000201955679, -0.00655503059)
            CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977, 0.999474227, 0.0000000277547141, 0.0324240364, -0.0000000258006327, 1, -0.0000000606848474, -0.0324240364, 0.0000000598163865, 0.999474227)
          elseif r0_431 == 2025 or r0_431 <= 2049 or SelectMonster == "Demonic Soul" or SelectArea == "Haunted Castle" then
            Ms = "Demonic Soul"
            NameQuest = "HauntedQuest2"
            QuestLv = 1
            NameMon = "Demonic Soul"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
          elseif r0_431 == 2050 or r0_431 <= 2074 or SelectMonster == "Posessed Mummy" or SelectArea == "Haunted Castle" then
            Ms = "Posessed Mummy"
            NameQuest = "HauntedQuest2"
            QuestLv = 2
            NameMon = "Posessed Mummy"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
          elseif r0_431 == 2075 or r0_431 <= 2099 or SelectMonster == "Peanut Scout" or SelectArea == "Nut Island" then
            Ms = "Peanut Scout"
            NameQuest = "NutsIslandQuest"
            QuestLv = 1
            NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
          elseif r0_431 == 2100 or r0_431 <= 2124 or SelectMonster == "Peanut President" or SelectArea == "Nut Island" then
            Ms = "Peanut President"
            NameQuest = "NutsIslandQuest"
            QuestLv = 2
            NameMon = "Peanut President"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088, -0.766061664, 0, -0.642767608, 0, 1, 0, 0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
          elseif r0_431 == 2125 or r0_431 <= 2149 or SelectMonster == "Ice Cream Chef" or SelectArea == "Ice Cream Island" then
            Ms = "Ice Cream Chef"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
          elseif r0_431 == 2150 or r0_431 <= 2199 or SelectMonster == "Ice Cream Commander" or SelectArea == "Ice Cream Island" then
            Ms = "Ice Cream Commander"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805, -0.0703101531, 0, -0.997525156, 0, 1.00000012, 0, 0.997525275, 0, -0.0703101456)
          elseif r0_431 == 2200 or r0_431 <= 2224 or SelectMonster == "Cookie Crafter" or SelectArea == "Cake Island" then
            Ms = "Cookie Crafter"
            NameQuest = "CakeQuest1"
            QuestLv = 1
            NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871, -0.780074954, 0, 0.625686109, 0, 1, 0, -0.625686109, 0, -0.780074954)
          elseif r0_431 == 2225 or r0_431 <= 2249 or SelectMonster == "Cake Guard" or SelectArea == "Cake Island" then
            Ms = "Cake Guard"
            NameQuest = "CakeQuest1"
            QuestLv = 2
            NameMon = "Cake Guard"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766, -0.961273909, 0, -0.275594592, 0, 1, 0, 0.275594592, 0, -0.961273909)
            CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, -0.997700036, 0, 0.0677844882)
          elseif r0_431 == 2250 or r0_431 <= 2274 or SelectMonster == "Baking Staff" or SelectArea == "Cake Island" then
            Ms = "Baking Staff"
            NameQuest = "CakeQuest2"
            QuestLv = 1
            NameMon = "Baking Staff"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418, -0.254443765, 0, -0.967087567, 0, 1, 0, 0.967087567, 0, -0.254443765)
          elseif r0_431 == 2275 or r0_431 <= 2299 or SelectMonster == "Head Baker" or SelectArea == "Cake Island" then
            Ms = "Head Baker"
            NameQuest = "CakeQuest2"
            QuestLv = 2
            NameMon = "Head Baker"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626, 0.951068401, 0, -0.308980465, 0, 1, 0, 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965, -0.991971016, 0, -0.126466095, 0, 1, 0, 0.126466095, 0, -0.991971016)
          elseif r0_431 == 2300 or r0_431 <= 2324 or SelectMonster == "Cocoa Warrior" or SelectArea == "Choco Island" then
            Ms = "Cocoa Warrior"
            NameQuest = "ChocQuest1"
            QuestLv = 1
            NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874, -0.939700961, 0, 0.341998369, 0, 1, 0, -0.341998369, 0, -0.939700961)
          elseif r0_431 == 2325 or r0_431 <= 2349 or SelectMonster == "Chocolate Bar Battler" or SelectArea == "Choco Island" then
            Ms = "Chocolate Bar Battler"
            NameQuest = "ChocQuest1"
            QuestLv = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685)
          elseif r0_431 == 2350 or r0_431 <= 2374 or SelectMonster == "Sweet Thief" or SelectArea == "Choco Island" then
            Ms = "Sweet Thief"
            NameQuest = "ChocQuest2"
            QuestLv = 1
            NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
          elseif r0_431 == 2375 or r0_431 <= 2400 or SelectMonster == "Candy Rebel" or SelectArea == "Choco Island" then
            Ms = "Candy Rebel"
            NameQuest = "ChocQuest2"
            QuestLv = 2
            NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402, -0.819156051, 0, -0.573571265, 0, 1, 0, 0.573571265, 0, -0.819156051)
          elseif r0_431 == 2400 or r0_431 <= 2424 or SelectMonster == "Candy Pirate" or SelectArea == "Candy Island" then
            Ms = "Candy Pirate"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934, 0.173624337, 0, -0.984811902, 0, 1, 0, 0.984811902, 0, 0.173624337)
          elseif r0_431 == 2425 or r0_431 <= 2449 or SelectMonster == "Snow Demon" or SelectArea == "Candy Island" then
            Ms = "Snow Demon"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143, -0.156446099, 0, -0.987686574, 0, 1, 0, 0.987686574, 0, -0.156446099)
            CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
          elseif r0_431 == 2450 or r0_431 <= 2474 or SelectMonster == "Isle Outlaw" or SelectArea == "Tiki Outpost" then
            Ms = "Isle Outlaw"
            NameQuest = "TikiQuest1"
            QuestLv = 1
            NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632813)
            CFrameMon = CFrame.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
          elseif r0_431 == 2475 or r0_431 <= 2499 or SelectMonster == "Island Boy" or SelectArea == "Tiki Outpost" then
            Ms = "Island Boy"
            NameQuest = "TikiQuest1"
            QuestLv = 2
            NameMon = "Island Boy"
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632813)
            CFrameMon = CFrame.new(-16912.130859375, 11.787443161010742, -133.0850830078125)
          elseif r0_431 == 2500 or r0_431 <= 2424 then
            Ms = "Sun-kissed Warrior"
            QuestLv = 1
            NameQuest = "TikiQuest2"
            NameMon = "kissed"
            CFrameQ = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
            CFrameMon = CFrame.new(-16349.8779296875, 92.0808334350586, 1123.4169921875)
          elseif 2525 <= r0_431 or SelectMonster == "Isle Champion" or SelectArea == "Tiki Outpost" then
            Ms = "Isle Champion"
            NameQuest = "TikiQuest2"
            QuestLv = 2
            NameMon = "Isle Champion"
            CFrameQ = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625)
            CFrameMon = CFrame.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
          end
        end
      end
      if First_Sea then
        tableMon = {
          "Bandit",
          "Monkey",
          "Gorilla",
          "Pirate",
          "Brute",
          "Desert Bandit",
          "Desert Officer",
          "Snow Bandit",
          "Snowman",
          "Chief Petty Officer",
          "Sky Bandit",
          "Dark Master",
          "Prisoner",
          "Dangerous Prisoner",
          "Toga Warrior",
          "Gladiator",
          "Military Soldier",
          "Military Spy",
          "Fishman Warrior",
          "Fishman Commando",
          "God\'s Guard",
          "Shanda",
          "Royal Squad",
          "Royal Soldier",
          "Galley Pirate",
          "Galley Captain"
        }
      elseif Second_Sea then
        tableMon = {
          "Raider",
          "Mercenary",
          "Swan Pirate",
          "Factory Staff",
          "Marine Lieutenant",
          "Marine Captain",
          "Zombie",
          "Vampire",
          "Snow Trooper",
          "Winter Warrior",
          "Lab Subordinate",
          "Horned Warrior",
          "Magma Ninja",
          "Lava Pirate",
          "Ship Deckhand",
          "Ship Engineer",
          "Ship Steward",
          "Ship Officer",
          "Arctic Warrior",
          "Snow Lurker",
          "Sea Soldier",
          "Water Fighter"
        }
      elseif Third_Sea then
        tableMon = {
          "Pirate Millionaire",
          "Dragon Crew Warrior",
          "Dragon Crew Archer",
          "Female Islander",
          "Giant Islander",
          "Marine Commodore",
          "Marine Rear Admiral",
          "Fishman Raider",
          "Fishman Captain",
          "Forest Pirate",
          "Mythological Pirate",
          "Jungle Pirate",
          "Musketeer Pirate",
          "Reborn Skeleton",
          "Living Zombie",
          "Demonic Soul",
          "Posessed Mummy",
          "Peanut Scout",
          "Peanut President",
          "Ice Cream Chef",
          "Ice Cream Commander",
          "Cookie Crafter",
          "Cake Guard",
          "Baking Staff",
          "Head Baker",
          "Cocoa Warrior",
          "Chocolate Bar Battler",
          "Sweet Thief",
          "Candy Rebel",
          "Candy Pirate",
          "Snow Demon",
          "Isle Outlaw",
          "Island Boy",
          "Isle Champion",
          nil,
          nil
        }
      end
      if First_Sea then
        AreaList = {
          "Jungle",
          "Buggy",
          "Desert",
          "Snow",
          "Marine",
          "Sky",
          "Prison",
          "Colosseum",
          "Magma",
          "Fishman",
          "Sky Island",
          "Fountain"
        }
      elseif Second_Sea then
        AreaList = {
          "Area 1",
          "Area 2",
          "Zombie",
          "Marine",
          "Snow Mountain",
          "Ice fire",
          "Ship",
          "Frost",
          "Forgotten"
        }
      elseif Third_Sea then
        AreaList = {
          "Pirate Port",
          "Amazon",
          "Marine Tree",
          "Deep Forest",
          "Haunted Castle",
          "Nut Island",
          "Ice Cream Island",
          "Cake Island",
          "Choco Island",
          "Candy Island",
          "Tiki Outpost"
        }
      end
      function CheckBossQuest()
        -- line: [0, 0] id: 254
        if First_Sea then
          if SelectBoss == "The Gorilla King" then
            BossMon = "The Gorilla King"
            NameBoss = "The Gorrila King"
            NameQuestBoss = "JungleQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$2,000\n7,000 Exp."
            CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
          elseif SelectBoss == "Bobby" then
            BossMon = "Bobby"
            NameBoss = "Bobby"
            NameQuestBoss = "BuggyQuest1"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$8,000\n35,000 Exp."
            CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
          elseif SelectBoss == "The Saw" then
            BossMon = "The Saw"
            NameBoss = "The Saw"
            CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
          elseif SelectBoss == "Yeti" then
            BossMon = "Yeti"
            NameBoss = "Yeti"
            NameQuestBoss = "SnowQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$10,000\n180,000 Exp."
            CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
          elseif SelectBoss == "Mob Leader" then
            BossMon = "Mob Leader"
            NameBoss = "Mob Leader"
            CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
          elseif SelectBoss == "Vice Admiral" then
            BossMon = "Vice Admiral"
            NameBoss = "Vice Admiral"
            NameQuestBoss = "MarineQuest2"
            QuestLvBoss = 2
            RewardBoss = "Reward:\n$10,000\n180,000 Exp."
            CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
            CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
          elseif SelectBoss == "Saber Expert" then
            NameBoss = "Saber Expert"
            BossMon = "Saber Expert"
            CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
          elseif SelectBoss == "Warden" then
            BossMon = "Warden"
            NameBoss = "Warden"
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 1
            RewardBoss = "Reward:\n$6,000\n850,000 Exp."
            CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -0.00000449946401, 0.975376427, -0.0000195412576, 1, 0.00000903162072, -0.975376427, -0.0000210519756, 0.220546961)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
          elseif SelectBoss == "Chief Warden" then
            BossMon = "Chief Warden"
            NameBoss = "Chief Warden"
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 2
            RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
            CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -0.0000280422337, -0.939682961, 0.00181045406, 0.342041939)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
          elseif SelectBoss == "Swan" then
            BossMon = "Swan"
            NameBoss = "Swan"
            NameQuestBoss = "ImpelQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
            CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
          elseif SelectBoss == "Magma Admiral" then
            BossMon = "Magma Admiral"
            NameBoss = "Magma Admiral"
            NameQuestBoss = "MagmaQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
            CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
            CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
          elseif SelectBoss == "Fishman Lord" then
            BossMon = "Fishman Lord"
            NameBoss = "Fishman Lord"
            NameQuestBoss = "FishmanQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
            CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
          elseif SelectBoss == "Wysper" then
            BossMon = "Wysper"
            NameBoss = "Wysper"
            NameQuestBoss = "SkyExp1Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
            CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
            CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
          elseif SelectBoss == "Thunder God" then
            BossMon = "Thunder God"
            NameBoss = "Thunder God"
            NameQuestBoss = "SkyExp2Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
            CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
          elseif SelectBoss == "Cyborg" then
            BossMon = "Cyborg"
            NameBoss = "Cyborg"
            NameQuestBoss = "FountainQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
            CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
          elseif SelectBoss == "Ice Admiral" then
            BossMon = "Ice Admiral"
            NameBoss = "Ice Admiral"
            CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
          elseif SelectBoss == "Greybeard" then
            BossMon = "Greybeard"
            NameBoss = "Greybeard"
            CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
          end
        end
        if Second_Sea then
          if SelectBoss == "Diamond" then
            BossMon = "Diamond"
            NameBoss = "Diamond"
            NameQuestBoss = "Area1Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
            CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
            CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
          elseif SelectBoss == "Jeremy" then
            BossMon = "Jeremy"
            NameBoss = "Jeremy"
            NameQuestBoss = "Area2Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
            CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
            CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
          elseif SelectBoss == "Fajita" then
            BossMon = "Fajita"
            NameBoss = "Fajita"
            NameQuestBoss = "MarineQuest3"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
            CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
            CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
          elseif SelectBoss == "Don Swan" then
            BossMon = "Don Swan"
            NameBoss = "Don Swan"
            CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
          elseif SelectBoss == "Smoke Admiral" then
            BossMon = "Smoke Admiral"
            NameBoss = "Smoke Admiral"
            NameQuestBoss = "IceSideQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
            CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
          elseif SelectBoss == "Awakened Ice Admiral" then
            BossMon = "Awakened Ice Admiral"
            NameBoss = "Awakened Ice Admiral"
            NameQuestBoss = "FrostQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
            CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
            CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
          elseif SelectBoss == "Tide Keeper" then
            BossMon = "Tide Keeper"
            NameBoss = "Tide Keeper"
            NameQuestBoss = "ForgottenQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
            CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
            CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
          elseif SelectBoss == "Darkbeard" then
            BossMon = "Darkbeard"
            NameBoss = "Darkbeard"
            CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
          elseif SelectBoss == "Cursed Captain" then
            BossMon = "Cursed Captain"
            NameBoss = "Cursed Captain"
            CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
          elseif SelectBoss == "Order" then
            BossMon = "Order"
            NameBoss = "Order"
            CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
          end
        end
        if Third_Sea then
          if SelectBoss == "Stone" then
            BossMon = "Stone"
            NameBoss = "Stone"
            NameQuestBoss = "PiratePortQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
            CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
          elseif SelectBoss == "Island Empress" then
            BossMon = "Island Empress"
            NameBoss = "Island Empress"
            NameQuestBoss = "AmazonQuest2"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
            CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
            CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
          elseif SelectBoss == "Kilo Admiral" then
            BossMon = "Kilo Admiral"
            NameBoss = "Kilo Admiral"
            NameQuestBoss = "MarineTreeIsland"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
            CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
            CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
          elseif SelectBoss == "Captain Elephant" then
            BossMon = "Captain Elephant"
            NameBoss = "Captain Elephant"
            NameQuestBoss = "DeepForestIsland"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
            CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
            CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
          elseif SelectBoss == "Beautiful Pirate" then
            BossMon = "Beautiful Pirate"
            NameBoss = "Beautiful Pirate"
            NameQuestBoss = "DeepForestIsland2"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
            CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
          elseif SelectBoss == "Cake Queen" then
            BossMon = "Cake Queen"
            NameBoss = "Cake Queen"
            NameQuestBoss = "IceCreamIslandQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
            CFrameQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
            CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
          elseif SelectBoss == "Longma" then
            BossMon = "Longma"
            NameBoss = "Longma"
            CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
          elseif SelectBoss == "Soul Reaper" then
            BossMon = "Soul Reaper"
            NameBoss = "Soul Reaper"
            CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
          elseif SelectBoss == "rip_indra True Form" then
            BossMon = "rip_indra True Form"
            NameBoss = "rip_indra True Form"
            CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
          end
        end
      end
      function MaterialMon()
        -- line: [0, 0] id: 71
        if SelectMaterial == "Radioactive Material" then
          MMon = "Factory Staff"
          MPos = CFrame.new(295, 73, -56)
          SP = "Default"
        elseif SelectMaterial == "Mystic Droplet" then
          MMon = "Water Fighter"
          MPos = CFrame.new(-3385, 239, -10542)
          SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
          if First_Sea then
            MMon = "Military Spy"
            MPos = CFrame.new(-5815, 84, 8820)
            SP = "Default"
          elseif Second_Sea then
            MMon = "Magma Ninja"
            MPos = CFrame.new(-5428, 78, -5959)
            SP = "Default"
          end
        elseif SelectMaterial == "Angel Wings" then
          MMon = "God\'s Guard"
          MPos = CFrame.new(-4698, 845, -1912)
          SP = "Default"
          if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7859.09814, 5544.19043, -381.476196))
          end
        elseif SelectMaterial == "Leather" then
          if First_Sea then
            MMon = "Brute"
            MPos = CFrame.new(-1145, 15, 4350)
            SP = "Default"
          elseif Second_Sea then
            MMon = "Marine Captain"
            MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
            SP = "Default"
          elseif Third_Sea then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
            SP = "Default"
          end
        elseif SelectMaterial == "Scrap Metal" then
          if First_Sea then
            MMon = "Brute"
            MPos = CFrame.new(-1145, 15, 4350)
            SP = "Default"
          elseif Second_Sea then
            MMon = "Swan Pirate"
            MPos = CFrame.new(878, 122, 1235)
            SP = "Default"
          elseif Third_Sea then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-12107, 332, -10549)
            SP = "Default"
          end
        elseif SelectMaterial == "Fish Tail" then
          if Third_Sea then
            MMon = "Fishman Raider"
            MPos = CFrame.new(-10993, 332, -8940)
            SP = "Default"
          elseif First_Sea then
            MMon = "Fishman Warrior"
            MPos = CFrame.new(61123, 19, 1569)
            SP = "Default"
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
            end
          end
        elseif SelectMaterial == "Demonic Wisp" then
          MMon = "Demonic Soul"
          MPos = CFrame.new(-9507, 172, 6158)
          SP = "Default"
        elseif SelectMaterial == "Vampire Fang" then
          MMon = "Vampire"
          MPos = CFrame.new(-6033, 7, -1317)
          SP = "Default"
        elseif SelectMaterial == "Conjured Cocoa" then
          MMon = "Chocolate Bar Battler"
          MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
          SP = "Default"
        elseif SelectMaterial == "Dragon Scale" then
          MMon = "Dragon Crew Archer"
          MPos = CFrame.new(6594, 383, 139)
          SP = "Default"
        elseif SelectMaterial == "Gunpowder" then
          MMon = "Pistol Billionaire"
          MPos = CFrame.new(-469, 74, 5904)
          SP = "Default"
        elseif SelectMaterial == "Mini Tusk" then
          MMon = "Mythological Pirate"
          MPos = CFrame.new(-13545, 470, -6917)
          SP = "Default"
        end
      end
      function UpdateIslandESP()
        -- line: [0, 0] id: 40
        for r3_40, r4_40 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 41
            if IslandESP and r4_40.Name ~= "Sea" then
              if not r4_40:FindFirstChild("NameEsp") then
                local r0_41 = Instance.new("BillboardGui", r4_40)
                r0_41.Name = "NameEsp"
                r0_41.ExtentsOffset = Vector3.new(0, 1, 0)
                r0_41.Size = UDim2.new(1, 200, 1, 30)
                r0_41.Adornee = r4_40
                r0_41.AlwaysOnTop = true
                local r1_41 = Instance.new("TextLabel", r0_41)
                r1_41.Font = "GothamBold"
                r1_41.FontSize = "Size14"
                r1_41.TextWrapped = true
                r1_41.Size = UDim2.new(1, 0, 1, 0)
                r1_41.TextYAlignment = "Top"
                r1_41.BackgroundTransparency = 1
                r1_41.TextStrokeTransparency = 0.5
                r1_41.TextColor3 = Color3.fromRGB(8, 0, 0)
              else
                r4_40.NameEsp.TextLabel.Text = r4_40.Name .. "   \n" .. round(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_40.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_40:FindFirstChild("NameEsp") then
              r4_40:FindFirstChild("NameEsp"):Destroy()
            end
          end)
          -- close: r3_40
        end
      end
      function isnil(r0_213)
        -- line: [0, 0] id: 213
        return r0_213 == nil
      end
      local function r8_4(r0_399)
        -- line: [0, 0] id: 399
        return math.floor(tonumber(r0_399) + 0.5)
      end
      Number = math.random(1, 1000000)
      function UpdatePlayerChams()
        -- line: [0, 0] id: 234
        for r3_234, r4_234 in pairs(game:GetService("Players"):GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 235
            if not isnil(r4_234.Character) then
              if ESPPlayer then
                if not isnil(r4_234.Character.Head) and not r4_234.Character.Head:FindFirstChild(("NameEsp" .. Number)) then
                  local r0_235 = Instance.new("BillboardGui", r4_234.Character.Head)
                  r0_235.Name = "NameEsp" .. Number
                  r0_235.ExtentsOffset = Vector3.new(0, 1, 0)
                  r0_235.Size = UDim2.new(1, 200, 1, 30)
                  r0_235.Adornee = r4_234.Character.Head
                  r0_235.AlwaysOnTop = true
                  local r1_235 = Instance.new("TextLabel", r0_235)
                  r1_235.Font = Enum.Font.GothamSemibold
                  r1_235.FontSize = "Size10"
                  r1_235.TextWrapped = true
                  r1_235.Text = r4_234.Name .. " \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_234.Character.Head.Position)).Magnitude / 3) .. " Distance"
                  r1_235.Size = UDim2.new(1, 0, 1, 0)
                  r1_235.TextYAlignment = "Top"
                  r1_235.BackgroundTransparency = 1
                  r1_235.TextStrokeTransparency = 0.5
                  if r4_234.Team == game.Players.LocalPlayer.Team then
                    r1_235.TextColor3 = Color3.new(0, 0, 254)
                  else
                    r1_235.TextColor3 = Color3.new(255, 0, 0)
                  end
                else
                  r4_234.Character.Head["NameEsp" .. Number].TextLabel.Text = r4_234.Name .. " | " .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_234.Character.Head.Position)).Magnitude / 3) .. " Distance\nHealth : " .. r8_4(r4_234.Character.Humanoid.Health * 100 / r4_234.Character.Humanoid.MaxHealth) .. "%"
                end
              elseif r4_234.Character.Head:FindFirstChild("NameEsp" .. Number) then
                r4_234.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
              end
            end
          end)
          -- close: r3_234
        end
      end
      function UpdateChestChams()
        -- line: [0, 0] id: 195
        for r3_195, r4_195 in pairs(game.Workspace:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 196
            if string.find(r4_195.Name, "Chest") and r4_195:FindFirstChild("NameEsp" .. Number) then
              r4_195:FindFirstChild("NameEsp" .. Number):Destroy()
            end
            -- warn: not visited block [4, 5, 6, 7, 8, 9, 10]
            -- block#4:
            -- r0_196 = Instance.new("BillboardGui", _u0)
            -- r0_196.Name = "NameEsp" .. Number
            -- r0_196.ExtentsOffset = Vector3.new(0, 1, 0)
            -- r0_196.Size = UDim2.new(1, 200, 1, 30)
            -- r0_196.Adornee = _u0
            -- r0_196.AlwaysOnTop = true
            -- r1_196 = Instance.new("TextLabel", r0_196)
            -- r1_196.Font = Enum.Font.GothamSemibold
            -- r1_196.FontSize = "Size14"
            -- r1_196.TextWrapped = true
            -- r1_196.Size = UDim2.new(1, 0, 1, 0)
            -- r1_196.TextYAlignment = "Top"
            -- r1_196.BackgroundTransparency = 1
            -- r1_196.TextStrokeTransparency = 0.5
            -- if _u0.Name == "Chest1"
            -- block#5:
            -- r1_196.TextColor3 = Color3.fromRGB(109, 109, 109)
            -- r1_196.Text = "Chest 1" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
            -- block#6:
            -- if _u0.Name == "Chest2"
            -- block#7:
            -- r1_196.TextColor3 = Color3.fromRGB(173, 158, 21)
            -- r1_196.Text = "Chest 2" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
            -- block#8:
            -- if _u0.Name == "Chest3"
            -- block#9:
            -- r1_196.TextColor3 = Color3.fromRGB(85, 255, 255)
            -- r1_196.Text = "Chest 3" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
            -- goto label_214
            -- block#10:
            -- _u0["NameEsp" .. Number].TextLabel.Text = _u0.Name .. "   \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
            -- goto label_214
          end)
          -- close: r3_195
        end
      end
      function UpdateDevilChams()
        -- line: [0, 0] id: 147
        for r3_147, r4_147 in pairs(game.Workspace:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 148
            if DevilFruitESP and string.find(r4_147.Name, "Fruit") then
              if not r4_147.Handle:FindFirstChild(("NameEsp" .. Number)) then
                local r0_148 = Instance.new("BillboardGui", r4_147.Handle)
                r0_148.Name = "NameEsp" .. Number
                r0_148.ExtentsOffset = Vector3.new(0, 1, 0)
                r0_148.Size = UDim2.new(1, 200, 1, 30)
                r0_148.Adornee = r4_147.Handle
                r0_148.AlwaysOnTop = true
                local r1_148 = Instance.new("TextLabel", r0_148)
                r1_148.Font = Enum.Font.GothamSemibold
                r1_148.FontSize = "Size14"
                r1_148.TextWrapped = true
                r1_148.Size = UDim2.new(1, 0, 1, 0)
                r1_148.TextYAlignment = "Top"
                r1_148.BackgroundTransparency = 1
                r1_148.TextStrokeTransparency = 0.5
                r1_148.TextColor3 = Color3.fromRGB(255, 255, 255)
                r1_148.Text = r4_147.Name .. " \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_147.Handle.Position)).Magnitude / 3) .. " Distance"
              else
                r4_147.Handle["NameEsp" .. Number].TextLabel.Text = r4_147.Name .. "   \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_147.Handle.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_147.Handle:FindFirstChild("NameEsp" .. Number) then
              r4_147.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
          end)
          -- close: r3_147
        end
      end
      function UpdateFlowerChams()
        -- line: [0, 0] id: 403
        for r3_403, r4_403 in pairs(game.Workspace:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 404
            if r4_403.Name == "Flower2" or r4_403.Name == "Flower1" then
              if FlowerESP then
                if not r4_403:FindFirstChild(("NameEsp" .. Number)) then
                  local r0_404 = Instance.new("BillboardGui", r4_403)
                  r0_404.Name = "NameEsp" .. Number
                  r0_404.ExtentsOffset = Vector3.new(0, 1, 0)
                  r0_404.Size = UDim2.new(1, 200, 1, 30)
                  r0_404.Adornee = r4_403
                  r0_404.AlwaysOnTop = true
                  local r1_404 = Instance.new("TextLabel", r0_404)
                  r1_404.Font = Enum.Font.GothamSemibold
                  r1_404.FontSize = "Size14"
                  r1_404.TextWrapped = true
                  r1_404.Size = UDim2.new(1, 0, 1, 0)
                  r1_404.TextYAlignment = "Top"
                  r1_404.BackgroundTransparency = 1
                  r1_404.TextStrokeTransparency = 0.5
                  r1_404.TextColor3 = Color3.fromRGB(255, 0, 0)
                  if r4_403.Name == "Flower1" then
                    r1_404.Text = "Blue Flower" .. " \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_403.Position)).Magnitude / 3) .. " Distance"
                    r1_404.TextColor3 = Color3.fromRGB(0, 0, 255)
                  end
                  if r4_403.Name == "Flower2" then
                    r1_404.Text = "Red Flower" .. " \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_403.Position)).Magnitude / 3) .. " Distance"
                    r1_404.TextColor3 = Color3.fromRGB(255, 0, 0)
                  end
                else
                  r4_403["NameEsp" .. Number].TextLabel.Text = r4_403.Name .. "   \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_403.Position)).Magnitude / 3) .. " Distance"
                end
              elseif r4_403:FindFirstChild("NameEsp" .. Number) then
                r4_403:FindFirstChild("NameEsp" .. Number):Destroy()
              end
            end
          end)
          -- close: r3_403
        end
      end
      function UpdateRealFruitChams()
        -- line: [0, 0] id: 227
        for r3_227, r4_227 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
          if r4_227:IsA("Tool") then
            if RealFruitESP then
              if not r4_227.Handle:FindFirstChild(("NameEsp" .. Number)) then
                local r5_227 = Instance.new("BillboardGui", r4_227.Handle)
                r5_227.Name = "NameEsp" .. Number
                r5_227.ExtentsOffset = Vector3.new(0, 1, 0)
                r5_227.Size = UDim2.new(1, 200, 1, 30)
                r5_227.Adornee = r4_227.Handle
                r5_227.AlwaysOnTop = true
                local r6_227 = Instance.new("TextLabel", r5_227)
                r6_227.Font = Enum.Font.GothamSemibold
                r6_227.FontSize = "Size14"
                r6_227.TextWrapped = true
                r6_227.Size = UDim2.new(1, 0, 1, 0)
                r6_227.TextYAlignment = "Top"
                r6_227.BackgroundTransparency = 1
                r6_227.TextStrokeTransparency = 0.5
                r6_227.TextColor3 = Color3.fromRGB(255, 0, 0)
                r6_227.Text = r4_227.Name .. " \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_227.Handle.Position)).Magnitude / 3) .. " Distance"
              else
                r4_227.Handle["NameEsp" .. Number].TextLabel.Text = r4_227.Name .. " " .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_227.Handle.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_227.Handle:FindFirstChild("NameEsp" .. Number) then
              r4_227.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
          end
        end
        for r3_227, r4_227 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
          if r4_227:IsA("Tool") then
            if RealFruitESP then
              if not r4_227.Handle:FindFirstChild(("NameEsp" .. Number)) then
                local r5_227 = Instance.new("BillboardGui", r4_227.Handle)
                r5_227.Name = "NameEsp" .. Number
                r5_227.ExtentsOffset = Vector3.new(0, 1, 0)
                r5_227.Size = UDim2.new(1, 200, 1, 30)
                r5_227.Adornee = r4_227.Handle
                r5_227.AlwaysOnTop = true
                local r6_227 = Instance.new("TextLabel", r5_227)
                r6_227.Font = Enum.Font.GothamSemibold
                r6_227.FontSize = "Size14"
                r6_227.TextWrapped = true
                r6_227.Size = UDim2.new(1, 0, 1, 0)
                r6_227.TextYAlignment = "Top"
                r6_227.BackgroundTransparency = 1
                r6_227.TextStrokeTransparency = 0.5
                r6_227.TextColor3 = Color3.fromRGB(255, 174, 0)
                r6_227.Text = r4_227.Name .. " \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_227.Handle.Position)).Magnitude / 3) .. " Distance"
              else
                r4_227.Handle["NameEsp" .. Number].TextLabel.Text = r4_227.Name .. " " .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_227.Handle.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_227.Handle:FindFirstChild("NameEsp" .. Number) then
              r4_227.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
          end
        end
        for r3_227, r4_227 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
          if r4_227:IsA("Tool") then
            if RealFruitESP then
              if not r4_227.Handle:FindFirstChild(("NameEsp" .. Number)) then
                local r5_227 = Instance.new("BillboardGui", r4_227.Handle)
                r5_227.Name = "NameEsp" .. Number
                r5_227.ExtentsOffset = Vector3.new(0, 1, 0)
                r5_227.Size = UDim2.new(1, 200, 1, 30)
                r5_227.Adornee = r4_227.Handle
                r5_227.AlwaysOnTop = true
                local r6_227 = Instance.new("TextLabel", r5_227)
                r6_227.Font = Enum.Font.GothamSemibold
                r6_227.FontSize = "Size14"
                r6_227.TextWrapped = true
                r6_227.Size = UDim2.new(1, 0, 1, 0)
                r6_227.TextYAlignment = "Top"
                r6_227.BackgroundTransparency = 1
                r6_227.TextStrokeTransparency = 0.5
                r6_227.TextColor3 = Color3.fromRGB(251, 255, 0)
                r6_227.Text = r4_227.Name .. " \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_227.Handle.Position)).Magnitude / 3) .. " Distance"
              else
                r4_227.Handle["NameEsp" .. Number].TextLabel.Text = r4_227.Name .. " " .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_227.Handle.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_227.Handle:FindFirstChild("NameEsp" .. Number) then
              r4_227.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
          end
        end
      end
      function UpdateIslandESP()
        -- line: [0, 0] id: 425
        for r3_425, r4_425 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 426
            if IslandESP and r4_425.Name ~= "Sea" then
              if not r4_425:FindFirstChild("NameEsp") then
                local r0_426 = Instance.new("BillboardGui", r4_425)
                r0_426.Name = "NameEsp"
                r0_426.ExtentsOffset = Vector3.new(0, 1, 0)
                r0_426.Size = UDim2.new(1, 200, 1, 30)
                r0_426.Adornee = r4_425
                r0_426.AlwaysOnTop = true
                local r1_426 = Instance.new("TextLabel", r0_426)
                r1_426.Font = "GothamBold"
                r1_426.FontSize = "Size14"
                r1_426.TextWrapped = true
                r1_426.Size = UDim2.new(1, 0, 1, 0)
                r1_426.TextYAlignment = "Top"
                r1_426.BackgroundTransparency = 1
                r1_426.TextStrokeTransparency = 0.5
                r1_426.TextColor3 = Color3.fromRGB(7, 236, 240)
              else
                r4_425.NameEsp.TextLabel.Text = r4_425.Name .. "   \n" .. r8_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_425.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_425:FindFirstChild("NameEsp") then
              r4_425:FindFirstChild("NameEsp"):Destroy()
            end
          end)
          -- close: r3_425
        end
      end
      function isnil(r0_176)
        -- line: [0, 0] id: 176
        return r0_176 == nil
      end
      local function r9_4(r0_177)
        -- line: [0, 0] id: 177
        return math.floor(tonumber(r0_177) + 0.5)
      end
      Number = math.random(1, 1000000)
      function UpdatePlayerChams()
        -- line: [0, 0] id: 387
        for r3_387, r4_387 in pairs(game:GetService("Players"):GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 388
            if not isnil(r4_387.Character) then
              if ESPPlayer then
                if not isnil(r4_387.Character.Head) and not r4_387.Character.Head:FindFirstChild(("NameEsp" .. Number)) then
                  local r0_388 = Instance.new("BillboardGui", r4_387.Character.Head)
                  r0_388.Name = "NameEsp" .. Number
                  r0_388.ExtentsOffset = Vector3.new(0, 1, 0)
                  r0_388.Size = UDim2.new(1, 200, 1, 30)
                  r0_388.Adornee = r4_387.Character.Head
                  r0_388.AlwaysOnTop = true
                  local r1_388 = Instance.new("TextLabel", r0_388)
                  r1_388.Font = Enum.Font.GothamSemibold
                  r1_388.FontSize = "Size14"
                  r1_388.TextWrapped = true
                  r1_388.Text = r4_387.Name .. " \n" .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_387.Character.Head.Position)).Magnitude / 3) .. " Distance"
                  r1_388.Size = UDim2.new(1, 0, 1, 0)
                  r1_388.TextYAlignment = "Top"
                  r1_388.BackgroundTransparency = 1
                  r1_388.TextStrokeTransparency = 0.5
                  if r4_387.Team == game.Players.LocalPlayer.Team then
                    r1_388.TextColor3 = Color3.new(0, 255, 0)
                  else
                    r1_388.TextColor3 = Color3.new(255, 0, 0)
                  end
                else
                  r4_387.Character.Head["NameEsp" .. Number].TextLabel.Text = r4_387.Name .. " | " .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_387.Character.Head.Position)).Magnitude / 3) .. " Distance\nHealth : " .. r9_4(r4_387.Character.Humanoid.Health * 100 / r4_387.Character.Humanoid.MaxHealth) .. "%"
                end
              elseif r4_387.Character.Head:FindFirstChild("NameEsp" .. Number) then
                r4_387.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
              end
            end
          end)
          -- close: r3_387
        end
      end
      function UpdateChestChams()
        -- line: [0, 0] id: 170
        for r3_170, r4_170 in pairs(game.Workspace:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 171
            if string.find(r4_170.Name, "Chest") and r4_170:FindFirstChild("NameEsp" .. Number) then
              r4_170:FindFirstChild("NameEsp" .. Number):Destroy()
            end
            -- warn: not visited block [4, 5, 6, 7, 8, 9, 10]
            -- block#4:
            -- r0_171 = Instance.new("BillboardGui", _u0)
            -- r0_171.Name = "NameEsp" .. Number
            -- r0_171.ExtentsOffset = Vector3.new(0, 1, 0)
            -- r0_171.Size = UDim2.new(1, 200, 1, 30)
            -- r0_171.Adornee = _u0
            -- r0_171.AlwaysOnTop = true
            -- r1_171 = Instance.new("TextLabel", r0_171)
            -- r1_171.Font = Enum.Font.GothamSemibold
            -- r1_171.FontSize = "Size14"
            -- r1_171.TextWrapped = true
            -- r1_171.Size = UDim2.new(1, 0, 1, 0)
            -- r1_171.TextYAlignment = "Top"
            -- r1_171.BackgroundTransparency = 1
            -- r1_171.TextStrokeTransparency = 0.5
            -- if _u0.Name == "Chest1"
            -- block#5:
            -- r1_171.TextColor3 = Color3.fromRGB(109, 109, 109)
            -- r1_171.Text = "Chest 1" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
            -- block#6:
            -- if _u0.Name == "Chest2"
            -- block#7:
            -- r1_171.TextColor3 = Color3.fromRGB(173, 158, 21)
            -- r1_171.Text = "Chest 2" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
            -- block#8:
            -- if _u0.Name == "Chest3"
            -- block#9:
            -- r1_171.TextColor3 = Color3.fromRGB(85, 255, 255)
            -- r1_171.Text = "Chest 3" .. " \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
            -- goto label_214
            -- block#10:
            -- _u0["NameEsp" .. Number].TextLabel.Text = _u0.Name .. "   \n" .. _u1(((game:GetService("Players").LocalPlayer.Character.Head.Position - _u0.Position)).Magnitude / 3) .. " Distance"
            -- goto label_214
          end)
          -- close: r3_170
        end
      end
      function UpdateDevilChams()
        -- line: [0, 0] id: 172
        for r3_172, r4_172 in pairs(game.Workspace:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 173
            if DevilFruitESP and string.find(r4_172.Name, "Fruit") then
              if not r4_172.Handle:FindFirstChild(("NameEsp" .. Number)) then
                local r0_173 = Instance.new("BillboardGui", r4_172.Handle)
                r0_173.Name = "NameEsp" .. Number
                r0_173.ExtentsOffset = Vector3.new(0, 1, 0)
                r0_173.Size = UDim2.new(1, 200, 1, 30)
                r0_173.Adornee = r4_172.Handle
                r0_173.AlwaysOnTop = true
                local r1_173 = Instance.new("TextLabel", r0_173)
                r1_173.Font = Enum.Font.GothamSemibold
                r1_173.FontSize = "Size14"
                r1_173.TextWrapped = true
                r1_173.Size = UDim2.new(1, 0, 1, 0)
                r1_173.TextYAlignment = "Top"
                r1_173.BackgroundTransparency = 1
                r1_173.TextStrokeTransparency = 0.5
                r1_173.TextColor3 = Color3.fromRGB(255, 255, 255)
                r1_173.Text = r4_172.Name .. " \n" .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_172.Handle.Position)).Magnitude / 3) .. " Distance"
              else
                r4_172.Handle["NameEsp" .. Number].TextLabel.Text = r4_172.Name .. "   \n" .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_172.Handle.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_172.Handle:FindFirstChild("NameEsp" .. Number) then
              r4_172.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
          end)
          -- close: r3_172
        end
      end
      function UpdateFlowerChams()
        -- line: [0, 0] id: 361
        for r3_361, r4_361 in pairs(game.Workspace:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 362
            if r4_361.Name == "Flower2" or r4_361.Name == "Flower1" then
              if FlowerESP then
                if not r4_361:FindFirstChild(("NameEsp" .. Number)) then
                  local r0_362 = Instance.new("BillboardGui", r4_361)
                  r0_362.Name = "NameEsp" .. Number
                  r0_362.ExtentsOffset = Vector3.new(0, 1, 0)
                  r0_362.Size = UDim2.new(1, 200, 1, 30)
                  r0_362.Adornee = r4_361
                  r0_362.AlwaysOnTop = true
                  local r1_362 = Instance.new("TextLabel", r0_362)
                  r1_362.Font = Enum.Font.GothamSemibold
                  r1_362.FontSize = "Size14"
                  r1_362.TextWrapped = true
                  r1_362.Size = UDim2.new(1, 0, 1, 0)
                  r1_362.TextYAlignment = "Top"
                  r1_362.BackgroundTransparency = 1
                  r1_362.TextStrokeTransparency = 0.5
                  r1_362.TextColor3 = Color3.fromRGB(255, 0, 0)
                  if r4_361.Name == "Flower1" then
                    r1_362.Text = "Blue Flower" .. " \n" .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_361.Position)).Magnitude / 3) .. " Distance"
                    r1_362.TextColor3 = Color3.fromRGB(0, 0, 255)
                  end
                  if r4_361.Name == "Flower2" then
                    r1_362.Text = "Red Flower" .. " \n" .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_361.Position)).Magnitude / 3) .. " Distance"
                    r1_362.TextColor3 = Color3.fromRGB(255, 0, 0)
                  end
                else
                  r4_361["NameEsp" .. Number].TextLabel.Text = r4_361.Name .. "   \n" .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_361.Position)).Magnitude / 3) .. " Distance"
                end
              elseif r4_361:FindFirstChild("NameEsp" .. Number) then
                r4_361:FindFirstChild("NameEsp" .. Number):Destroy()
              end
            end
          end)
          -- close: r3_361
        end
      end
      function UpdateRealFruitChams()
        -- line: [0, 0] id: 178
        for r3_178, r4_178 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
          if r4_178:IsA("Tool") then
            if RealFruitESP then
              if not r4_178.Handle:FindFirstChild(("NameEsp" .. Number)) then
                local r5_178 = Instance.new("BillboardGui", r4_178.Handle)
                r5_178.Name = "NameEsp" .. Number
                r5_178.ExtentsOffset = Vector3.new(0, 1, 0)
                r5_178.Size = UDim2.new(1, 200, 1, 30)
                r5_178.Adornee = r4_178.Handle
                r5_178.AlwaysOnTop = true
                local r6_178 = Instance.new("TextLabel", r5_178)
                r6_178.Font = Enum.Font.GothamSemibold
                r6_178.FontSize = "Size14"
                r6_178.TextWrapped = true
                r6_178.Size = UDim2.new(1, 0, 1, 0)
                r6_178.TextYAlignment = "Top"
                r6_178.BackgroundTransparency = 1
                r6_178.TextStrokeTransparency = 0.5
                r6_178.TextColor3 = Color3.fromRGB(255, 0, 0)
                r6_178.Text = r4_178.Name .. " \n" .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_178.Handle.Position)).Magnitude / 3) .. " Distance"
              else
                r4_178.Handle["NameEsp" .. Number].TextLabel.Text = r4_178.Name .. " " .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_178.Handle.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_178.Handle:FindFirstChild("NameEsp" .. Number) then
              r4_178.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
          end
        end
        for r3_178, r4_178 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
          if r4_178:IsA("Tool") then
            if RealFruitESP then
              if not r4_178.Handle:FindFirstChild(("NameEsp" .. Number)) then
                local r5_178 = Instance.new("BillboardGui", r4_178.Handle)
                r5_178.Name = "NameEsp" .. Number
                r5_178.ExtentsOffset = Vector3.new(0, 1, 0)
                r5_178.Size = UDim2.new(1, 200, 1, 30)
                r5_178.Adornee = r4_178.Handle
                r5_178.AlwaysOnTop = true
                local r6_178 = Instance.new("TextLabel", r5_178)
                r6_178.Font = Enum.Font.GothamSemibold
                r6_178.FontSize = "Size14"
                r6_178.TextWrapped = true
                r6_178.Size = UDim2.new(1, 0, 1, 0)
                r6_178.TextYAlignment = "Top"
                r6_178.BackgroundTransparency = 1
                r6_178.TextStrokeTransparency = 0.5
                r6_178.TextColor3 = Color3.fromRGB(255, 174, 0)
                r6_178.Text = r4_178.Name .. " \n" .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_178.Handle.Position)).Magnitude / 3) .. " Distance"
              else
                r4_178.Handle["NameEsp" .. Number].TextLabel.Text = r4_178.Name .. " " .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_178.Handle.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_178.Handle:FindFirstChild("NameEsp" .. Number) then
              r4_178.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
          end
        end
        for r3_178, r4_178 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
          if r4_178:IsA("Tool") then
            if RealFruitESP then
              if not r4_178.Handle:FindFirstChild(("NameEsp" .. Number)) then
                local r5_178 = Instance.new("BillboardGui", r4_178.Handle)
                r5_178.Name = "NameEsp" .. Number
                r5_178.ExtentsOffset = Vector3.new(0, 1, 0)
                r5_178.Size = UDim2.new(1, 200, 1, 30)
                r5_178.Adornee = r4_178.Handle
                r5_178.AlwaysOnTop = true
                local r6_178 = Instance.new("TextLabel", r5_178)
                r6_178.Font = Enum.Font.GothamSemibold
                r6_178.FontSize = "Size14"
                r6_178.TextWrapped = true
                r6_178.Size = UDim2.new(1, 0, 1, 0)
                r6_178.TextYAlignment = "Top"
                r6_178.BackgroundTransparency = 1
                r6_178.TextStrokeTransparency = 0.5
                r6_178.TextColor3 = Color3.fromRGB(251, 255, 0)
                r6_178.Text = r4_178.Name .. " \n" .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_178.Handle.Position)).Magnitude / 3) .. " Distance"
              else
                r4_178.Handle["NameEsp" .. Number].TextLabel.Text = r4_178.Name .. " " .. r9_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_178.Handle.Position)).Magnitude / 3) .. " Distance"
              end
            elseif r4_178.Handle:FindFirstChild("NameEsp" .. Number) then
              r4_178.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
          end
        end
      end
      spawn(function()
        -- line: [0, 0] id: 85
        while wait() do
          pcall(function()
            -- line: [0, 0] id: 86
            if MobESP then
              for r3_86, r4_86 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if r4_86:FindFirstChild("HumanoidRootPart") then
                  if not r4_86:FindFirstChild("MobEap") then
                    local r5_86 = Instance.new("BillboardGui")
                    local r6_86 = Instance.new("TextLabel")
                    r5_86.Parent = r4_86
                    r5_86.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    r5_86.Active = true
                    r5_86.Name = "MobEap"
                    r5_86.AlwaysOnTop = true
                    r5_86.LightInfluence = 1
                    r5_86.Size = UDim2.new(0, 200, 0, 50)
                    r5_86.StudsOffset = Vector3.new(0, 2.5, 0)
                    r6_86.Parent = r5_86
                    r6_86.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    r6_86.BackgroundTransparency = 1
                    r6_86.Size = UDim2.new(0, 200, 0, 50)
                    r6_86.Font = Enum.Font.GothamBold
                    r6_86.TextColor3 = Color3.fromRGB(7, 236, 240)
                    r6_86.Text.Size = 35
                  end
                  r4_86.MobEap.TextLabel.Text = r4_86.Name .. " - " .. math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_86.HumanoidRootPart.Position).Magnitude) .. " Distance"
                end
              end
            else
              for r3_86, r4_86 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if r4_86:FindFirstChild("MobEap") then
                  r4_86.MobEap:Destroy()
                end
              end
            end
          end)
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 367
        while wait() do
          pcall(function()
            -- line: [0, 0] id: 368
            if SeaESP then
              for r3_368, r4_368 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if r4_368:FindFirstChild("HumanoidRootPart") then
                  if not r4_368:FindFirstChild("Seaesps") then
                    local r5_368 = Instance.new("BillboardGui")
                    local r6_368 = Instance.new("TextLabel")
                    r5_368.Parent = r4_368
                    r5_368.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    r5_368.Active = true
                    r5_368.Name = "Seaesps"
                    r5_368.AlwaysOnTop = true
                    r5_368.LightInfluence = 1
                    r5_368.Size = UDim2.new(0, 200, 0, 50)
                    r5_368.StudsOffset = Vector3.new(0, 2.5, 0)
                    r6_368.Parent = r5_368
                    r6_368.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    r6_368.BackgroundTransparency = 1
                    r6_368.Size = UDim2.new(0, 200, 0, 50)
                    r6_368.Font = Enum.Font.GothamBold
                    r6_368.TextColor3 = Color3.fromRGB(7, 236, 240)
                    r6_368.Text.Size = 35
                  end
                  r4_368.Seaesps.TextLabel.Text = r4_368.Name .. " - " .. math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_368.HumanoidRootPart.Position).Magnitude) .. " Distance"
                end
              end
            else
              for r3_368, r4_368 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                if r4_368:FindFirstChild("Seaesps") then
                  r4_368.Seaesps:Destroy()
                end
              end
            end
          end)
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 347
        while wait() do
          pcall(function()
            -- line: [0, 0] id: 348
            if NpcESP then
              for r3_348, r4_348 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                if r4_348:FindFirstChild("HumanoidRootPart") then
                  if not r4_348:FindFirstChild("NpcEspes") then
                    local r5_348 = Instance.new("BillboardGui")
                    local r6_348 = Instance.new("TextLabel")
                    r5_348.Parent = r4_348
                    r5_348.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                    r5_348.Active = true
                    r5_348.Name = "NpcEspes"
                    r5_348.AlwaysOnTop = true
                    r5_348.LightInfluence = 1
                    r5_348.Size = UDim2.new(0, 200, 0, 50)
                    r5_348.StudsOffset = Vector3.new(0, 2.5, 0)
                    r6_348.Parent = r5_348
                    r6_348.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    r6_348.BackgroundTransparency = 1
                    r6_348.Size = UDim2.new(0, 200, 0, 50)
                    r6_348.Font = Enum.Font.GothamBold
                    r6_348.TextColor3 = Color3.fromRGB(7, 236, 240)
                    r6_348.Text.Size = 35
                  end
                  r4_348.NpcEspes.TextLabel.Text = r4_348.Name .. " - " .. math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_348.HumanoidRootPart.Position).Magnitude) .. " Distance"
                end
              end
            else
              for r3_348, r4_348 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                if r4_348:FindFirstChild("NpcEspes") then
                  r4_348.NpcEspes:Destroy()
                end
              end
            end
          end)
        end
      end)
      function isnil(r0_55)
        -- line: [0, 0] id: 55
        return r0_55 == nil
      end
      local function r10_4(r0_302)
        -- line: [0, 0] id: 302
        return math.floor(tonumber(r0_302) + 0.5)
      end
      Number = math.random(1, 1000000)
      function UpdateIslandMirageESP()
        -- line: [0, 0] id: 307
        for r3_307, r4_307 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 308
            if MirageIslandESP and r4_307.Name == "Mirage Island" then
              if not r4_307:FindFirstChild("NameEsp") then
                local r0_308 = Instance.new("BillboardGui", r4_307)
                r0_308.Name = "NameEsp"
                r0_308.ExtentsOffset = Vector3.new(0, 1, 0)
                r0_308.Size = UDim2.new(1, 200, 1, 30)
                r0_308.Adornee = r4_307
                r0_308.AlwaysOnTop = true
                local r1_308 = Instance.new("TextLabel", r0_308)
                r1_308.Font = "Code"
                r1_308.FontSize = "Size14"
                r1_308.TextWrapped = true
                r1_308.Size = UDim2.new(1, 0, 1, 0)
                r1_308.TextYAlignment = "Top"
                r1_308.BackgroundTransparency = 1
                r1_308.TextStrokeTransparency = 0.5
                r1_308.TextColor3 = Color3.fromRGB(80, 245, 245)
              else
                r4_307.NameEsp.TextLabel.Text = r4_307.Name .. "   \n" .. r10_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_307.Position)).Magnitude / 3) .. " M"
              end
            elseif r4_307:FindFirstChild("NameEsp") then
              r4_307:FindFirstChild("NameEsp"):Destroy()
            end
          end)
          -- close: r3_307
        end
      end
      function isnil(r0_257)
        -- line: [0, 0] id: 257
        return r0_257 == nil
      end
      local function r11_4(r0_6)
        -- line: [0, 0] id: 6
        return math.floor(tonumber(r0_6) + 0.5)
      end
      Number = math.random(1, 1000000)
      function UpdateAfdESP()
        -- line: [0, 0] id: 91
        for r3_91, r4_91 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 92
            if AfdESP and r4_91.Name == "Advanced Fruit Dealer" then
              if not r4_91:FindFirstChild("NameEsp") then
                local r0_92 = Instance.new("BillboardGui", r4_91)
                r0_92.Name = "NameEsp"
                r0_92.ExtentsOffset = Vector3.new(0, 1, 0)
                r0_92.Size = UDim2.new(1, 200, 1, 30)
                r0_92.Adornee = r4_91
                r0_92.AlwaysOnTop = true
                local r1_92 = Instance.new("TextLabel", r0_92)
                r1_92.Font = "Code"
                r1_92.FontSize = "Size14"
                r1_92.TextWrapped = true
                r1_92.Size = UDim2.new(1, 0, 1, 0)
                r1_92.TextYAlignment = "Top"
                r1_92.BackgroundTransparency = 1
                r1_92.TextStrokeTransparency = 0.5
                r1_92.TextColor3 = Color3.fromRGB(80, 245, 245)
              else
                r4_91.NameEsp.TextLabel.Text = r4_91.Name .. "   \n" .. r11_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_91.Position)).Magnitude / 3) .. " M"
              end
            elseif r4_91:FindFirstChild("NameEsp") then
              r4_91:FindFirstChild("NameEsp"):Destroy()
            end
          end)
          -- close: r3_91
        end
      end
      function UpdateAuraESP()
        -- line: [0, 0] id: 127
        for r3_127, r4_127 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 128
            if AuraESP and r4_127.Name == "Master of Enhancement" then
              if not r4_127:FindFirstChild("NameEsp") then
                local r0_128 = Instance.new("BillboardGui", r4_127)
                r0_128.Name = "NameEsp"
                r0_128.ExtentsOffset = Vector3.new(0, 1, 0)
                r0_128.Size = UDim2.new(1, 200, 1, 30)
                r0_128.Adornee = r4_127
                r0_128.AlwaysOnTop = true
                local r1_128 = Instance.new("TextLabel", r0_128)
                r1_128.Font = "Code"
                r1_128.FontSize = "Size14"
                r1_128.TextWrapped = true
                r1_128.Size = UDim2.new(1, 0, 1, 0)
                r1_128.TextYAlignment = "Top"
                r1_128.BackgroundTransparency = 1
                r1_128.TextStrokeTransparency = 0.5
                r1_128.TextColor3 = Color3.fromRGB(80, 245, 245)
              else
                r4_127.NameEsp.TextLabel.Text = r4_127.Name .. "   \n" .. r11_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_127.Position)).Magnitude / 3) .. " M"
              end
            elseif r4_127:FindFirstChild("NameEsp") then
              r4_127:FindFirstChild("NameEsp"):Destroy()
            end
          end)
          -- close: r3_127
        end
      end
      function UpdateLSDESP()
        -- line: [0, 0] id: 37
        for r3_37, r4_37 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 38
            if LADESP and r4_37.Name == "Legendary Sword Dealer" then
              if not r4_37:FindFirstChild("NameEsp") then
                local r0_38 = Instance.new("BillboardGui", r4_37)
                r0_38.Name = "NameEsp"
                r0_38.ExtentsOffset = Vector3.new(0, 1, 0)
                r0_38.Size = UDim2.new(1, 200, 1, 30)
                r0_38.Adornee = r4_37
                r0_38.AlwaysOnTop = true
                local r1_38 = Instance.new("TextLabel", r0_38)
                r1_38.Font = "Code"
                r1_38.FontSize = "Size14"
                r1_38.TextWrapped = true
                r1_38.Size = UDim2.new(1, 0, 1, 0)
                r1_38.TextYAlignment = "Top"
                r1_38.BackgroundTransparency = 1
                r1_38.TextStrokeTransparency = 0.5
                r1_38.TextColor3 = Color3.fromRGB(80, 245, 245)
              else
                r4_37.NameEsp.TextLabel.Text = r4_37.Name .. "   \n" .. r11_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_37.Position)).Magnitude / 3) .. " M"
              end
            elseif r4_37:FindFirstChild("NameEsp") then
              r4_37:FindFirstChild("NameEsp"):Destroy()
            end
          end)
          -- close: r3_37
        end
      end
      function UpdateGeaESP()
        -- line: [0, 0] id: 295
        for r3_295, r4_295 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
          pcall(function()
            -- line: [0, 0] id: 296
            if GearESP and r4_295.Name == "MeshPart" then
              if not r4_295:FindFirstChild("NameEsp") then
                local r0_296 = Instance.new("BillboardGui", r4_295)
                r0_296.Name = "NameEsp"
                r0_296.ExtentsOffset = Vector3.new(0, 1, 0)
                r0_296.Size = UDim2.new(1, 200, 1, 30)
                r0_296.Adornee = r4_295
                r0_296.AlwaysOnTop = true
                local r1_296 = Instance.new("TextLabel", r0_296)
                r1_296.Font = "Code"
                r1_296.FontSize = "Size14"
                r1_296.TextWrapped = true
                r1_296.Size = UDim2.new(1, 0, 1, 0)
                r1_296.TextYAlignment = "Top"
                r1_296.BackgroundTransparency = 1
                r1_296.TextStrokeTransparency = 0.5
                r1_296.TextColor3 = Color3.fromRGB(80, 245, 245)
              else
                r4_295.NameEsp.TextLabel.Text = r4_295.Name .. "   \n" .. r11_4(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_295.Position)).Magnitude / 3) .. " M"
              end
            elseif r4_295:FindFirstChild("NameEsp") then
              r4_295:FindFirstChild("NameEsp"):Destroy()
            end
          end)
          -- close: r3_295
        end
      end
      function Tween2(r0_449)
        -- line: [0, 0] id: 449
        local r1_449 = (r0_449.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if r1_449 >= 1 then
          Speed = 300
        end
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(r1_449 / Speed, Enum.EasingStyle.Linear), {
          CFrame = r0_449,
        }):Play()
        if _G.CancelTween2 then
          game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(r1_449 / Speed, Enum.EasingStyle.Linear), {
            CFrame = r0_449,
          }):Cancel()
        end
        _G.Clip2 = true
        wait(r1_449 / Speed)
        _G.Clip2 = false
      end
      function Com(r0_335, ...)
        -- line: [0, 0] id: 335
        local r2_335 = game:GetService("ReplicatedStorage").Remotes:FindFirstChild("Comm" .. r0_335)
        if r2_335:IsA("RemoteEvent") then
          r2_335:FireServer(...)
        elseif r2_335:IsA("RemoteFunction") then
          r2_335:InvokeServer(...)
        end
      end
      function BTP(r0_16)
        -- line: [0, 0] id: 16
        game.Players.LocalPlayer.Character.Head:Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_16
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_16
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
      end
      function BTPZ(r0_201)
        -- line: [0, 0] id: 201
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_201
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_201
      end
      function GetIsLand(...)
        -- line: [0, 0] id: 52
        local r1_52 = {
          ...
        }
        local r2_52 = r1_52[1]
        local r3_52 = nil
        if type(r2_52) == "vector" then
          r3_52 = r2_52
        elseif type(r2_52) == "userdata" then
          r3_52 = r2_52.Position
        elseif type(r2_52) == "number" then
          r3_52 = CFrame.new(unpack(r1_52)).p
        end
        local r4_52 = nil
        local r5_52 = math.huge
        if game.Players.LocalPlayer.Team then
          for r9_52, r10_52 in pairs(game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(game.Players.LocalPlayer.Team)):GetChildren()) do
            local r11_52 = (r3_52 - r10_52:GetModelCFrame().p).Magnitude
            if r11_52 < r5_52 then
              r5_52 = r11_52
              r4_52 = r10_52.Name
            end
          end
          if r4_52 then
            return r4_52
          end
        end
      end
      function toTarget(...)
        -- line: [0, 0] id: 45
        local r1_45 = {
          ...
        }
        local r2_45 = r1_45[1]
        local r3_45 = nil
        if type(r2_45) == "vector" then
          r3_45 = CFrame.new(r2_45)
        elseif type(r2_45) == "userdata" then
          r3_45 = r2_45
        elseif type(r2_45) == "number" then
          r3_45 = CFrame.new(unpack(r1_45))
        end
        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then
          if tween then
            tween:Cancel()
          end
          repeat
            wait(_G.Fast_Delay)
          until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
          wait(0.2)
        end
        local r4_45 = {}
        local r5_45 = (r3_45.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        if r5_45 < 1000 then
          Speed = 315
        elseif r5_45 >= 1000 then
          Speed = 300
        end
        if BypassTP and 3000 < r5_45 and not AutoNextIsland and not game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") and not game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and not game.Players.LocalPlayer.Backpack:FindFirstChild("God\'s Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God\'s Chalice") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") and not game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") and not game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") and Name ~= "Fishman Commando" and Name ~= "Fishman Warrior" then
          pcall(function()
            -- line: [0, 0] id: 49
            tween:Cancel()
            fkwarp = false
            if game:GetService("Players").LocalPlayer.Data:FindFirstChild("SpawnPoint").Value == tostring(GetIsLand(r3_45)) then
              wait(0.1)
              Com("F_", "TeleportToSpawn")
            elseif game:GetService("Players").LocalPlayer.Data:FindFirstChild("LastSpawnPoint").Value == tostring(GetIsLand(r3_45)) then
              game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
              wait(0.1)
              repeat
                wait(_G.Fast_Delay)
              until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
            else
              if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                if fkwarp == false then
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r3_45
                end
                fkwarp = true
              end
              wait(0.08)
              game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
              repeat
                wait(_G.Fast_Delay)
              until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
              wait(0.1)
              Com("F_", "SetSpawnPoint")
            end
            wait(0.2)
          end)
        end
        local r6_45 = game:service("TweenService")
        local r7_45 = TweenInfo.new(((r3_45.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)).Magnitude / Speed, Enum.EasingStyle.Linear)
        local r8_45, r9_45 = pcall(function()
          -- line: [0, 0] id: 48
          tween = r6_45:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, r7_45, {
            CFrame = r3_45,
          })
          tween:Play()
        end)
        function r4_45.Stop(r0_46)
          -- line: [0, 0] id: 46
          tween:Cancel()
        end
        function r4_45.Wait(r0_47)
          -- line: [0, 0] id: 47
          tween.Completed:Wait()
        end
        return r4_45
      end
      TweenSpeed = 340
      function Tween(r0_324)
        -- line: [0, 0] id: 324
        local r1_324 = (r0_324.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if r1_324 >= 1 then
          Speed = TweenSpeed
        end
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(r1_324 / Speed, Enum.EasingStyle.Linear), {
          CFrame = r0_324,
        }):Play()
        if _G.StopTween then
          game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(r1_324 / Speed, Enum.EasingStyle.Linear), {
            CFrame = r0_324,
          }):Cancel()
        end
      end
      function CancelTween(r0_131)
        -- line: [0, 0] id: 131
        if not r0_131 then
          _G.StopTween = true
          wait()
          Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
          wait()
          _G.StopTween = false
        end
      end
      function toTargetP(r0_208)
        -- line: [0, 0] id: 208
        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
          tween:Cancel()
          while true do
            wait(_G.Fast_Delay)
            if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
              local r1_208 = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health
              if r1_208 > 0 then
                break
              end
            end
          end
          wait(7)
          return 
        end
        if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - r0_208.Position).Magnitude <= 150 then
          pcall(function()
            -- line: [0, 0] id: 210
            tween:Cancel()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = r0_208
          end)
        end
        tween = game:service("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - r0_208.Position)).Magnitude / 325, Enum.EasingStyle.Linear), {
          CFrame = r0_208,
        })
        tween:Play()
        return {
          Stop = function(r0_209)
            -- line: [0, 0] id: 209
            tween:Cancel()
          end,
        }
      end
      function TweenShip(r0_163)
        -- line: [0, 0] id: 163
        tween = game:service("TweenService"):Create(game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat, TweenInfo.new(((game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat.CFrame.Position - r0_163.Position)).Magnitude / 300, Enum.EasingStyle.Linear), {
          CFrame = r0_163,
        })
        tween:Play()
        return {
          Stop = function(r0_164)
            -- line: [0, 0] id: 164
            tween:Cancel()
          end,
        }
      end
      function TweenBoat(r0_339)
        -- line: [0, 0] id: 339
        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
          tween:Cancel()
          while true do
            wait(_G.Fast_Delay)
            if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
              local r1_339 = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health
              if r1_339 > 0 then
                break
              end
            end
          end
          wait(7)
          return 
        end
        tween = game:service("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - r0_339.Position)).Magnitude / 325, Enum.EasingStyle.Linear), {
          CFrame = r0_339,
        })
        tween:Play()
        return {
          Stop = function(r0_340)
            -- line: [0, 0] id: 340
            tween:Cancel()
          end,
        }
      end
      function EquipTool(r0_380)
        -- line: [0, 0] id: 380
        if game.Players.LocalPlayer.Backpack:FindFirstChild(r0_380) then
          local r1_380 = game.Players.LocalPlayer.Backpack:FindFirstChild(r0_380)
          wait(0.5)
          game.Players.LocalPlayer.Character.Humanoid:EquipTool(r1_380)
        end
      end
      spawn(function()
        -- line: [0, 0] id: 93
        local r0_93 = getrawmetatable(game)
        local r1_93 = r0_93.__namecall
        setreadonly(r0_93, false)
        r0_93.__namecall = newcclosure(function(...)
          -- line: [0, 0] id: 94
          local r1_94 = getnamecallmethod()
          local r2_94 = {
            ...
          }
          if tostring(r1_94) == "FireServer" and tostring(r2_94[1]) == "RemoteEvent" and tostring(r2_94[2]) ~= "true" and tostring(r2_94[2]) ~= "false" and _G.UseSkill then
            if type(r2_94[2]) == "vector" then
              r2_94[2] = PositionSkillMasteryDevilFruit
            else
              r2_94[2] = CFrame.new(PositionSkillMasteryDevilFruit)
            end
            return r1_93(unpack(r2_94))
          end
          return r1_93(...)
        end)
      end)
      spawn(function()
        -- line: [0, 0] id: 239
        pcall(function()
          -- line: [0, 0] id: 240
          while task.wait() do
            local r0_240 = pairs
            for r3_240, r4_240 in r0_240(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
              if r4_240:IsA("Tool") and r4_240:FindFirstChild("RemoteFunctionShoot") then
                CurrentEquipGun = r4_240.Name
              end
            end
          end
        end)
      end)
      spawn(function()
        -- line: [0, 0] id: 120
        while task.wait() do
          pcall(function()
            -- line: [0, 0] id: 121
            if not _G.TeleportIsland and not _G.AutoEvoRace and not AutoFarmChest and not _G.chestsea2 and not _G.chestsea3 and not _G.CastleRaid and not _G.CollectAzure and not _G.TweenToKitsune and not _G.AutoCandy and not _G.GhostShip and not _G.Ship and not _G.SailBoat and not _G.Auto_Holy_Torch and not _G.FindMirageIsland and not _G.TeleportPly and not _G.Tweenfruit and not _G.AutoFishCrew and not _G.AutoShark and not _G.AutoCakeV2 and not _G.AutoMysticIsland and not _G.AutoQuestRace and not _G.AutoBuyBoat and not _G.dao and not _G.AutoMirage and not AutoFarmAcient and not _G.AutoQuestRace and not Auto_Law and not _G.AutoAllBoss and not AutoTushita and not _G.AutoHolyTorch and not _G.AutoTerrorshark and not _G.farmpiranya and not _G.DriveMytic and not _G.AutoCakeV2V2 and not PirateShip and not _G.AutoSeaBeast and not _G.AutoNear and not _G.BossRaid and not _G.GrabChest and not AutoCitizen and not _G.Ectoplasm and not AutoEvoRace and not AutoBartilo and not AutoFactory and not BringChestz and not BringFruitz and not _G.AutoLevel and not _G.Clip2 and not AutoFarmNoQuest and not _G.AutoBone and not AutoFarmSelectMonsterQuest and not AutoFarmSelectMonsterNoQuest and not _G.AutoBoss and not AutoFarmBossQuest and not AutoFarmMasGun and not AutoFarmMasDevilFruit and not AutoFarmSelectArea and not AutoSecondSea and not AutoThirdSea and not AutoDeathStep and not AutoSuperhuman and not AutoSharkman and not AutoElectricClaw and not AutoDragonTalon and not AutoGodhuman and not AutoRengoku and not AutoBuddySword and not AutoPole and not AutoHallowSycthe and not AutoCavander and not AutoTushita and not AutoDarkDagger and not _G.CakePrince and not _G.AutoElite and not AutoRainbowHaki and not AutoSaber and not AutoFarmKen and not AutoKenHop and not AutoKenV2 and not _G.AutoKillPlayerMelee and not _G.AutoKillPlayerGun and not _G.AutoKillPlayerFruit and not AutoDungeon and not AutoNextIsland and not AutoAdvanceDungeon and not Musketeer and not RipIndra and not Auto_Serpent_Bow and not AutoTorch and not AutoSoulGuitar and not Auto_Cursed_Dual_Katana and not _G.AutoMaterial and not Auto_Quest_Yama_1 and not Auto_Quest_Yama_2 and not Auto_Quest_Yama_3 and not Auto_Quest_Tushita_1 and not Auto_Quest_Tushita_2 and not Auto_Quest_Tushita_3 and not _G.Factory and not _G.SwanGlasses and not AutoBartilo then
              if AutoEvoRace or _G.Ectoplasm then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                  local r0_121 = Instance.new("BodyVelocity")
                  r0_121.Name = "BodyClip"
                  r0_121.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                  r0_121.MaxForce = Vector3.new(100000, 100000, 100000)
                  r0_121.Velocity = Vector3.new(0, 0, 0)
                end
              else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
              end
            else
              goto label_353	-- block#102 is visited secondly
            end
          end)
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 373
        pcall(function()
          -- line: [0, 0] id: 374
          game:GetService("RunService").Stepped:Connect(function()
            -- line: [0, 0] id: 375
            if _G.TeleportIsland or _G.AutoEvoRace or _G.CastleRaid or AutoFarmChest or _G.CollectAzure or _G.TweenToKitsune or _G.AutoCandy or _G.GhostShip or _G.Ship or _G.SailBoat or _G.Auto_Holy_Torch or _G.Tweenfruit or _G.FindMirageIsland or _G.TeleportPly or _G.AutoFishCrew or _G.AutoShark or _G.AutoMysticIsland or _G.AutoCakeV2 or _G.AutoQuestRace or _G.AutoBuyBoat or _G.dao or AutoFarmAcient or _G.AutoMirage or Auto_Law or _G.AutoQuestRace or _G.AutoAllBoss or _G.AutoHolyTorch or AutoTushita or _G.farmpiranya or _G.AutoTerrorshark or _G.AutoNear or _G.AutoCakeV2V2 or PirateShip or _G.AutoSeaBeast or _G.DriveMytic or _G.BossRaid or _G.GrabChest or AutoCitizen or _G.Ectoplasm or AutoEvoRace or AutoBartilo or AutoFactory or BringChestz or BringFruitz or _G.AutoLevel or _G.Clip2 or AutoFarmNoQuest or _G.AutoBone or AutoFarmSelectMonsterQuest or AutoFarmSelectMonsterNoQuest or _G.AutoBoss or AutoFarmBossQuest or AutoFarmMasGun or AutoFarmMasDevilFruit or AutoFarmSelectArea or AutoSecondSea or AutoThirdSea or AutoDeathStep or AutoSuperhuman or AutoSharkman or AutoElectricClaw or AutoDragonTalon or AutoGodhuman or AutoRengoku or AutoBuddySword or AutoPole or AutoHallowSycthe or AutoCavander or AutoTushita or AutoDarkDagger or _G.CakePrince or _G.AutoElite or AutoRainbowHaki or AutoSaber or AutoFarmKen or AutoKenHop or AutoKenV2 or _G.AutoKillPlayerMelee or _G.AutoKillPlayerGun or _G.AutoKillPlayerFruit or AutoDungeon or AutoNextIsland or AutoAdvanceDungeon or Musketeer or RipIndra or Auto_Serpent_Bow or AutoTorch or AutoSoulGuitar or Auto_Cursed_Dual_Katana or _G.AutoMaterial or Auto_Quest_Yama_1 or Auto_Quest_Yama_2 or Auto_Quest_Yama_3 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or _G.Factory or _G.SwanGlasses or AutoBartilo or AutoEvoRace or _G.Ectoplasm then
              for r3_375, r4_375 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if r4_375:IsA("BasePart") then
                  r4_375.CanCollide = false
                end
              end
            end
          end)
        end)
      end)
      task.spawn(function()
        -- line: [0, 0] id: 132
        if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
          game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
            -- line: [0, 0] id: 133
            pcall(function()
              -- line: [0, 0] id: 134
              if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                game.Players.LocalPlayer.Character.Stun.Value = 0
              end
            end)
          end)
        end
      end)
      function CheckMaterial(r0_26)
        -- line: [0, 0] id: 26
        for r4_26, r5_26 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
          if type(r5_26) == "table" and r5_26.Type == "Material" and r5_26.Name == r0_26 then
            return r5_26.Count
          end
        end
        return 0
      end
      local r12_4 = game.Players.LocalPlayer
      local r14_4 = debug.getupvalues(require(r12_4.PlayerScripts.CombatFramework))[2]
      function GetCurrentBlade()
        -- line: [0, 0] id: 342
        local r1_342 = r14_4.activeController.blades[1]
        if not r1_342 then
          return 
        end
        while r1_342.Parent ~= game.Players.LocalPlayer.Character do
          r1_342 = r1_342.Parent
        end
        return r1_342
      end
      function AttackNoCoolDown()
        -- line: [0, 0] id: 20
        local r0_20 = r14_4.activeController
        for r4_20 = 1, 1, 1 do
          local r5_20 = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(r12_4.Character, {
            r12_4.Character.HumanoidRootPart
          }, 60)
          local r6_20 = {}
          local r7_20 = {}
          for r11_20, r12_20 in pairs(r5_20) do
            if r12_20.Parent:FindFirstChild("HumanoidRootPart") and not r7_20[r12_20.Parent] then
              table.insert(r6_20, r12_20.Parent.HumanoidRootPart)
              r7_20[r12_20.Parent] = true
            end
          end
          r5_20 = r6_20
          if #r5_20 > 0 then
            local r8_20 = debug.getupvalue(r0_20.attack, 5)
            local r9_20 = debug.getupvalue(r0_20.attack, 6)
            local r10_20 = debug.getupvalue(r0_20.attack, 4)
            local r11_20 = debug.getupvalue(r0_20.attack, 7)
            local r12_20 = (r8_20 * 798405 + r10_20 * 727595) % r9_20
            local r13_20 = r10_20 * 798405
            (function()
              -- line: [0, 0] id: 22
              r12_20 = (r12_20 * r9_20 + r13_20) % 1099511627776
              r8_20 = math.floor(r12_20 / r9_20)
              r10_20 = r12_20 - r8_20 * r9_20
            end)()
            r11_20 = r11_20 + 1
            debug.setupvalue(r0_20.attack, 5, r8_20)
            debug.setupvalue(r0_20.attack, 6, r9_20)
            debug.setupvalue(r0_20.attack, 4, r10_20)
            debug.setupvalue(r0_20.attack, 7, r11_20)
            pcall(function()
              -- line: [0, 0] id: 21
              for r3_21, r4_21 in pairs(r0_20.animator.anims.basic) do
                r4_21:Play()
              end
            end)
            if r12_4.Character:FindFirstChildOfClass("Tool") and r0_20.blades and r0_20.blades[1] then
              game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(GetCurrentBlade()))
              game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(r12_20 / 1099511627776 * 16777215), r11_20)
              game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", r5_20, r4_20, "")
            end
            -- close: r8_20
          end
        end
      end
      function NormalAttack()
        -- line: [0, 0] id: 392
        if not _G.NormalAttack then
          local r1_392 = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))[2]
          require(game.ReplicatedStorage.Util.CameraShaker):Stop()
          r1_392.activeController.attacking = false
          r1_392.activeController.timeToNextAttack = 0
          r1_392.activeController.hitboxMagnitude = 180
          game:GetService("VirtualUser"):CaptureController()
          game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
        end
      end
      function GetWeaponInventory(r0_264)
        -- line: [0, 0] id: 264
        for r4_264, r5_264 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
          if type(r5_264) == "table" and r5_264.Type == "Sword" and r5_264.Name == r0_264 then
            return true
          end
        end
        return false
      end
      Type1 = 1
      spawn(function()
        -- line: [0, 0] id: 146
        while wait(0.1) do
          local r0_146 = Type
          if r0_146 == 1 then
            r0_146 = CFrame.new(10, 40, 10)
            Pos = r0_146
          else
            r0_146 = Type
            if r0_146 == 2 then
              r0_146 = CFrame.new(-30, 10, -30)
              Pos = r0_146
            else
              r0_146 = Type
              if r0_146 == 3 then
                r0_146 = CFrame.new(10, 10, -40)
                Pos = r0_146
              else
                r0_146 = Type
                if r0_146 == 4 then
                  r0_146 = CFrame.new(-40, 10, 10)
                  Pos = r0_146
                end
              end
            end
          end
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 352
        while wait(0.1) do
          Type = 1
          wait(1)
          Type = 2
          wait(1)
          Type = 3
          wait(1)
          Type = 4
          wait(1)
        end
      end)
      function AutoHaki()
        -- line: [0, 0] id: 150
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
      end
      function to(r0_123)
        -- line: [0, 0] id: 123
        repeat
          wait(0.5)
          game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_123
          task.wait()
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_123
        until (r0_123.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
      end
      function to(r0_186)
        -- line: [0, 0] id: 186
        pcall(function()
          -- line: [0, 0] id: 187
          if 2000 <= (r0_186.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude and not Auto_Raid and 0 < game.Players.LocalPlayer.Character.Humanoid.Health then
            if NameMon == "FishmanQuest" then
              Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
              wait()
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            elseif Mon == "God\'s Guard" then
              Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
              wait()
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
            elseif NameMon == "SkyExp1Quest" then
              Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
              wait()
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            elseif NameMon == "ShipQuest1" then
              Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
              wait()
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            elseif NameMon == "ShipQuest2" then
              Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
              wait()
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            elseif NameMon == "FrostQuest" then
              Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
              wait()
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            else
              while true do
                wait(0.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_186
                wait(0.05)
                game.Players.LocalPlayer.Character.Head:Destroy()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_186
                if (r0_186.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2500 then
                  local r0_187 = game.Players.LocalPlayer.Character.Humanoid.Health
                  if r0_187 > 0 then
                    break
                  end
                end
              end
              wait()
            end
          end
        end)
      end
      if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
        game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
      end
      if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
        game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
      end
      local r15_4 = r4_4.Main:AddSection("Farming")
      local r17_4 = r4_4.Main:AddDropdown("DropdownDelayAttack", {
        Title = "Select Fast Attack",
        Description = "",
        Values = {
          "Normal Attack",
          "Fast Attack",
          "Super Fast Attack"
        },
        Multi = false,
        Default = 1,
      })
      local r20_4 = "SetValue"
      r20_4 = "Fast Attack"
      r17_4:[r20_4](r20_4)
      r20_4 = "OnChanged"
      function r20_4(r0_114)
        -- line: [0, 0] id: 114
        _G.FastAttackFaiFao_Mode = r0_114
        if _G.FastAttackFaiFao_Mode == "Fast Attack" then
          _G.Fast_Delay = 0.1
        elseif _G.FastAttackFaiFao_Mode == "Normal Attack" then
          _G.Fast_Delay = 0.15
        elseif _G.FastAttackFaiFao_Mode == "Super Fast Attack" then
          _G.Fast_Delay = 0
        end
      end
      r17_4:[r20_4](r20_4)
      local r18_4 = r4_4.Main:AddDropdown("DropdownSelectWeapon", {
        Title = "Weapon",
        Description = "",
        Values = {
          "Melee",
          "Sword",
          "Blox Fruit"
        },
        Multi = false,
        Default = 1,
      })
      local r21_4 = "SetValue"
      r21_4 = "Melee"
      r18_4:[r21_4](r21_4)
      r21_4 = "OnChanged"
      function r21_4(r0_107)
        -- line: [0, 0] id: 107
        ChooseWeapon = r0_107
      end
      r18_4:[r21_4](r21_4)
      task.spawn(function()
        -- line: [0, 0] id: 359
        while wait() do
          pcall(function()
            -- line: [0, 0] id: 360
            if ChooseWeapon == "Melee" then
              for r3_360, r4_360 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if r4_360.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(r4_360.Name)) then
                  SelectWeapon = r4_360.Name
                end
              end
            elseif ChooseWeapon == "Sword" then
              for r3_360, r4_360 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if r4_360.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(r4_360.Name)) then
                  SelectWeapon = r4_360.Name
                end
              end
            elseif ChooseWeapon == "Blox Fruit" then
              for r3_360, r4_360 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if r4_360.ToolTip == "Blox Fruit" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(r4_360.Name)) then
                  SelectWeapon = r4_360.Name
                end
              end
            else
              for r3_360, r4_360 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if r4_360.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(r4_360.Name)) then
                  SelectWeapon = r4_360.Name
                end
              end
            end
          end)
        end
      end)
      r21_4 = "AddToggle"
      r21_4 = "ToggleLevel"
      local r19_4 = r4_4.Main:[r21_4](r21_4, {
        Title = "Auto Level",
        Description = "",
        Default = false,
      })
      local r22_4 = "OnChanged"
      function r22_4(r0_175)
        -- line: [0, 0] id: 175
        _G.AutoLevel = r0_175
        if r0_175 == false then
          wait()
          toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
          wait()
        end
      end
      r19_4:[r22_4](r22_4)
      r22_4 = "SetValue"
      r22_4 = false
      r5_4.ToggleLevel:[r22_4](r22_4)
      spawn(function()
        -- line: [0, 0] id: 228
        while task.wait() do
          local r0_228 = _G.AutoLevel
          if r0_228 then
            pcall(function()
              -- line: [0, 0] id: 229
              CheckLevel()
              if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                toTarget(CFrameQ)
                if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                end
              elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                for r3_229, r4_229 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_229:FindFirstChild("Humanoid") and r4_229:FindFirstChild("HumanoidRootPart") and 0 < r4_229.Humanoid.Health and r4_229.Name == Ms then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      bringmob = true
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      Tween(r4_229.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                      r4_229.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      r4_229.HumanoidRootPart.Transparency = 1
                      r4_229.Humanoid.JumpPower = 0
                      r4_229.Humanoid.WalkSpeed = 0
                      r4_229.HumanoidRootPart.CanCollide = false
                      FarmPos = r4_229.HumanoidRootPart.CFrame
                      MonFarm = r4_229.Name
                      if _G.AutoLevel then
                        local r5_229 = r4_229.Parent
                        if r5_229 then
                          r5_229 = r4_229.Humanoid.Health
                          if r5_229 > 0 then
                            r5_229 = game:GetService("Workspace").Enemies:FindFirstChild(r4_229.Name)
                            if r5_229 then
                              r5_229 = game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible
                              if r5_229 == false then
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                    bringmob = false
                  end
                end
                for r3_229, r4_229 in pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren()) do
                  if string.find(r4_229.Name, NameMon) and 10 <= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_229.Position).Magnitude then
                    Tween(r4_229.CFrame * CFrame.new(posX, posY, posZ))
                  end
                end
              end
            end)
          end
        end
      end)
      r22_4 = "AddToggle"
      r22_4 = "ToggleCandy"
      r20_4 = r4_4.Main:[r22_4](r22_4, {
        Title = "Auto Farm Candy ( Only Max Level )",
        Description = "",
        Default = false,
      })
      local r23_4 = "OnChanged"
      function r23_4(r0_423)
        -- line: [0, 0] id: 423
        _G.AutoCandy = r0_423
        if r0_423 == false then
          wait()
          Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
          wait()
        end
      end
      r20_4:[r23_4](r23_4)
      r23_4 = "SetValue"
      r23_4 = false
      r5_4.ToggleCandy:[r23_4](r23_4)
      r21_4 = CFrame.new(-16603.197265625, 130.3873748779297, 1087.16455078125)
      spawn(function()
        -- line: [0, 0] id: 258
        while wait() do
          local r0_258 = _G.AutoCandy
          if r0_258 then
            pcall(function()
              -- line: [0, 0] id: 259
              toTarget(r21_4)
              if game:GetService("Workspace").Enemies:FindFirstChild("Isle Outlaw") or game:GetService("Workspace").Enemies:FindFirstChild("Island Boy") or game:GetService("Workspace").Enemies:FindFirstChild("Sun-kissed Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Isle Champion") then
                for r3_259, r4_259 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if (r4_259.Name == "Isle Outlaw" or r4_259.Name == "Island Boy" or r4_259.Name == "Sun-kissed Warrior" or r4_259.Name == "Isle Champion") and r4_259:FindFirstChild("Humanoid") and r4_259:FindFirstChild("HumanoidRootPart") and 0 < r4_259.Humanoid.Health then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      bringmob = true
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      Tween(r4_259.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                      r4_259.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      r4_259.HumanoidRootPart.Transparency = 1
                      r4_259.Humanoid.JumpPower = 0
                      r4_259.Humanoid.WalkSpeed = 0
                      r4_259.HumanoidRootPart.CanCollide = false
                      FarmPos = r4_259.HumanoidRootPart.CFrame
                      MonFarm = r4_259.Name
                      if _G.AutoCandy then
                        local r5_259 = r4_259.Parent
                        if r5_259 then
                          r5_259 = r4_259.Humanoid.Health
                          if r5_259 <= 0 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                    bringmob = false
                  end
                end
                Tween(CFrame.new(-16599.1484375, 154.2681121826172, -166.32186889648438))
              end
            end)
          end
        end
      end)
      local r24_4 = "AddToggle"
      r24_4 = "ToggleMobAura"
      r22_4 = r4_4.Main:[r24_4](r24_4, {
        Title = "Kill Near | Mob Aura",
        Description = "",
        Default = false,
      })
      local r25_4 = "OnChanged"
      function r25_4(r0_260)
        -- line: [0, 0] id: 260
        _G.AutoNear = r0_260
        if r0_260 == false then
          wait()
          Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
          wait()
        end
      end
      r22_4:[r25_4](r25_4)
      r25_4 = "SetValue"
      r25_4 = false
      r5_4.ToggleMobAura:[r25_4](r25_4)
      spawn(function()
        -- line: [0, 0] id: 158
        while wait(0.1) do
          local r0_158 = _G.AutoNear
          if r0_158 then
            pcall(function()
              -- line: [0, 0] id: 159
              for r3_159, r4_159 in pairs(game.Workspace.Enemies:GetChildren()) do
                if r4_159:FindFirstChild("Humanoid") and r4_159:FindFirstChild("HumanoidRootPart") and 0 < r4_159.Humanoid.Health and r4_159.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_159:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                  while true do
                    wait(_G.Fast_Delay)
                    AttackNoCoolDown()
                    bringmob = true
                    AutoHaki()
                    EquipTool(SelectWeapon)
                    Tween(r4_159.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                    r4_159.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    r4_159.HumanoidRootPart.Transparency = 1
                    r4_159.Humanoid.JumpPower = 0
                    r4_159.Humanoid.WalkSpeed = 0
                    r4_159.HumanoidRootPart.CanCollide = false
                    FarmPos = r4_159.HumanoidRootPart.CFrame
                    MonFarm = r4_159.Name
                    if _G.AutoNear then
                      local r5_159 = r4_159.Parent
                      if r5_159 then
                        r5_159 = r4_159.Humanoid.Health
                        if r5_159 > 0 then
                          r5_159 = game.Workspace.Enemies:FindFirstChild(r4_159.Name)
                          if not r5_159 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  end
                  bringmob = false
                end
              end
            end)
          end
        end
      end)
      r25_4 = "AddToggle"
      r25_4 = "ToggleCastleRaid"
      r23_4 = r4_4.Main:[r25_4](r25_4, {
        Title = "Auto Castle Raid | Pirates Castle",
        Description = "",
        Default = false,
      })
      local r26_4 = "OnChanged"
      function r26_4(r0_98)
        -- line: [0, 0] id: 98
        _G.CastleRaid = r0_98
      end
      r23_4:[r26_4](r26_4)
      r26_4 = "SetValue"
      r26_4 = false
      r5_4.ToggleCastleRaid:[r26_4](r26_4)
      spawn(function()
        -- line: [0, 0] id: 191
        while wait() do
          local r0_191 = _G.CastleRaid
          if r0_191 then
            pcall(function()
              -- line: [0, 0] id: 192
              local r0_192 = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 0.00000000737058015, 0.380223751, 0.000000035881019, 1, -0.000000106665446, -0.380223751, 0.000000112297109, 0.924894512)
              if (CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 then
                for r4_192, r5_192 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if _G.CastleRaid and r5_192:FindFirstChild("HumanoidRootPart") and r5_192:FindFirstChild("Humanoid") and 0 < r5_192.Humanoid.Health and (r5_192.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000 then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      r5_192.HumanoidRootPart.CanCollide = false
                      r5_192.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      Tween(r5_192.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                      if r5_192.Humanoid.Health > 0 then
                        local r6_192 = r5_192.Parent
                        if r6_192 then
                          r6_192 = _G.CastleRaid
                          if not r6_192 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              else
                toTarget(r0_192)
              end
            end)
          end
        end
      end)
      r26_4 = "AddButton"
      r26_4 = {
        Title = "Auto Chest",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 113
          _G.JoinTeam = "Pirates"
          _G.Stop_If_Has_Items = true
          loadstring(game:HttpGet("https://github.com/PNguyen0199/Script/raw/main/Trash_Auto_Chest.lua"))()
        end,
      }
      r4_4.Main:[r26_4](r26_4)
      r26_4 = "AddButton"
      r26_4 = {
        Title = "Redeem All Code",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 398
          RedeemCode()
        end,
      }
      r4_4.Main:[r26_4](r26_4)
      function RedeemCode(r0_326)
        -- line: [0, 0] id: 326
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(r0_326)
      end
      r26_4 = "AddButton"
      r26_4 = {
        Title = "Fps Booster",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 51
          FPSBooster()
        end,
      }
      r4_4.Main:[r26_4](r26_4)
      function FPSBooster()
        -- line: [0, 0] id: 223
        local r0_223 = true
        local r1_223 = game
        local r3_223 = r1_223.Lighting
        local r4_223 = r1_223.Workspace.Terrain
        sethiddenproperty(r3_223, "Technology", 2)
        sethiddenproperty(r4_223, "Decoration", false)
        r4_223.WaterWaveSize = 0
        r4_223.WaterWaveSpeed = 0
        r4_223.WaterReflectance = 0
        r4_223.WaterTransparency = 0
        r3_223.GlobalShadows = false
        r3_223.FogEnd = 9000000000
        r3_223.Brightness = 0
        settings().Rendering.QualityLevel = "Level01"
        for r8_223, r9_223 in pairs(r1_223:GetDescendants()) do
          if r9_223:IsA("Part") or r9_223:IsA("Union") or r9_223:IsA("CornerWedgePart") or r9_223:IsA("TrussPart") then
            r9_223.Material = "Plastic"
            r9_223.Reflectance = 0
          elseif r9_223:IsA("Decal") or r9_223:IsA("Texture") and r0_223 then
            r9_223.Transparency = 1
          elseif r9_223:IsA("ParticleEmitter") or r9_223:IsA("Trail") then
            r9_223.Lifetime = NumberRange.new(0)
          elseif r9_223:IsA("Explosion") then
            r9_223.BlastPressure = 1
            r9_223.BlastRadius = 1
          elseif r9_223:IsA("Fire") or r9_223:IsA("SpotLight") or r9_223:IsA("Smoke") or r9_223:IsA("Sparkles") then
            r9_223.Enabled = false
          elseif r9_223:IsA("MeshPart") then
            r9_223.Material = "Plastic"
            r9_223.Reflectance = 0
            r9_223.TextureID = 10385902758728956
          end
        end
        for r8_223, r9_223 in pairs(r3_223:GetChildren()) do
          if r9_223:IsA("BlurEffect") or r9_223:IsA("SunRaysEffect") or r9_223:IsA("ColorCorrectionEffect") or r9_223:IsA("BloomEffect") or r9_223:IsA("DepthOfFieldEffect") then
            r9_223.Enabled = false
          end
        end
      end
      r24_4 = r4_4.Main:AddSection("Mastery Farm")
      r25_4 = r4_4.Main:AddDropdown("DropdownMastery", {
        Title = "Mastery Mode",
        Description = "",
        Values = {
          "Level",
          "Near Mobs"
        },
        Multi = false,
        Default = 1,
      })
      local r28_4 = "SetValue"
      r28_4 = "Level"
      r25_4:[r28_4](r28_4)
      r28_4 = "OnChanged"
      function r28_4(r0_432)
        -- line: [0, 0] id: 432
        TypeMastery = r0_432
      end
      r25_4:[r28_4](r28_4)
      r28_4 = "AddToggle"
      r28_4 = "ToggleMasteryFruit"
      r26_4 = r4_4.Main:[r28_4](r28_4, {
        Title = "Auto BF Mastery",
        Description = "",
        Default = false,
      })
      local r29_4 = "OnChanged"
      function r29_4(r0_430)
        -- line: [0, 0] id: 430
        AutoFarmMasDevilFruit = r0_430
      end
      r26_4:[r29_4](r29_4)
      r29_4 = "SetValue"
      r29_4 = false
      r5_4.ToggleMasteryFruit:[r29_4](r29_4)
      r29_4 = "AddSlider"
      r29_4 = "SliderHealt"
      local r30_4 = {
        Title = "Health (%) Mob",
        Description = "",
        Default = 25,
        Min = 0,
        Max = 100,
        Rounding = 1,
      }
      local r31_4 = "Callback"
      r30_4[r31_4] = function(r0_256)
        -- line: [0, 0] id: 256
        KillPercent = r0_256
      end
      local r27_4 = r4_4.Main:[r29_4](r29_4, r30_4)
      r30_4 = "OnChanged"
      function r30_4(r0_325)
        -- line: [0, 0] id: 325
        KillPercent = r0_325
      end
      r27_4:[r30_4](r30_4)
      r30_4 = "SetValue"
      r30_4 = 25
      r27_4:[r30_4](r30_4)
      spawn(function()
        -- line: [0, 0] id: 111
        while task.wait(1) do
          local r0_111 = _G.UseSkill
          if r0_111 then
            pcall(function()
              -- line: [0, 0] id: 112
              if _G.UseSkill then
                for r3_112, r4_112 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_112.Name == MonFarm and r4_112:FindFirstChild("Humanoid") and r4_112:FindFirstChild("HumanoidRootPart") and r4_112.Humanoid.Health <= r4_112.Humanoid.MaxHealth * KillPercent / 100 then
                    while true do
                      game:GetService("RunService").Heartbeat:wait()
                      EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                      Tween(r4_112.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                      PositionSkillMasteryDevilFruit = r4_112.HumanoidRootPart.Position
                      if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit
                        local r5_112 = game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value
                        local r6_112 = SkillZ
                        if r6_112 and 1 <= r5_112 then
                          game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                          wait(0.1)
                          r6_112 = game:service("VirtualInputManager")
                          r6_112:SendKeyEvent(false, "Z", false, game)
                        end
                        r6_112 = SkillX
                        if r6_112 and 2 <= r5_112 then
                          game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                          wait(0.2)
                          r6_112 = game:service("VirtualInputManager")
                          r6_112:SendKeyEvent(false, "X", false, game)
                        end
                        r6_112 = SkillC
                        if r6_112 and 3 <= r5_112 then
                          game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                          wait(0.3)
                          r6_112 = game:service("VirtualInputManager")
                          r6_112:SendKeyEvent(false, "C", false, game)
                        end
                        r6_112 = SkillV
                        if r6_112 and 4 <= r5_112 then
                          game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                          wait(0.4)
                          r6_112 = game:service("VirtualInputManager")
                          r6_112:SendKeyEvent(false, "V", false, game)
                        end
                        r6_112 = SkillF
                        if r6_112 and 5 <= r5_112 then
                          game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                          wait(0.5)
                          r6_112 = game:GetService("VirtualInputManager")
                          r6_112:SendKeyEvent(false, "F", false, game)
                        end
                      end
                      local r5_112 = AutoFarmMasDevilFruit
                      if r5_112 then
                        r5_112 = _G.UseSkill
                        if r5_112 then
                          r5_112 = r4_112.Humanoid.Health
                          if r5_112 == 0 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              end
            end)
          end
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 246
        while task.wait(0.1) do
          local r0_246 = AutoFarmMasDevilFruit
          if r0_246 then
            r0_246 = TypeMastery
            if r0_246 == "Level" then
              pcall(function()
                -- line: [0, 0] id: 248
                CheckLevel(SelectMonster)
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                  if BypassTP then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude > 2500 then
                      to(CFrameQ)
                      wait(0.2)
                    elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude < 2500 then
                      Tween(CFrameQ)
                    end
                  else
                    Tween(CFrameQ)
                  end
                  if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                  end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                  for r3_248, r4_248 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if r4_248:FindFirstChild("Humanoid") and r4_248:FindFirstChild("HumanoidRootPart") and r4_248.Name == Ms then
                      while true do
                        wait(_G.Fast_Delay)
                        if r4_248.Humanoid.Health <= r4_248.Humanoid.MaxHealth * KillPercent / 100 then
                          local r5_248 = _G
                          r5_248.UseSkill = true
                        else
                          _G.UseSkill = false
                          AutoHaki()
                          bringmob = true
                          EquipTool(SelectWeapon)
                          Tween(r4_248.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                          r4_248.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                          r4_248.HumanoidRootPart.Transparency = 1
                          r4_248.Humanoid.JumpPower = 0
                          r4_248.Humanoid.WalkSpeed = 0
                          r4_248.HumanoidRootPart.CanCollide = false
                          FarmPos = r4_248.HumanoidRootPart.CFrame
                          MonFarm = r4_248.Name
                          NormalAttack()
                        end
                        local r5_248 = AutoFarmMasDevilFruit
                        if r5_248 then
                          r5_248 = r4_248.Parent
                          if r5_248 then
                            r5_248 = r4_248.Humanoid.Health
                            if r5_248 ~= 0 then
                              r5_248 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                              if r5_248 ~= false then
                                r5_248 = game:GetService("Workspace").Enemies:FindFirstChild(r4_248.Name)
                                if r5_248 then
                                  r5_248 = not TypeMastery
                                  if r5_248 == "Level" then
                                    break
                                  end
                                else
                                  break
                                end
                              else
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                      bringmob = false
                      _G.UseSkill = false
                    end
                  end
                end
              end)
            end
          end
          r0_246 = AutoFarmMasDevilFruit
          if r0_246 then
            r0_246 = TypeMastery
            if r0_246 == "Near Mobs" then
              pcall(function()
                -- line: [0, 0] id: 247
                for r3_247, r4_247 in pairs(game.Workspace.Enemies:GetChildren()) do
                  if r4_247.Name and r4_247:FindFirstChild("Humanoid") and r4_247:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_247:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
                    while true do
                      wait(_G.Fast_Delay)
                      if r4_247.Humanoid.Health <= r4_247.Humanoid.MaxHealth * KillPercent / 100 then
                        local r5_247 = _G
                        r5_247.UseSkill = true
                      else
                        _G.UseSkill = false
                        AutoHaki()
                        bringmob = true
                        EquipTool(SelectWeapon)
                        Tween(r4_247.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        r4_247.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        r4_247.HumanoidRootPart.Transparency = 1
                        r4_247.Humanoid.JumpPower = 0
                        r4_247.Humanoid.WalkSpeed = 0
                        r4_247.HumanoidRootPart.CanCollide = false
                        FarmPos = r4_247.HumanoidRootPart.CFrame
                        MonFarm = r4_247.Name
                        NormalAttack()
                      end
                      local r5_247 = AutoFarmMasDevilFruit
                      if r5_247 then
                        r5_247 = not MasteryType
                        if r5_247 ~= "Near Mobs" then
                          r5_247 = r4_247.Parent
                          if r5_247 then
                            r5_247 = r4_247.Humanoid.Health
                            if r5_247 ~= 0 then
                              r5_247 = not TypeMastery
                              if r5_247 == "Near Mobs" then
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                    bringmob = false
                    _G.UseSkill = false
                  end
                end
              end)
            end
          end
        end
      end)
      if Third_Sea then
        r28_4 = r4_4.Main:AddSection("Bone Farm")
        r31_4 = "AddParagraph"
        r31_4 = {
          Title = "Bone Status",
          Content = "",
        }
        r29_4 = r4_4.Main:[r31_4](r31_4)
        spawn(function()
          -- line: [0, 0] id: 282
          pcall(function()
            -- line: [0, 0] id: 283
            while wait() do
              r29_4:SetDesc("You Have : " .. tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check") .. " Bones"))
            end
          end)
        end)
        local r32_4 = "AddToggle"
        r32_4 = "ToggleBone"
        r30_4 = r4_4.Main:[r32_4](r32_4, {
          Title = "Auto Bone",
          Description = "",
          Default = false,
        })
        local r33_4 = "OnChanged"
        function r33_4(r0_99)
          -- line: [0, 0] id: 99
          _G.AutoBone = r0_99
          if r0_99 == false then
            wait()
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
          end
        end
        r30_4:[r33_4](r33_4)
        r33_4 = "SetValue"
        r33_4 = false
        r5_4.ToggleBone:[r33_4](r33_4)
        r31_4 = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
        r32_4 = CFrame.new(-9359.453125, 141.32679748535156, 5446.81982421875)
        spawn(function()
          -- line: [0, 0] id: 125
          while wait() do
            local r0_125 = _G.AutoBone
            if r0_125 then
              pcall(function()
                -- line: [0, 0] id: 126
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                  toTarget(r31_4)
                  if (r31_4.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                  end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")) then
                  for r4_126, r5_126 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if r5_126:FindFirstChild("HumanoidRootPart") and r5_126:FindFirstChild("Humanoid") and 0 < r5_126.Humanoid.Health and (r5_126.Name == "Reborn Skeleton" or r5_126.Name == "Living Zombie" or r5_126.Name == "Demonic Soul" or r5_126.Name == "Posessed Mummy") then
                      if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                        while true do
                          wait(_G.Fast_Delay)
                          AttackNoCoolDown()
                          AutoHaki()
                          bringmob = true
                          EquipTool(SelectWeapon)
                          Tween(r5_126.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                          r5_126.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                          r5_126.HumanoidRootPart.Transparency = 1
                          r5_126.Humanoid.JumpPower = 0
                          r5_126.Humanoid.WalkSpeed = 0
                          r5_126.HumanoidRootPart.CanCollide = false
                          FarmPos = r5_126.HumanoidRootPart.CFrame
                          MonFarm = r5_126.Name
                          if _G.AutoBone then
                            local r6_126 = r5_126.Humanoid.Health
                            if r6_126 > 0 then
                              r6_126 = r5_126.Parent
                              if r6_126 then
                                r6_126 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                if r6_126 == false then
                                  goto label_240	-- block#23 is visited secondly
                                end
                              else
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        end
                      else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        bringmob = false
                      end
                    end
                  end
                end
              end)
            end
          end
        end)
        local r35_4 = "AddToggle"
        r35_4 = "ToggleRandomBone"
        r33_4 = r4_4.Main:[r35_4](r35_4, {
          Title = "Random Bone",
          Description = "",
          Default = false,
        })
        local r36_4 = "OnChanged"
        function r36_4(r0_276)
          -- line: [0, 0] id: 276
          _G.AutoRandomBone = r0_276
        end
        r33_4:[r36_4](r36_4)
        r36_4 = "SetValue"
        r36_4 = false
        r5_4.ToggleRandomBone:[r36_4](r36_4)
        spawn(function()
          -- line: [0, 0] id: 162
          while wait(0.0000000000000000000000000000000000000000000000000001) do
            local r0_162 = _G.AutoRandomBone
            if r0_162 then
              r0_162 = {}
              r0_162[1] = "Bones"
              r0_162[2] = "Buy"
              r0_162[3] = 1
              r0_162[4] = 1
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_162))
            end
          end
        end)
        -- close: r28_4
      end
      if Third_Sea then
        r28_4 = r4_4.Main:AddSection("Katakuri Farm")
        r29_4 = r4_4.Main
        r31_4 = "AddParagraph"
        r31_4 = {}
        r31_4.Title = "Check Cake Mob"
        r31_4.Content = ""
        r29_4 = r29_4:[r31_4](r31_4)
        function r31_4()
          -- line: [0, 0] id: 241
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 242
              if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
                r29_4:SetDesc("Kill : " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) .. "")
              elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
                r29_4:SetDesc("Kill : " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) .. "")
              elseif string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                r29_4:SetDesc("Kill : " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) .. " ")
              else
                r29_4:SetDesc("Cake Prince :       yes")
              end
            end)
          end
        end
        spawn(r31_4)
        local r32_4 = "AddToggle"
        r32_4 = "ToggleCake"
        r30_4 = r4_4.Main:[r32_4](r32_4, {
          Title = "Auto Cake Prince",
          Description = "",
          Default = false,
        })
        local r33_4 = "OnChanged"
        function r33_4(r0_365)
          -- line: [0, 0] id: 365
          _G.CakePrince = r0_365
          if r0_365 == false then
            wait()
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
          end
        end
        r30_4:[r33_4](r33_4)
        r31_4 = "ToggleCake"
        r31_4 = r5_4[r31_4]
        r33_4 = "SetValue"
        r33_4 = false
        r31_4:[r33_4](r33_4)
        r31_4 = spawn
        r31_4(function()
          -- line: [0, 0] id: 43
          while wait() do
            local r0_43 = _G.CakePrince
            if r0_43 then
              pcall(function()
                -- line: [0, 0] id: 44
                local r0_44 = CFrame.new(-2142.66821, 71.2588654, -12327.4619, 0.996939838, -0.0000000433107843, 0.078172572, 0.0000000420252917, 1, 0.0000000180894251, -0.078172572, -0.0000000147488439, 0.996939838)
                toTarget(r0_44)
                if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                  if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    for r4_44, r5_44 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                      if r5_44.Name == "Cake Prince" then
                        while true do
                          wait(_G.Fast_Delay)
                          AttackNoCoolDown()
                          AutoHaki()
                          EquipTool(SelectWeapon)
                          r5_44.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                          r5_44.HumanoidRootPart.CanCollide = false
                          Tween(r5_44.HumanoidRootPart.CFrame * Pos)
                          if _G.CakePrince ~= false then
                            local r6_44 = r5_44.Parent
                            if r6_44 then
                              r6_44 = r5_44.Humanoid.Health
                              if r6_44 <= 0 then
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        end
                        bringmob = false
                      end
                    end
                  else
                    Tween(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
                  end
                elseif game.Workspace.Enemies:FindFirstChild("Baking Staff") or game.Workspace.Enemies:FindFirstChild("Head Baker") or game.Workspace.Enemies:FindFirstChild("Cake Guard") or game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
                  for r4_44, r5_44 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if (r5_44.Name == "Baking Staff" or r5_44.Name == "Head Baker" or r5_44.Name == "Cake Guard" or r5_44.Name == "Cookie Crafter") and 0 < r5_44.Humanoid.Health then
                      while true do
                        wait(_G.Fast_Delay)
                        AttackNoCoolDown()
                        AutoHaki()
                        bringmob = true
                        EquipTool(SelectWeapon)
                        r5_44.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        FarmPos = r5_44.HumanoidRootPart.CFrame
                        MonFarm = r5_44.Name
                        Tween(r5_44.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        if _G.CakePrince ~= false then
                          local r6_44 = game:GetService("ReplicatedStorage")
                          r6_44 = r6_44:FindFirstChild("Cake Prince")
                          if not r6_44 then
                            r6_44 = r5_44.Parent
                            if r6_44 then
                              r6_44 = r5_44.Humanoid.Health
                              if r6_44 <= 0 then
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                      bringmob = false
                    end
                  end
                else
                  Tween(r0_44)
                end
              end)
            end
          end
        end)
        r31_4 = r4_4.Main
        r33_4 = "AddToggle"
        r33_4 = "ToggleSpawnCake"
        r31_4 = r31_4:[r33_4](r33_4, {
          Title = "Auto Spawn Cake Prince",
          Description = "",
          Default = true,
        })
        local r34_4 = "OnChanged"
        function r34_4(r0_297)
          -- line: [0, 0] id: 297
          _G.SpawnCakePrince = r0_297
        end
        r31_4:[r34_4](r34_4)
        r34_4 = "SetValue"
        r34_4 = true
        r5_4.ToggleSpawnCake:[r34_4](r34_4)
        -- close: r28_4
      end
      function r29_4()
        -- line: [0, 0] id: 101
        while wait() do
          local r0_101 = _G.SpawnCakePrince
          if r0_101 then
            r0_101 = {}
            r0_101[1] = "CakePrinceSpawner"
            r0_101[2] = true
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_101))
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
              [1] = "CakePrinceSpawner",
            }))
          end
        end
      end
      spawn(r29_4)
      -- close: r6_4
      if Second_Sea then
        r8_4 = "Ectoplasm Farm"
        r6_4 = r4_4.Main:AddSection(r8_4)
        r9_4 = "AddToggle"
        r9_4 = "ToggleVatChatKiDi"
        r10_4 = {}
        r11_4 = "Auto Ectoplasm"
        r10_4.Title = r11_4
        r10_4.Description = ""
        r11_4 = "Default"
        r12_4 = false
        r10_4[r11_4] = r12_4
        r7_4 = r4_4.Main:[r9_4](r9_4, r10_4)
        r10_4 = "OnChanged"
        function r10_4(r0_376)
          -- line: [0, 0] id: 376
          _G.Ectoplasm = r0_376
        end
        r7_4:[r10_4](r10_4)
        r8_4 = "ToggleVatChatKiDi"
        r8_4 = r5_4[r8_4]
        r10_4 = "SetValue"
        r10_4 = false
        r8_4:[r10_4](r10_4)
        r8_4 = spawn
        function r9_4()
          -- line: [0, 0] id: 188
          while wait(0.1) do
            pcall(function()
              -- line: [0, 0] id: 189
              if _G.Ectoplasm then
                if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer") then
                  for r3_189, r4_189 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if (r4_189.Name == "Ship Steward" or r4_189.Name == "Ship Engineer" or r4_189.Name == "Ship Deckhand" or r4_189.Name == "Ship Officer" and r4_189:FindFirstChild("Humanoid")) and 0 < r4_189.Humanoid.Health then
                      while true do
                        wait(_G.Fast_Delay)
                        AttackNoCoolDown()
                        AutoHaki()
                        bringmob = true
                        EquipTool(SelectWeapon)
                        Tween(r4_189.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        r4_189.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        r4_189.HumanoidRootPart.Transparency = 1
                        r4_189.Humanoid.JumpPower = 0
                        r4_189.Humanoid.WalkSpeed = 0
                        r4_189.HumanoidRootPart.CanCollide = false
                        FarmPos = r4_189.HumanoidRootPart.CFrame
                        MonFarm = r4_189.Name
                        if _G.Ectoplasm ~= false then
                          local r5_189 = r4_189.Parent
                          if r5_189 then
                            r5_189 = r4_189.Humanoid.Health
                            if r5_189 ~= 0 then
                              r5_189 = game:GetService("Workspace").Enemies:FindFirstChild(r4_189.Name)
                              if not r5_189 then
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                      bringmob = false
                    end
                  end
                else
                  if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                  end
                  Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
                end
              end
            end)
          end
        end
        r8_4(r9_4)
      end
      r8_4 = "Boss Farm"
      r6_4 = r4_4.Main:AddSection(r8_4)
      if First_Sea then
        tableBoss = {
          "The Gorilla King",
          "Bobby",
          "Yeti",
          "Mob Leader",
          "Vice Admiral",
          "Warden",
          "Chief Warden",
          "Swan",
          "Magma Admiral",
          "Fishman Lord",
          "Wysper",
          "Thunder God",
          "Cyborg",
          "Saber Expert"
        }
      elseif Second_Sea then
        tableBoss = {
          "Diamond",
          "Jeremy",
          "Fajita",
          "Don Swan",
          "Smoke Admiral",
          "Cursed Captain",
          "Darkbeard",
          "Order",
          "Awakened Ice Admiral",
          "Tide Keeper"
        }
      elseif Third_Sea then
        tableBoss = {
          "Stone",
          "Island Empress",
          "Kilo Admiral",
          "Captain Elephant",
          "Beautiful Pirate",
          "rip_indra True Form",
          "Longma",
          "Soul Reaper",
          "Cake Queen"
        }
      end
      r9_4 = "DropdownBoss"
      r10_4 = {}
      r11_4 = "Dropdown"
      r10_4.Title = r11_4
      r10_4.Description = ""
      r11_4 = tableBoss
      r10_4.Values = r11_4
      r11_4 = false
      r10_4.Multi = r11_4
      r11_4 = "Default"
      r12_4 = 1
      r10_4[r11_4] = r12_4
      r7_4 = r4_4.Main:AddDropdown(r9_4, r10_4)
      r10_4 = "SetValue"
      r10_4 = ""
      r7_4:[r10_4](r10_4)
      r10_4 = "OnChanged"
      function r10_4(r0_220)
        -- line: [0, 0] id: 220
        _G.SelectBoss = r0_220
      end
      r7_4:[r10_4](r10_4)
      r8_4 = r4_4.Main
      r10_4 = "AddToggle"
      r10_4 = "ToggleAutoFarmBoss"
      r11_4 = {}
      r12_4 = "Kill Boss"
      r11_4.Title = r12_4
      r11_4.Description = ""
      r12_4 = "Default"
      r11_4[r12_4] = false
      r8_4 = r8_4:[r10_4](r10_4, r11_4)
      r11_4 = "OnChanged"
      function r11_4(r0_141)
        -- line: [0, 0] id: 141
        _G.AutoBoss = r0_141
      end
      r8_4:[r11_4](r11_4)
      r9_4 = "ToggleAutoFarmBoss"
      r9_4 = r5_4[r9_4]
      r11_4 = "SetValue"
      r11_4 = false
      r9_4:[r11_4](r11_4)
      r9_4 = spawn
      function r10_4()
        -- line: [0, 0] id: 116
        while wait() do
          local r0_116 = _G.AutoBoss
          if r0_116 then
            pcall(function()
              -- line: [0, 0] id: 117
              if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                for r3_117, r4_117 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_117.Name == _G.SelectBoss and r4_117:FindFirstChild("Humanoid") and r4_117:FindFirstChild("HumanoidRootPart") and 0 < r4_117.Humanoid.Health then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      r4_117.HumanoidRootPart.CanCollide = false
                      r4_117.Humanoid.WalkSpeed = 0
                      r4_117.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                      Tween(r4_117.HumanoidRootPart.CFrame * Pos)
                      sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                      if _G.AutoBoss then
                        local r5_117 = r4_117.Parent
                        if r5_117 then
                          r5_117 = r4_117.Humanoid.Health
                          if r5_117 <= 0 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                toTarget(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
              end
            end)
          end
        end
      end
      r9_4(r10_4)
      r9_4 = r4_4.Main
      r11_4 = "Material Farm"
      r9_4 = r9_4:AddSection(r11_4)
      r10_4 = First_Sea
      if r10_4 then
        r10_4 = {}
        r11_4 = "Scrap Metal"
        r12_4 = "Leather"
        local r13_4 = "Angel Wings"
        r14_4 = "Magma Ore"
        r15_4 = "Fish Tail"
        -- setlist for #10 failed
        MaterialList = r10_4
      else
        r10_4 = Second_Sea
        if r10_4 then
          r10_4 = {}
          r11_4 = "Scrap Metal"
          r12_4 = "Leather"
          local r13_4 = "Radioactive Material"
          r14_4 = "Mystic Droplet"
          r15_4 = "Magma Ore"
          local r16_4 = "Vampire Fang"
          -- setlist for #10 failed
          MaterialList = r10_4
        else
          r10_4 = Third_Sea
          if r10_4 then
            r10_4 = {}
            r11_4 = "Scrap Metal"
            r12_4 = "Leather"
            local r13_4 = "Demonic Wisp"
            r14_4 = "Conjured Cocoa"
            r15_4 = "Dragon Scale"
            local r16_4 = "Gunpowder"
            r17_4 = "Fish Tail"
            r18_4 = "Mini Tusk"
            -- setlist for #10 failed
            MaterialList = r10_4
          end
        end
      end
      r10_4 = r4_4.Main
      r12_4 = "DropdownMaterial"
      local r13_4 = {}
      r14_4 = "Dropdown"
      r13_4.Title = r14_4
      r13_4.Description = ""
      r14_4 = MaterialList
      r13_4.Values = r14_4
      r14_4 = false
      r13_4.Multi = r14_4
      r14_4 = "Default"
      r13_4[r14_4] = 1
      r10_4 = r10_4:AddDropdown(r12_4, r13_4)
      r13_4 = "SetValue"
      r13_4 = "Dragon Scale"
      r10_4:[r13_4](r13_4)
      r13_4 = "OnChanged"
      function r13_4(r0_281)
        -- line: [0, 0] id: 281
        SelectMaterial = r0_281
      end
      r10_4:[r13_4](r13_4)
      r11_4 = r4_4.Main
      r13_4 = "AddToggle"
      r13_4 = "ToggleMaterial"
      r14_4 = {
        Title = "Auto Material",
        Description = "",
      }
      local r16_4 = false
      r14_4.Default = r16_4
      r11_4 = r11_4:[r13_4](r13_4, r14_4)
      r14_4 = "OnChanged"
      function r14_4(r0_161)
        -- line: [0, 0] id: 161
        _G.AutoMaterial = r0_161
        if r0_161 == false then
          wait()
          Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
          wait()
        end
      end
      r11_4:[r14_4](r14_4)
      r12_4 = "ToggleMaterial"
      r12_4 = r5_4[r12_4]
      r14_4 = "SetValue"
      r14_4 = false
      r12_4:[r14_4](r14_4)
      r12_4 = spawn
      r12_4(function()
        -- line: [0, 0] id: 343
        while task.wait() do
          local r0_343 = _G.AutoMaterial
          if r0_343 then
            pcall(function()
              -- line: [0, 0] id: 344
              MaterialMon(SelectMaterial)
              toTarget(MPos)
              if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                for r3_344, r4_344 in pairs(game.Workspace.Enemies:GetChildren()) do
                  if r4_344:FindFirstChild("Humanoid") and r4_344:FindFirstChild("HumanoidRootPart") and 0 < r4_344.Humanoid.Health and r4_344.Name == MMon then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      AutoHaki()
                      bringmob = true
                      EquipTool(SelectWeapon)
                      Tween(r4_344.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                      r4_344.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      r4_344.HumanoidRootPart.Transparency = 1
                      r4_344.Humanoid.JumpPower = 0
                      r4_344.Humanoid.WalkSpeed = 0
                      r4_344.HumanoidRootPart.CanCollide = false
                      FarmPos = r4_344.HumanoidRootPart.CFrame
                      MonFarm = r4_344.Name
                      if _G.AutoMaterial then
                        local r5_344 = r4_344.Parent
                        if r5_344 then
                          r5_344 = r4_344.Humanoid.Health
                          if r5_344 <= 0 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                    bringmob = false
                  end
                end
              else
                for r3_344, r4_344 in pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren()) do
                  if string.find(r4_344.Name, Mon) and 10 <= (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - r4_344.Position).Magnitude then
                    Tween(r4_344.CFrame * CFrame.new(posX, posY, posZ))
                  end
                end
              end
            end)
          end
        end
      end)
      r12_4 = Third_Sea
      if r12_4 then
        r12_4 = r4_4.Main
        r14_4 = "Kitsune"
        r12_4 = r12_4:AddSection(r14_4)
        r15_4 = "AddParagraph"
        r15_4 = {
          Title = "Kistune Island",
          Content = "",
        }
        r13_4 = r4_4.Main:[r15_4](r15_4)
        function r14_4()
          -- line: [0, 0] id: 31
          if game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
            r13_4:SetDesc("Kitsune Island :       yes")
          else
            r13_4:SetDesc("Kitsune Island :       no")
          end
        end
        UpdateKitsune = r14_4
        r14_4 = spawn
        r14_4(function()
          -- line: [0, 0] id: 64
          pcall(function()
            -- line: [0, 0] id: 65
            while wait() do
              UpdateKitsune()
            end
          end)
        end)
        r14_4 = r4_4.Main
        r16_4 = "AddToggle"
        r16_4 = "ToggleEspKitsune"
        r14_4 = r14_4:[r16_4](r16_4, {
          Title = "Esp Kitsune Island",
          Description = "",
          Default = false,
        })
        r17_4 = "OnChanged"
        function r17_4(r0_102)
          -- line: [0, 0] id: 102
          KitsuneIslandEsp = r0_102
          while KitsuneIslandEsp do
            wait()
            UpdateIslandKisuneESP()
          end
        end
        r14_4:[r17_4](r17_4)
        r17_4 = "SetValue"
        r17_4 = false
        r5_4.ToggleEspKitsune:[r17_4](r17_4)
        function UpdateIslandKisuneESP()
          -- line: [0, 0] id: 251
          for r3_251, r4_251 in pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren()) do
            pcall(function()
              -- line: [0, 0] id: 252
              if KitsuneIslandEsp and r4_251.Name == "Kitsune Island" then
                if not r4_251:FindFirstChild("NameEsp") then
                  local r0_252 = Instance.new("BillboardGui", r4_251)
                  r0_252.Name = "NameEsp"
                  r0_252.ExtentsOffset = Vector3.new(0, 1, 0)
                  r0_252.Size = UDim2.new(1, 200, 1, 30)
                  r0_252.Adornee = r4_251
                  r0_252.AlwaysOnTop = true
                  local r1_252 = Instance.new("TextLabel", r0_252)
                  r1_252.Font = "Code"
                  r1_252.FontSize = "Size14"
                  r1_252.TextWrapped = true
                  r1_252.Size = UDim2.new(1, 0, 1, 0)
                  r1_252.TextYAlignment = "Top"
                  r1_252.BackgroundTransparency = 1
                  r1_252.TextStrokeTransparency = 0.5
                  r1_252.TextColor3 = Color3.fromRGB(80, 245, 245)
                else
                  r4_251.NameEsp.TextLabel.Text = r4_251.Name .. "   \n" .. round(((game:GetService("Players").LocalPlayer.Character.Head.Position - r4_251.Position)).Magnitude / 3) .. " M"
                end
              elseif r4_251:FindFirstChild("NameEsp") then
                r4_251:FindFirstChild("NameEsp"):Destroy()
              end
            end)
            -- close: r3_251
          end
        end
        r17_4 = "AddToggle"
        r17_4 = "ToggleTPKitsune"
        r15_4 = r4_4.Main:[r17_4](r17_4, {
          Title = "Tween To Kitsune Island",
          Description = "",
          Default = false,
        })
        r18_4 = "OnChanged"
        function r18_4(r0_345)
          -- line: [0, 0] id: 345
          _G.TweenToKitsune = r0_345
        end
        r15_4:[r18_4](r18_4)
        r18_4 = "SetValue"
        r18_4 = false
        r5_4.ToggleTPKitsune:[r18_4](r18_4)
        spawn(function()
          -- line: [0, 0] id: 190
          while true do
            local r0_190 = nil	-- notice: implicit variable refs by block#[0, 4]
            if not r0_190 then
              r0_190 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
              wait(1)
            else
              break
            end
          end
          while wait() do
            local r1_190 = _G.TweenToKitsune
            if r1_190 then
              r1_190 = r0_190:FindFirstChild("ShrineActive")
              if r1_190 then
                for r5_190, r6_190 in pairs(r1_190:GetDescendants()) do
                  if r6_190:IsA("BasePart") and r6_190.Name:find("NeonShrinePart") then
                    Tween(r6_190.CFrame)
                  end
                end
              end
            end
          end
        end)
        r18_4 = "AddToggle"
        r18_4 = "ToggleCollectAzure"
        r19_4 = {
          Title = "Collect Azure Ambers",
          Description = "",
        }
        r21_4 = false
        r19_4.Default = r21_4
        r16_4 = r4_4.Main:[r18_4](r18_4, r19_4)
        r19_4 = "OnChanged"
        function r19_4(r0_433)
          -- line: [0, 0] id: 433
          _G.CollectAzure = r0_433
        end
        r16_4:[r19_4](r19_4)
        r19_4 = "SetValue"
        r19_4 = false
        r5_4.ToggleCollectAzure:[r19_4](r19_4)
        spawn(function()
          -- line: [0, 0] id: 8
          while wait() do
            local r0_8 = _G.CollectAzure
            if r0_8 then
              pcall(function()
                -- line: [0, 0] id: 9
                if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                  Tween(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                  print("Azure")
                end
              end)
            end
          end
        end)
        -- close: r12_4
      end
      r12_4 = Third_Sea
      if r12_4 then
        r12_4 = r4_4.Main
        r14_4 = "Rough Sea"
        r12_4 = r12_4:AddSection(r14_4)
        r13_4 = r4_4.Main
        r15_4 = "AddToggle"
        r15_4 = "ToggleSailBoat"
        r13_4 = r13_4:[r15_4](r15_4, {
          Title = "Auto buy Boat",
          Description = "",
          Default = false,
        })
        r16_4 = "OnChanged"
        function r16_4(r0_253)
          -- line: [0, 0] id: 253
          _G.SailBoat = r0_253
        end
        r13_4:[r16_4](r16_4)
        r14_4 = "ToggleSailBoat"
        r14_4 = r5_4[r14_4]
        r16_4 = "SetValue"
        r16_4 = false
        r14_4:[r16_4](r16_4)
        r14_4 = spawn
        r14_4(function()
          -- line: [0, 0] id: 385
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 386
              if _G.SailBoat and (not game:GetService("Workspace").Enemies:FindFirstChild("Shark") or not game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or not game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or not game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")) then
                if not game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                  buyb = TweenBoat(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
                  if (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                    if buyb then
                      buyb:Stop()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                      [1] = "BuyBoat",
                      [2] = "PirateGrandBrigade",
                    }))
                  end
                elseif game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                  if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                    TweenBoat(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                  else
                    for r3_386, r4_386 in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                      if r4_386.Name == "PirateGrandBrigade" then
                        while true do
                          wait(_G.Fast_Delay)
                          if (CFrame.new(-17013.80078125, 10.962434768676758, 438.0169982910156).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                            TweenShip(CFrame.new(-33163.1875, 10.964323997497559, -324.4842224121094))
                          else
                            local r6_386 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                            local r5_386 = (CFrame.new(-33163.1875, 10.964323997497559, -324.4842224121094).Position - r6_386).magnitude
                            if r5_386 <= 10 then
                              TweenShip(CFrame.new(-37952.49609375, 10.96342945098877, -1324.12109375))
                            else
                              r6_386 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                              r5_386 = (CFrame.new(-37952.49609375, 10.96342945098877, -1324.12109375).Position - r6_386).magnitude
                              if r5_386 <= 10 then
                                TweenShip(CFrame.new(-33163.1875, 10.964323997497559, -324.4842224121094))
                              end
                            end
                          end
                          local r5_386 = game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                          if not r5_386 then
                            r5_386 = game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                            if not r5_386 then
                              r5_386 = game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                              if not r5_386 then
                                r5_386 = game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                                if not r5_386 then
                                  r5_386 = _G.SailBoat
                                  if r5_386 == false then
                                    break
                                  end
                                else
                                  break
                                end
                              else
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        end
                      end
                    end
                  end
                end
              end
            end)
          end
        end)
        r14_4 = spawn
        r14_4(function()
          -- line: [0, 0] id: 155
          pcall(function()
            -- line: [0, 0] id: 156
            while wait() do
              local r0_156 = _G.SailBoat
              if r0_156 then
                r0_156 = game:GetService("Workspace").Enemies:FindFirstChild("Shark")
                if not r0_156 then
                  r0_156 = game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark")
                  if not r0_156 then
                    r0_156 = game:GetService("Workspace").Enemies:FindFirstChild("Piranha")
                    if not r0_156 then
                      r0_156 = game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                      if not r0_156 then
                      end
                    end
                  end
                end
                r0_156 = game.Players.LocalPlayer.Character.Humanoid
                r0_156.Sit = false
              end
            end
          end)
        end)
        r14_4 = r4_4.Main
        r16_4 = "AddToggle"
        r16_4 = "ToggleNocliprock"
        r14_4 = r14_4:[r16_4](r16_4, {
          Title = "No Clip Rock",
          Description = "",
          Default = false,
        })
        r17_4 = "OnChanged"
        function r17_4(r0_216)
          -- line: [0, 0] id: 216
          _G.Nocliprock = r0_216
        end
        r14_4:[r17_4](r17_4)
        r17_4 = "SetValue"
        r17_4 = false
        r5_4.ToggleNocliprock:[r17_4](r17_4)
        spawn(function()
          -- line: [0, 0] id: 33
          while wait() do
            local r0_33 = _G.Nocliprock
            if r0_33 then
              r0_33 = game.Players.LocalPlayer.Character.Humanoid.Sit
              if r0_33 == true then
                r0_33 = pairs
                for r3_33, r4_33 in r0_33(game.Workspace.Boats:GetDescendants()) do
                  if r4_33:IsA("BasePart") and r4_33.CanCollide == true then
                    r4_33.CanCollide = false
                  end
                end
                r0_33 = pairs
                for r3_33, r4_33 in r0_33(game.Players.LocalPlayer.Character:GetDescendants()) do
                  if r4_33:IsA("BasePart") and r4_33.CanCollide == true then
                    r4_33.CanCollide = false
                  end
                end
              else
                r0_33 = game.Players.LocalPlayer.Character.Humanoid.Sit
                if r0_33 == false then
                  r0_33 = pairs
                  for r3_33, r4_33 in r0_33(game.Workspace.Boats:GetDescendants()) do
                    if r4_33:IsA("BasePart") and r4_33.CanCollide == false then
                      r4_33.CanCollide = true
                    end
                  end
                  r0_33 = pairs
                  for r3_33, r4_33 in r0_33(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if r4_33:IsA("BasePart") and r4_33.CanCollide == false then
                      r4_33.CanCollide = true
                    end
                  end
                end
              end
            end
          end
        end)
        r17_4 = "AddSlider"
        r17_4 = "SliderSpeedBoat"
        r15_4 = r4_4.Main:[r17_4](r17_4, {
          Title = "Set Speed boat",
          Description = "",
          Default = 300,
          Min = 0,
          Max = 1000,
          Rounding = 1,
          Callback = function(r0_338)
            -- line: [0, 0] id: 338
            SetSpeedBoat = r0_338
          end,
        })
        r18_4 = "OnChanged"
        function r18_4(r0_104)
          -- line: [0, 0] id: 104
          SetSpeedBoat = r0_104
        end
        r15_4:[r18_4](r18_4)
        r18_4 = "SetValue"
        r18_4 = 300
        r15_4:[r18_4](r18_4)
        r18_4 = "AddToggle"
        r18_4 = "SpeedBoat_Toggle"
        r19_4 = {
          Title = "Speed Boat",
          Description = "",
        }
        r21_4 = false
        r19_4.Default = r21_4
        r16_4 = r4_4.Main:[r18_4](r18_4, r19_4)
        r19_4 = "SetValue"
        r19_4 = false
        r5_4.SpeedBoat_Toggle:[r19_4](r19_4)
        r19_4 = "OnChanged"
        function r19_4(r0_402)
          -- line: [0, 0] id: 402
          _G.SpeedBoat = r0_402
        end
        r16_4:[r19_4](r19_4)
        r17_4 = game:GetService("RunService")
        r19_4 = "Connect"
        function r19_4()
          -- line: [0, 0] id: 300
          if _G.SpeedBoat then
            for r3_300, r4_300 in pairs(game:GetService("Workspace").Boats:GetChildren()) do
              if game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                r4_300:FindFirstChild("VehicleSeat").MaxSpeed = SetSpeedBoat
              end
            end
          end
        end
        r17_4.RenderStepped:[r19_4](r19_4)
        r19_4 = "AddToggle"
        r19_4 = "ToggleTerrorshark"
        r20_4 = {}
        r21_4 = " Kill Terrorshark"
        r20_4.Title = r21_4
        r20_4.Description = ""
        r21_4 = "Default"
        r20_4[r21_4] = false
        r17_4 = r4_4.Main:[r19_4](r19_4, r20_4)
        r20_4 = "OnChanged"
        function r20_4(r0_293)
          -- line: [0, 0] id: 293
          _G.AutoTerrorshark = r0_293
        end
        r17_4:[r20_4](r20_4)
        r20_4 = "SetValue"
        r20_4 = false
        r5_4.ToggleTerrorshark:[r20_4](r20_4)
        spawn(function()
          -- line: [0, 0] id: 11
          while wait() do
            local r0_11 = _G.AutoTerrorshark
            if r0_11 then
              pcall(function()
                -- line: [0, 0] id: 12
                if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                  for r3_12, r4_12 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if r4_12.Name == "Terrorshark" and r4_12:FindFirstChild("Humanoid") and r4_12:FindFirstChild("HumanoidRootPart") and 0 < r4_12.Humanoid.Health then
                      while true do
                        wait(_G.Fast_Delay)
                        AttackNoCoolDown()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        r4_12.HumanoidRootPart.CanCollide = false
                        r4_12.Humanoid.WalkSpeed = 0
                        r4_12.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        Tween(r4_12.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        if _G.AutoTerrorshark then
                          local r5_12 = r4_12.Parent
                          if r5_12 then
                            r5_12 = r4_12.Humanoid.Health
                            if r5_12 <= 0 then
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                    end
                  end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                  Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
              end)
            end
          end
        end)
        r20_4 = "AddToggle"
        r20_4 = "TogglePiranha"
        r21_4 = {
          Title = " Kill Piranha",
          Description = "",
          Default = false,
        }
        r18_4 = r4_4.Main:[r20_4](r20_4, r21_4)
        r21_4 = "OnChanged"
        function r21_4(r0_447)
          -- line: [0, 0] id: 447
          _G.farmpiranya = r0_447
        end
        r18_4:[r21_4](r21_4)
        r21_4 = "SetValue"
        r21_4 = false
        r5_4.TogglePiranha:[r21_4](r21_4)
        spawn(function()
          -- line: [0, 0] id: 23
          while wait() do
            local r0_23 = _G.farmpiranya
            if r0_23 then
              pcall(function()
                -- line: [0, 0] id: 24
                if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                  for r3_24, r4_24 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if r4_24.Name == "Piranha" and r4_24:FindFirstChild("Humanoid") and r4_24:FindFirstChild("HumanoidRootPart") and 0 < r4_24.Humanoid.Health then
                      while true do
                        wait(_G.Fast_Delay)
                        AttackNoCoolDown()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        r4_24.HumanoidRootPart.CanCollide = false
                        r4_24.Humanoid.WalkSpeed = 0
                        r4_24.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        Tween(r4_24.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        if _G.farmpiranya then
                          local r5_24 = r4_24.Parent
                          if r5_24 then
                            r5_24 = r4_24.Humanoid.Health
                            if r5_24 <= 0 then
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                    end
                  end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                  Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
              end)
            end
          end
        end)
        r21_4 = "AddToggle"
        r21_4 = "ToggleShark"
        r19_4 = r4_4.Main:[r21_4](r21_4, {
          Title = " Kill Shark",
          Description = "",
          Default = false,
        })
        r22_4 = "OnChanged"
        function r22_4(r0_225)
          -- line: [0, 0] id: 225
          _G.AutoShark = r0_225
        end
        r19_4:[r22_4](r22_4)
        r22_4 = "SetValue"
        r22_4 = false
        r5_4.ToggleShark:[r22_4](r22_4)
        function r21_4()
          -- line: [0, 0] id: 203
          while wait() do
            local r0_203 = _G.AutoShark
            if r0_203 then
              pcall(function()
                -- line: [0, 0] id: 204
                if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                  for r3_204, r4_204 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if r4_204.Name == "Shark" and r4_204:FindFirstChild("Humanoid") and r4_204:FindFirstChild("HumanoidRootPart") and 0 < r4_204.Humanoid.Health then
                      while true do
                        wait(_G.Fast_Delay)
                        AttackNoCoolDown()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        r4_204.HumanoidRootPart.CanCollide = false
                        r4_204.Humanoid.WalkSpeed = 0
                        r4_204.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        Tween(r4_204.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                        if _G.AutoShark then
                          local r5_204 = r4_204.Parent
                          if r5_204 then
                            r5_204 = r4_204.Humanoid.Health
                            if r5_204 <= 0 then
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                    end
                  end
                else
                  Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                  if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                  end
                end
              end)
            end
          end
        end
        spawn(r21_4)
        r22_4 = "AddToggle"
        r22_4 = "ToggleFishCrew"
        r20_4 = r4_4.Main:[r22_4](r22_4, {
          Title = " Kill Fish Crew",
          Description = "",
          Default = false,
        })
        r23_4 = "OnChanged"
        function r23_4(r0_331)
          -- line: [0, 0] id: 331
          _G.AutoFishCrew = r0_331
        end
        r20_4:[r23_4](r23_4)
        r21_4 = "ToggleFishCrew"
        r21_4 = r5_4[r21_4]
        r23_4 = "SetValue"
        r23_4 = false
        r21_4:[r23_4](r23_4)
        r21_4 = spawn
        r21_4(function()
          -- line: [0, 0] id: 217
          while wait() do
            local r0_217 = _G.AutoFishCrew
            if r0_217 then
              pcall(function()
                -- line: [0, 0] id: 218
                if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                  for r3_218, r4_218 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if r4_218.Name == "Fish Crew Member" and r4_218:FindFirstChild("Humanoid") and r4_218:FindFirstChild("HumanoidRootPart") and 0 < r4_218.Humanoid.Health then
                      while true do
                        wait(_G.Fast_Delay)
                        AttackNoCoolDown()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        r4_218.HumanoidRootPart.CanCollide = false
                        r4_218.Humanoid.WalkSpeed = 0
                        r4_218.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        Tween(r4_218.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                        if _G.AutoFishCrew then
                          local r5_218 = r4_218.Parent
                          if r5_218 then
                            r5_218 = r4_218.Humanoid.Health
                            if r5_218 <= 0 then
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                    end
                  end
                else
                  Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                  if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                  end
                end
              end)
            end
          end
        end)
        r21_4 = r4_4.Main
        r23_4 = "AddToggle"
        r23_4 = "ToggleShip"
        r21_4 = r21_4:[r23_4](r23_4, {
          Title = "Kill Ship",
          Description = "",
          Default = false,
        })
        r24_4 = "OnChanged"
        function r24_4(r0_10)
          -- line: [0, 0] id: 10
          _G.Ship = r0_10
        end
        r21_4:[r24_4](r24_4)
        r24_4 = "SetValue"
        r24_4 = false
        r5_4.ToggleShip:[r24_4](r24_4)
        function CheckPirateBoat()
          -- line: [0, 0] id: 278
          local r0_278 = {
            "PirateGrandBrigade",
            "PirateBrigade"
          }
          local r1_278 = next
          local r2_278, r3_278 = game:GetService("Workspace").Enemies:GetChildren()
          for r4_278, r5_278 in r1_278, r2_278, r3_278 do
            if table.find(r0_278, r5_278.Name) and r5_278:FindFirstChild("Health") and 0 < r5_278.Health.Value then
              return r5_278
            end
          end
        end
        spawn(function()
          -- line: [0, 0] id: 205
          while wait() do
            local r0_205 = _G.Ship
            if r0_205 then
              pcall(function()
                -- line: [0, 0] id: 206
                if CheckPirateBoat() then
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                  wait(0.5)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                  local r0_206 = CheckPirateBoat()
                  while true do
                    wait()
                    spawn(Tween(r0_206.Engine.CFrame * CFrame.new(0, -20, 0)), 1)
                    AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                    Skillaimbot = true
                    AutoSkill = false
                    if r0_206 then
                      local r1_206 = r0_206.Parent
                      if r1_206 then
                        r1_206 = r0_206.Health.Value
                        if r1_206 > 0 then
                          r1_206 = CheckPirateBoat()
                          if not r1_206 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  end
                  Skillaimbot = true
                  AutoSkill = false
                end
              end)
            end
          end
        end)
        r24_4 = "AddToggle"
        r24_4 = "ToggleGhostShip"
        r22_4 = r4_4.Main:[r24_4](r24_4, {
          Title = "Kill Ghost Ship",
          Description = "",
          Default = false,
        })
        r25_4 = "OnChanged"
        function r25_4(r0_450)
          -- line: [0, 0] id: 450
          _G.GhostShip = r0_450
        end
        r22_4:[r25_4](r25_4)
        r25_4 = "SetValue"
        r25_4 = false
        r5_4.ToggleGhostShip:[r25_4](r25_4)
        function CheckPirateBoat()
          -- line: [0, 0] id: 169
          local r0_169 = {
            "FishBoat"
          }
          local r1_169 = next
          local r2_169, r3_169 = game:GetService("Workspace").Enemies:GetChildren()
          for r4_169, r5_169 in r1_169, r2_169, r3_169 do
            if table.find(r0_169, r5_169.Name) and r5_169:FindFirstChild("Health") and 0 < r5_169.Health.Value then
              return r5_169
            end
          end
        end
        spawn(function()
          -- line: [0, 0] id: 443
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 444
              if _G.bjirFishBoat and CheckPirateBoat() then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                wait(0.5)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                local r0_444 = CheckPirateBoat()
                while true do
                  wait()
                  spawn(Tween(r0_444.Engine.CFrame * CFrame.new(0, -20, 0), 1))
                  AutoSkill = true
                  Skillaimbot = true
                  AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
                  if not r0_444.Parent then
                    local r1_444 = r0_444.Health.Value
                    if r1_444 > 0 then
                      r1_444 = CheckPirateBoat()
                      if not r1_444 then
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                end
                AutoSkill = false
                Skillaimbot = false
              end
            end)
          end
        end)
        spawn(function()
          -- line: [0, 0] id: 62
          while wait() do
            local r0_62 = _G.bjirFishBoat
            if r0_62 then
              pcall(function()
                -- line: [0, 0] id: 63
                if CheckPirateBoat() then
                  AutoHaki()
                  game:GetService("VirtualUser"):CaptureController()
                  game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                  for r3_63, r4_63 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if r4_63:IsA("Tool") and r4_63.ToolTip == "Melee" then
                      game.Players.LocalPlayer.Character.Humanoid:EquipTool(r4_63)
                    end
                  end
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  for r3_63, r4_63 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if r4_63:IsA("Tool") and r4_63.ToolTip == "Blox Fruit" then
                      game.Players.LocalPlayer.Character.Humanoid:EquipTool(r4_63)
                    end
                  end
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.6)
                  for r3_63, r4_63 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if r4_63:IsA("Tool") and r4_63.ToolTip == "Sword" then
                      game.Players.LocalPlayer.Character.Humanoid:EquipTool(r4_63)
                    end
                  end
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.5)
                  for r3_63, r4_63 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if r4_63:IsA("Tool") and r4_63.ToolTip == "Gun" then
                      game.Players.LocalPlayer.Character.Humanoid:EquipTool(r4_63)
                    end
                  end
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  wait(0.2)
                  game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                  game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                end
              end)
            end
          end
        end)
        r23_4 = r4_4.Main:AddSection("Elite Hunter Farm")
        r26_4 = "AddParagraph"
        r26_4 = {
          Title = "Check Elite",
          Content = "Status: ",
        }
        r24_4 = r4_4.Main:[r26_4](r26_4)
        spawn(function()
          -- line: [0, 0] id: 371
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 372
              if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                r24_4:SetDesc("Elite Boss :       yes | Killed:  " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
              else
                r24_4:SetDesc("Elite Boss :       no | Killed: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
              end
            end)
          end
        end)
        r27_4 = "AddToggle"
        r27_4 = "ToggleElite"
        r28_4 = {}
        r29_4 = "Auto Elite Hunter"
        r28_4.Title = r29_4
        r28_4.Description = ""
        r29_4 = "Default"
        r28_4[r29_4] = false
        r25_4 = r4_4.Main:[r27_4](r27_4, r28_4)
        r28_4 = "OnChanged"
        function r28_4(r0_226)
          -- line: [0, 0] id: 226
          _G.AutoElite = r0_226
        end
        r25_4:[r28_4](r28_4)
        r28_4 = "SetValue"
        r28_4 = false
        r5_4.ToggleElite:[r28_4](r28_4)
        spawn(function()
          -- line: [0, 0] id: 262
          while task.wait() do
            local r0_262 = _G.AutoElite
            if r0_262 then
              pcall(function()
                -- line: [0, 0] id: 263
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                  if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                      for r3_263, r4_263 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if r4_263:FindFirstChild("Humanoid") and r4_263:FindFirstChild("HumanoidRootPart") and 0 < r4_263.Humanoid.Health and (r4_263.Name == "Diablo" or r4_263.Name == "Deandre" or r4_263.Name == "Urban") then
                          while true do
                            wait(_G.Fast_Delay)
                            AttackNoCoolDown()
                            EquipTool(SelectWeapon)
                            AutoHaki()
                            toTarget(r4_263.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                            MonsterPosition = r4_263.HumanoidRootPart.CFrame
                            r4_263.HumanoidRootPart.CFrame = r4_263.HumanoidRootPart.CFrame
                            r4_263.Humanoid.JumpPower = 0
                            r4_263.Humanoid.WalkSpeed = 0
                            r4_263.HumanoidRootPart.CanCollide = false
                            r4_263.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            if _G.AutoElite ~= false then
                              local r5_263 = r4_263.Humanoid.Health
                              if r5_263 > 0 then
                                r5_263 = r4_263.Parent
                                if not r5_263 then
                                  break
                                end
                              else
                                break
                              end
                            else
                              break
                            end
                          end
                        end
                      end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                      toTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                      toTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                      toTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                    end
                  end
                else
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                end
              end)
            end
          end
        end)
        -- close: r12_4
      end
      r12_4 = Third_Sea
      if r12_4 then
        r12_4 = r4_4.Main
        r14_4 = "Sea Beast"
        r12_4 = r12_4:AddSection(r14_4)
        r13_4 = r4_4.Main
        r15_4 = "AddToggle"
        r15_4 = "ToggleSeaBeAst"
        r13_4 = r13_4:[r15_4](r15_4, {
          Title = "Auto Sea Beast",
          Description = "",
          Default = false,
        })
        r16_4 = "OnChanged"
        function r16_4(r0_224)
          -- line: [0, 0] id: 224
          _G.AutoSeaBeast = r0_224
        end
        r13_4:[r16_4](r16_4)
        r14_4 = "ToggleSeaBeAst"
        r14_4 = r5_4[r14_4]
        r16_4 = "SetValue"
        r16_4 = false
        r14_4:[r16_4](r16_4)
        r14_4 = true
        Skillz = r14_4
        r14_4 = true
        Skillx = r14_4
        r14_4 = true
        Skillc = r14_4
        r14_4 = true
        Skillv = r14_4
        r14_4 = spawn
        r14_4(function()
          -- line: [0, 0] id: 298
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 299
              if AutoSkill then
                if Skillz then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                  wait(0.1)
                  game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                end
                if Skillx then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                  wait(0.1)
                  game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                end
                if Skillc then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                  wait(0.1)
                  game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                end
                if Skillv then
                  game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                  wait(0.1)
                  game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                end
              end
            end)
          end
        end)
        r14_4 = task
        r14_4 = r14_4.spawn
        r14_4(function()
          -- line: [0, 0] id: 321
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 322
              if _G.AutoSeaBeast then
                if not game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
                  if not game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                    if not game:GetService("Workspace").Boats:FindFirstChild("PirateBasic") then
                      if not game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                        buyb = TweenBoat(CFrame.new(-4513.90087890625, 16.76398277282715, -2658.820556640625))
                        if (CFrame.new(-4513.90087890625, 16.76398277282715, -2658.820556640625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                          if buyb then
                            buyb:Stop()
                          end
                          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                            [1] = "BuyBoat",
                            [2] = "PirateGrandBrigade",
                          }))
                        end
                      elseif game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                          TweenBoat(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                        elseif game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                          wait(_G.Fast_Delay)
                          if (game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 10 then
                            TweenShip(CFrame.new(35.04552459716797, 17.750778198242188, 4819.267578125))
                          end
                          if not game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") and _G.AutoSeaBeast ~= false and game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                            for r3_322, r4_322 in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                              if r4_322.Name == "PirateGrandBrigade" and r4_322:FindFirstChild("VehicleSeat") then
                                while true do
                                  wait(_G.Fast_Delay)
                                  game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                  TweenBoat(r4_322.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                  if game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                                    local r5_322 = _G.AutoSeaBeast
                                    if r5_322 == false then
                                      break
                                    end
                                  else
                                    break
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    else
                      goto label_184	-- block#17 is visited secondly
                    end
                  elseif game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                    for r3_322, r4_322 in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                      if r4_322.Name == "PirateGrandBrigade" and r4_322:FindFirstChild("VehicleSeat") then
                        while true do
                          wait(_G.Fast_Delay)
                          game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                          TweenBoat(r4_322.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                          if game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                            local r5_322 = _G.AutoSeaBeast
                            if r5_322 == false then
                              break
                            end
                          else
                            break
                          end
                        end
                      end
                    end
                  end
                elseif game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
                  for r3_322, r4_322 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if r4_322:FindFirstChild("HumanoidRootPart") then
                      while true do
                        wait(_G.Fast_Delay)
                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                        TweenBoat(r4_322.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                        EquipAllWeapon()
                        AutoSkill = true
                        AimBotSkillPosition = r4_322.HumanoidRootPart
                        Skillaimbot = true
                        if r4_322:FindFirstChild("HumanoidRootPart") then
                          local r5_322 = _G.AutoSeaBeast
                          if r5_322 == false then
                            break
                          end
                        else
                          break
                        end
                      end
                      AutoSkill = false
                      Skillaimbot = false
                    end
                  end
                end
              end
            end)
          end
        end)
        r14_4 = r4_4.Main
        r16_4 = "AddToggle"
        r16_4 = "ToggleAutoW"
        r14_4 = r14_4:[r16_4](r16_4, {
          Title = "Auto Press W",
          Description = "",
          Default = false,
        })
        r17_4 = "OnChanged"
        function r17_4(r0_389)
          -- line: [0, 0] id: 389
          _G.AutoW = r0_389
        end
        r14_4:[r17_4](r17_4)
        r17_4 = "SetValue"
        r17_4 = false
        r5_4.ToggleAutoW:[r17_4](r17_4)
        spawn(function()
          -- line: [0, 0] id: 135
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 136
              if _G.AutoW then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
              end
            end)
          end
        end)
        r15_4 = r4_4.Main:AddSection("Mirage Island")
        r18_4 = "AddParagraph"
        r18_4 = {
          Title = "Status",
          Content = "Status:",
        }
        r16_4 = r4_4.Main:[r18_4](r18_4)
        task.spawn(function()
          -- line: [0, 0] id: 179
          while task.wait() do
            pcall(function()
              -- line: [0, 0] id: 180
              if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
                FullMoonStatus = "100%"
              elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
                FullMoonStatus = "75%"
              elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
                FullMoonStatus = "50%"
              elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
                FullMoonStatus = "25%"
              elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
                FullMoonStatus = "15%"
              else
                FullMoonStatus = "0%"
              end
            end)
          end
        end)
        task.spawn(function()
          -- line: [0, 0] id: 17
          while task.wait() do
            pcall(function()
              -- line: [0, 0] id: 18
              if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
                MirageStatus = "     yes"
              else
                MirageStatus = "     no"
              end
            end)
          end
        end)
        spawn(function()
          -- line: [0, 0] id: 273
          pcall(function()
            -- line: [0, 0] id: 274
            while wait() do
              r16_4:SetDesc("Mirage Island: " .. MirageStatus .. " | Full Moon: " .. FullMoonStatus)
            end
          end)
        end)
        r19_4 = "AddButton"
        r19_4 = {
          Title = "Tween to Mirage Island",
          Description = "",
        }
        function r21_4()
          -- line: [0, 0] id: 160
          TweenMirage()
        end
        r19_4.Callback = r21_4
        r4_4.Main:[r19_4](r19_4)
        function TweenMirage()
          -- line: [0, 0] id: 97
          repeat
            wait()
          until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
          if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
            AllNPCS = getnilinstances()
            for r3_97, r4_97 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
              table.insert(AllNPCS, r4_97)
            end
            for r3_97, r4_97 in pairs(AllNPCS) do
              if r4_97.Name == "Advanced Fruit Dealer" then
                Tween2(r4_97.HumanoidRootPart.CFrame)
              end
            end
          end
        end
        r19_4 = "AddButton"
        r19_4 = {
          Title = "Tween to Highest Point",
          Description = "",
        }
        function r21_4()
          -- line: [0, 0] id: 441
          TwenetoHighestPoint()
        end
        r19_4.Callback = r21_4
        r4_4.Main:[r19_4](r19_4)
        function TwenetoHighestPoint()
          -- line: [0, 0] id: 197
          HighestPoint = getHighestPoint()
          if HighestPoint then
            Tween2(HighestPoint.CFrame * CFrame.new(0, 211.88, 0))
          end
        end
        function getHighestPoint()
          -- line: [0, 0] id: 181
          if not game.workspace.Map:FindFirstChild("MysticIsland") then
            return nil
          end
          for r3_181, r4_181 in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
            if r4_181:IsA("MeshPart") and r4_181.MeshId == "rbxassetid://6745037796" then
              return r4_181
            end
          end
        end
        r19_4 = "AddToggle"
        r19_4 = "ToggleTweenGear"
        r20_4 = {}
        r21_4 = "Tween To Gear"
        r20_4.Title = r21_4
        r20_4.Description = ""
        r21_4 = "Default"
        r20_4[r21_4] = false
        r17_4 = r4_4.Main:[r19_4](r19_4, r20_4)
        r20_4 = "OnChanged"
        function r20_4(r0_194)
          -- line: [0, 0] id: 194
          _G.TweenToGear = r0_194
        end
        r17_4:[r20_4](r20_4)
        r20_4 = "SetValue"
        r20_4 = false
        r5_4.ToggleTweenGear:[r20_4](r20_4)
        spawn(function()
          -- line: [0, 0] id: 59
          pcall(function()
            -- line: [0, 0] id: 60
            while wait() do
              local r0_60 = _G.TweenToGear
              if r0_60 then
                r0_60 = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if r0_60 then
                  r0_60 = pairs
                  for r3_60, r4_60 in r0_60(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                    if r4_60:IsA("MeshPart") and r4_60.Material == Enum.Material.Neon then
                      Tween2(r4_60.CFrame)
                    end
                  end
                end
              end
            end
          end)
        end)
        r20_4 = "AddToggle"
        r20_4 = "Togglelockmoon"
        r21_4 = {
          Title = "Lock Moon and Use Race Skill",
          Description = "",
          Default = false,
        }
        r18_4 = r4_4.Main:[r20_4](r20_4, r21_4)
        r21_4 = "OnChanged"
        function r21_4(r0_236)
          -- line: [0, 0] id: 236
          _G.AutoLockMoon = r0_236
        end
        r18_4:[r21_4](r21_4)
        r21_4 = "SetValue"
        r21_4 = false
        r5_4.Togglelockmoon:[r21_4](r21_4)
        spawn(function()
          -- line: [0, 0] id: 68
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 69
              if _G.AutoLockMoon then
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, game.Workspace.CurrentCamera.CFrame.p + game.Lighting:GetMoonDirection() * 100)
              end
            end)
          end
        end)
        spawn(function()
          -- line: [0, 0] id: 243
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 244
              if _G.AutoLockMoon then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
              end
            end)
          end
        end)
        r21_4 = "AddToggle"
        r21_4 = "ToggleMirage"
        r22_4 = {
          Title = "Auto Mirage Island",
          Description = "",
        }
        r24_4 = false
        r22_4.Default = r24_4
        r19_4 = r4_4.Main:[r21_4](r21_4, r22_4)
        r22_4 = "OnChanged"
        function r22_4(r0_184)
          -- line: [0, 0] id: 184
          _G.AutoSeaBeast = r0_184
        end
        r19_4:[r22_4](r22_4)
        r22_4 = "SetValue"
        r22_4 = false
        r5_4.ToggleMirage:[r22_4](r22_4)
        r22_4 = "AddToggle"
        r22_4 = "AutoW"
        r23_4 = {}
        r24_4 = "Auto Press W"
        r23_4.Title = r24_4
        r23_4.Description = ""
        r24_4 = "Default"
        r23_4[r24_4] = false
        r20_4 = r4_4.Main:[r22_4](r22_4, r23_4)
        r23_4 = "OnChanged"
        function r23_4(r0_301)
          -- line: [0, 0] id: 301
          _G.AutoW = r0_301
        end
        r20_4:[r23_4](r23_4)
        r21_4 = "AutoW"
        r21_4 = r5_4[r21_4]
        r23_4 = "SetValue"
        r23_4 = false
        r21_4:[r23_4](r23_4)
        r21_4 = spawn
        r21_4(function()
          -- line: [0, 0] id: 383
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 384
              if _G.AutoW then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
              end
            end)
          end
        end)
        -- close: r12_4
      end
      r12_4 = r4_4.Main
      r14_4 = "Items Farm"
      r12_4 = r12_4:AddSection(r14_4)
      r13_4 = Third_Sea
      if r13_4 then
        r13_4 = r4_4.Main
        r15_4 = "AddToggle"
        r15_4 = "ToggleHallow"
        r16_4 = {}
        r16_4.Title = "Auto Hallow Scythe [Fully]"
        r16_4.Description = ""
        r16_4.Default = false
        r13_4 = r13_4:[r15_4](r15_4, r16_4)
        r16_4 = "OnChanged"
        function r16_4(r0_78)
          -- line: [0, 0] id: 78
          AutoHallowSycthe = r0_78
        end
        r13_4:[r16_4](r16_4)
        r14_4 = "ToggleHallow"
        r14_4 = r5_4[r14_4]
        r16_4 = "SetValue"
        r16_4 = false
        r14_4:[r16_4](r16_4)
        r14_4 = spawn
        r14_4(function()
          -- line: [0, 0] id: 416
          while wait() do
            local r0_416 = AutoHallowSycthe
            if r0_416 then
              pcall(function()
                -- line: [0, 0] id: 417
                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                  for r3_417, r4_417 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if string.find(r4_417.Name, "Soul Reaper") then
                      while true do
                        wait(_G.Fast_Delay)
                        AttackNoCoolDown()
                        AutoHaki()
                        EquipTool(SelectWeapon)
                        r4_417.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        toTarget(r4_417.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        r4_417.HumanoidRootPart.Transparency = 1
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        if r4_417.Humanoid.Health > 0 then
                          local r5_417 = AutoHallowSycthe
                          if r5_417 == false then
                            break
                          end
                        else
                          break
                        end
                      end
                    end
                  end
                elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                  repeat
                    toTarget(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                    wait()
                  until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                  wait(0.5)
                  EquipTool("Hallow Essence")
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                  toTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
              end)
            end
          end
        end)
        r14_4 = spawn
        r14_4(function()
          -- line: [0, 0] id: 409
          while wait(0.001) do
            local r0_409 = AutoHallowSycthe
            if r0_409 then
              r0_409 = {}
              r0_409[1] = "Bones"
              r0_409[2] = "Buy"
              r0_409[3] = 1
              r0_409[4] = 1
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_409))
            end
          end
        end)
        r14_4 = r4_4.Main
        r16_4 = "AddToggle"
        r16_4 = "ToggleYama"
        r14_4 = r14_4:[r16_4](r16_4, {
          Title = "Auto Get Yama",
          Description = "",
          Default = false,
        })
        r17_4 = "OnChanged"
        function r17_4(r0_401)
          -- line: [0, 0] id: 401
          _G.AutoYama = r0_401
        end
        r14_4:[r17_4](r17_4)
        r17_4 = "SetValue"
        r17_4 = false
        r5_4.ToggleYama:[r17_4](r17_4)
        function r16_4()
          -- line: [0, 0] id: 330
          while wait() do
            local r0_330 = _G.AutoYama
            if r0_330 then
              r0_330 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
              if r0_330 >= 30 then
                while true do
                  wait(0.1)
                  fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                  r0_330 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama")
                  if not r0_330 then
                    r0_330 = _G.AutoYama
                    if not r0_330 then
                      goto label_49	-- block#5 is visited secondly
                    end
                  end
                end
              end
            end
          end
        end
        spawn(r16_4)
        r17_4 = "AddToggle"
        r17_4 = "ToggleTushita"
        r15_4 = r4_4.Main:[r17_4](r17_4, {
          Title = "Auto Tushita",
          Description = "",
          Default = false,
        })
        r18_4 = "OnChanged"
        function r18_4(r0_54)
          -- line: [0, 0] id: 54
          AutoTushita = r0_54
        end
        r15_4:[r18_4](r18_4)
        r16_4 = "ToggleTushita"
        r16_4 = r5_4[r16_4]
        r18_4 = "SetValue"
        r18_4 = false
        r16_4:[r18_4](r18_4)
        r16_4 = spawn
        r16_4(function()
          -- line: [0, 0] id: 167
          while wait() do
            local r0_167 = AutoTushita
            if r0_167 then
              r0_167 = game:GetService("Workspace").Enemies:FindFirstChild("Longma")
              if r0_167 then
                r0_167 = pairs
                for r3_167, r4_167 in r0_167(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_167.Name == ("Longma" or r4_167.Name == "Longma") and 0 < r4_167.Humanoid.Health and r4_167:IsA("Model") and r4_167:FindFirstChild("Humanoid") and r4_167:FindFirstChild("HumanoidRootPart") then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      AutoHaki()
                      if not game.Players.LocalPlayer.Character:FindFirstChild(SelectWeapon) then
                        wait()
                        EquipTool(SelectWeapon)
                      end
                      FarmPos = r4_167.HumanoidRootPart.CFrame
                      r4_167.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      r4_167.Humanoid.JumpPower = 0
                      r4_167.Humanoid.WalkSpeed = 0
                      r4_167.HumanoidRootPart.CanCollide = false
                      r4_167.Humanoid:ChangeState(11)
                      Tween(r4_167.HumanoidRootPart.CFrame * Pos)
                      local r5_167 = AutoTushita
                      if r5_167 then
                        r5_167 = r4_167.Parent
                        if r5_167 then
                          r5_167 = r4_167.Humanoid.Health
                          if r5_167 <= 0 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              else
                Tween(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
              end
            end
          end
        end)
        r16_4 = r4_4.Main
        r18_4 = "AddToggle"
        r18_4 = "ToggleHoly"
        r19_4 = {
          Title = "Auto Holy Torch",
          Description = "",
        }
        r21_4 = false
        r19_4.Default = r21_4
        r16_4 = r16_4:[r18_4](r18_4, r19_4)
        r19_4 = "OnChanged"
        function r19_4(r0_140)
          -- line: [0, 0] id: 140
          _G.Auto_Holy_Torch = r0_140
        end
        r16_4:[r19_4](r19_4)
        r19_4 = "SetValue"
        r19_4 = false
        r5_4.ToggleHoly:[r19_4](r19_4)
        spawn(function()
          -- line: [0, 0] id: 435
          while wait() do
            local r0_435 = _G.Auto_Holy_Torch
            if r0_435 then
              pcall(function()
                -- line: [0, 0] id: 436
                wait(1)
                while true do
                  Tween(CFrame.new(-10752, 417, -9366))
                  wait()
                  if _G.Auto_Holy_Torch then
                    local r0_436 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-10752, 417, -9366)).Magnitude
                    if r0_436 <= 10 then
                      break
                    end
                  else
                    break
                  end
                end
                wait(1)
                while true do
                  Tween(CFrame.new(-11672, 334, -9474))
                  wait()
                  if _G.Auto_Holy_Torch then
                    local r0_436 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-11672, 334, -9474)).Magnitude
                    if r0_436 <= 10 then
                      break
                    end
                  else
                    break
                  end
                end
                wait(1)
                while true do
                  Tween(CFrame.new(-12132, 521, -10655))
                  wait()
                  if _G.Auto_Holy_Torch then
                    local r0_436 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-12132, 521, -10655)).Magnitude
                    if r0_436 <= 10 then
                      break
                    end
                  else
                    break
                  end
                end
                wait(1)
                while true do
                  Tween(CFrame.new(-13336, 486, -6985))
                  wait()
                  if _G.Auto_Holy_Torch then
                    local r0_436 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13336, 486, -6985)).Magnitude
                    if r0_436 <= 10 then
                      break
                    end
                  else
                    break
                  end
                end
                wait(1)
                while true do
                  Tween(CFrame.new(-13489, 332, -7925))
                  wait()
                  if _G.Auto_Holy_Torch then
                    local r0_436 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-13489, 332, -7925)).Magnitude
                    if r0_436 <= 10 then
                      break
                    end
                  else
                    break
                  end
                end
              end)
            end
          end
        end)
      end
      r13_4 = Second_Sea
      if r13_4 then
        r13_4 = r4_4.Main
        r15_4 = "AddToggle"
        r15_4 = "ToggleFactory"
        r16_4 = {}
        r16_4.Title = "Auto Farm Factory"
        r16_4.Description = ""
        r16_4.Default = false
        r13_4 = r13_4:[r15_4](r15_4, r16_4)
        r16_4 = "OnChanged"
        function r16_4(r0_144)
          -- line: [0, 0] id: 144
          _G.Factory = r0_144
        end
        r13_4:[r16_4](r16_4)
        r14_4 = "ToggleFactory"
        r14_4 = r5_4[r14_4]
        r16_4 = "SetValue"
        r16_4 = false
        r14_4:[r16_4](r16_4)
        r14_4 = spawn
        r14_4(function()
          -- line: [0, 0] id: 36
          while wait() do
            local r0_36 = _G.Factory
            if r0_36 then
              r0_36 = game.Workspace.Enemies:FindFirstChild("Core")
              if r0_36 then
                r0_36 = pairs
                for r3_36, r4_36 in r0_36(game.Workspace.Enemies:GetChildren()) do
                  if r4_36.Name == "Core" and 0 < r4_36.Humanoid.Health then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      while true do
                        Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                        wait()
                        local r5_36 = _G.Factory
                        if r5_36 then
                          r5_36 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude
                          if r5_36 <= 10 then
                            break
                          end
                        else
                          break
                        end
                      end
                      EquipTool(SelectWeapon)
                      AutoHaki()
                      Tween(r4_36.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                      r4_36.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                      r4_36.HumanoidRootPart.Transparency = 1
                      r4_36.Humanoid.JumpPower = 0
                      r4_36.Humanoid.WalkSpeed = 0
                      r4_36.HumanoidRootPart.CanCollide = false
                      FarmPos = r4_36.HumanoidRootPart.CFrame
                      MonFarm = r4_36.Name
                      local r5_36 = r4_36.Parent
                      if r5_36 then
                        r5_36 = r4_36.Humanoid.Health
                        if r5_36 > 0 then
                          r5_36 = _G.Factory
                          if r5_36 == false then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              else
                r0_36 = game.ReplicatedStorage:FindFirstChild("Core")
                if r0_36 then
                  while true do
                    Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                    wait()
                    r0_36 = _G.Factory
                    if r0_36 then
                      r0_36 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude
                      if r0_36 <= 10 then
                        goto label_155	-- block#17 is visited secondly
                      end
                    end
                  end
                end
              end
            end
          end
        end)
      end
      r13_4 = Third_Sea
      if r13_4 then
        r13_4 = r4_4.Main
        r15_4 = "AddToggle"
        r15_4 = "ToggleCakeV2"
        r16_4 = {}
        r16_4.Title = "Kill Dought King [Need Spawn]"
        r16_4.Description = ""
        r16_4.Default = false
        r13_4 = r13_4:[r15_4](r15_4, r16_4)
        r16_4 = "OnChanged"
        function r16_4(r0_96)
          -- line: [0, 0] id: 96
          _G.AutoCakeV2 = r0_96
        end
        r13_4:[r16_4](r16_4)
        r14_4 = "ToggleCakeV2"
        r14_4 = r5_4[r14_4]
        r16_4 = "SetValue"
        r16_4 = false
        r14_4:[r16_4](r16_4)
      end
      r13_4 = spawn
      function r14_4()
        -- line: [0, 0] id: 349
        while wait() do
          local r0_349 = _G.AutoCakeV2
          if r0_349 then
            pcall(function()
              -- line: [0, 0] id: 350
              if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                for r3_350, r4_350 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_350.Name == "Dough King" and r4_350:FindFirstChild("Humanoid") and r4_350:FindFirstChild("HumanoidRootPart") and 0 < r4_350.Humanoid.Health then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      r4_350.HumanoidRootPart.CanCollide = false
                      r4_350.Humanoid.WalkSpeed = 0
                      r4_350.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                      Tween(r4_350.HumanoidRootPart.CFrame * Pos)
                      if _G.AutoCakeV2 then
                        local r5_350 = r4_350.Parent
                        if r5_350 then
                          r5_350 = r4_350.Humanoid.Health
                          if r5_350 <= 0 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              elseif game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
              end
            end)
          end
        end
      end
      r13_4(r14_4)
      r13_4 = Second_Sea
      if not r13_4 then
        r13_4 = Third_Sea
        if r13_4 then
          ::label_2056::
          r13_4 = r4_4.Main
          r15_4 = "AddToggle"
          r15_4 = "ToggleHakiColor"
          r16_4 = {}
          r16_4.Title = "Buy Haki Color"
          r16_4.Description = ""
          r16_4.Default = false
          r13_4 = r13_4:[r15_4](r15_4, r16_4)
          r16_4 = "OnChanged"
          function r16_4(r0_270)
            -- line: [0, 0] id: 270
            _G.Auto_Buy_Enchancement = r0_270
          end
          r13_4:[r16_4](r16_4)
          r14_4 = "ToggleHakiColor"
          r14_4 = r5_4[r14_4]
          r16_4 = "SetValue"
          r16_4 = false
          r14_4:[r16_4](r16_4)
          r14_4 = spawn
          r14_4(function()
            -- line: [0, 0] id: 406
            while wait() do
              local r0_406 = _G.Auto_Buy_Enchancement
              if r0_406 then
                r0_406 = {}
                r0_406[1] = "ColorsDealer"
                r0_406[2] = "2"
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_406))
              end
            end
          end)
        end
      else
        goto label_2056	-- block#62 is visited secondly
      end
      r13_4 = Second_Sea
      if r13_4 then
        r13_4 = r4_4.Main
        r15_4 = "AddToggle"
        r15_4 = "ToggleSwordLengend"
        r16_4 = {}
        r16_4.Title = "Buy Sword Lengendary"
        r16_4.Description = ""
        r16_4.Default = false
        r13_4 = r13_4:[r15_4](r15_4, r16_4)
        r16_4 = "OnChanged"
        function r16_4(r0_81)
          -- line: [0, 0] id: 81
          _G.BuyLengendSword = r0_81
        end
        r13_4:[r16_4](r16_4)
        r14_4 = "ToggleSwordLengend"
        r14_4 = r5_4[r14_4]
        r16_4 = "SetValue"
        r16_4 = false
        r14_4:[r16_4](r16_4)
        r14_4 = spawn
        r14_4(function()
          -- line: [0, 0] id: 427
          while wait(0.1) do
            pcall(function()
              -- line: [0, 0] id: 428
              if _G.BuyLengendSword or Triple_A then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                  [1] = "LegendarySwordDealer",
                  [2] = "2",
                }))
              else
                wait(2)
              end
            end)
          end
        end)
      end
      r13_4 = Second_Sea
      if r13_4 then
        r13_4 = r4_4.Main
        r15_4 = "AddToggle"
        r15_4 = "ToggleEvoRace"
        r16_4 = {}
        r16_4.Title = "Auto Evo Race"
        r16_4.Description = ""
        r16_4.Default = false
        r13_4 = r13_4:[r15_4](r15_4, r16_4)
        r16_4 = "OnChanged"
        function r16_4(r0_357)
          -- line: [0, 0] id: 357
          _G.AutoEvoRace = r0_357
        end
        r13_4:[r16_4](r16_4)
        r14_4 = "ToggleEvoRace"
        r14_4 = r5_4[r14_4]
        r16_4 = "SetValue"
        r16_4 = false
        r14_4:[r16_4](r16_4)
        r14_4 = spawn
        r14_4(function()
          -- line: [0, 0] id: 285
          while task.wait() do
            pcall(function()
              -- line: [0, 0] id: 286
              if _G.AutoEvoRace then
                local r0_286 = game.Players.LocalPlayer.Backpack
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
                if r0_286:FindFirstChild("Flower 2") then
                  if r0_286:FindFirstChild("Flower 1") then
                    Tween(CFrame.new(-5497.06152, 47.5923004, -795.237061))
                    for r4_286, r5_286 in pairs(game.Workspace.Enemies:GetChildren()) do
                      if r5_286.Name == "Zombie" then
                        repeat
                          task.wait()
                          EquipTool(SelectWeapon)
                          Tween(r5_286.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                        until r0_286:FindFirstChild("Flower 3")
                      end
                    end
                  else
                    Tween(game.Workspace.Flower1.CFrame)
                  end
                else
                  Tween(game.Workspace.Flower2.CFrame)
                end
                if r0_286:FindFirstChild("Flower 1") and r0_286:FindFirstChild("Flower 2") and r0_286:FindFirstChild("Flower 3") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1")
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                end
                for r4_286, r5_286 in pairs(game.Workspace:GetChildren()) do
                  if r5_286.Name == "Flower1" or r5_286.Name == "Flower2" then
                    r5_286.Size = Vector3.new(20, 20, 20)
                  end
                end
              end
            end)
          end
        end)
      end
      r13_4 = r4_4.Setting
      r13_4 = r13_4:AddSection("Farming")
      r14_4 = r4_4.Setting
      r16_4 = "AddToggle"
      r16_4 = "ToggleFast"
      r14_4 = r14_4:[r16_4](r16_4, {
        Title = "Enabled Fast Attack",
        Description = "",
        Default = true,
      })
      r17_4 = "OnChanged"
      function r17_4(r0_214)
        -- line: [0, 0] id: 214
        _G.FastNe = r0_214
      end
      r14_4:[r17_4](r17_4)
      r17_4 = "SetValue"
      r17_4 = true
      r5_4.ToggleFast:[r17_4](r17_4)
      r16_4 = game
      r16_4 = r16_4.ReplicatedStorage
      r16_4 = r16_4.Util
      r16_4 = r16_4.CameraShaker
      r15_4 = require(r16_4)
      r16_4 = require
      r16_4 = r16_4(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
      CombatFrameworkR = r16_4
      r16_4 = debug
      r16_4 = r16_4.getupvalues
      r16_4 = r16_4(CombatFrameworkR)
      r16_4 = r16_4[2]
      y = r16_4
      r16_4 = spawn
      r16_4(function()
        -- line: [0, 0] id: 137
        game:GetService("RunService").RenderStepped:Connect(function()
          -- line: [0, 0] id: 138
          if _G.FastNe and typeof(y) == "table" then
            pcall(function()
              -- line: [0, 0] id: 139
              r15_4:Stop()
              y.activeController.timeToNextAttack = math.huge ^ math.huge ^ math.huge
              y.activeController.timeToNextAttack = 0
              y.activeController.hitboxMagnitude = 60
              y.activeController.active = false
              y.activeController.timeToNextBlock = 0
              y.activeController.focusStart = 1655503339.0980349
              y.activeController.increment = 1
              y.activeController.blocking = false
              y.activeController.attacking = false
              y.activeController.humanoid.AutoRotate = true
            end)
          end
        end)
      end)
      r16_4 = r4_4.Setting
      r18_4 = "AddToggle"
      r18_4 = "ToggleBringMob"
      r19_4 = {
        Title = "Enabled Bring Mob / Magnet",
        Description = "",
      }
      r21_4 = true
      r19_4.Default = r21_4
      r16_4 = r16_4:[r18_4](r18_4, r19_4)
      r19_4 = "OnChanged"
      function r19_4(r0_407)
        -- line: [0, 0] id: 407
        _G.BringMob = r0_407
      end
      r16_4:[r19_4](r19_4)
      r19_4 = "SetValue"
      r19_4 = true
      r5_4.ToggleBringMob:[r19_4](r19_4)
      spawn(function()
        -- line: [0, 0] id: 118
        while wait() do
          pcall(function()
            -- line: [0, 0] id: 119
            for r3_119, r4_119 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
              if _G.BringMob and bringmob and r4_119.Name == MonFarm and r4_119:FindFirstChild("Humanoid") and 0 < r4_119.Humanoid.Health and r4_119.Name == MonFarm and (r4_119.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 250 then
                r4_119.Head.CanCollide = false
                r4_119.HumanoidRootPart.CanCollide = false
                r4_119.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                r4_119.HumanoidRootPart.CFrame = FarmPos
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
              end
            end
            -- warn: not visited block [8]
            -- block#8:
            -- -- <empty>
            -- r4_119.Head.CanCollide = false
            -- -- <empty>
            -- r4_119.HumanoidRootPart.CanCollide = false
            -- -- <empty>
            -- -- <empty>
            -- r4_119.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
            -- -- <empty>
            -- -- <empty>
            -- r4_119.HumanoidRootPart.CFrame = FarmPos
            -- sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            -- goto label_100
          end)
        end
      end)
      r19_4 = "AddToggle"
      r19_4 = "ToggleBypassTP"
      r20_4 = {}
      r21_4 = "Enabled Bypass Tp"
      r20_4.Title = r21_4
      r20_4.Description = ""
      r21_4 = "Default"
      r20_4[r21_4] = false
      r17_4 = r4_4.Setting:[r19_4](r19_4, r20_4)
      r20_4 = "OnChanged"
      function r20_4(r0_422)
        -- line: [0, 0] id: 422
        BypassTP = r0_422
      end
      r17_4:[r20_4](r20_4)
      r20_4 = "SetValue"
      r20_4 = false
      r5_4.ToggleBypassTP:[r20_4](r20_4)
      r20_4 = "AddToggle"
      r20_4 = "ToggleRemove"
      r21_4 = {
        Title = " Enabled Remove Dame Text",
        Description = "",
        Default = true,
      }
      r18_4 = r4_4.Setting:[r20_4](r20_4, r21_4)
      r21_4 = "OnChanged"
      function r21_4(r0_266)
        -- line: [0, 0] id: 266
        _G.RemoveDameText = r0_266
      end
      r18_4:[r21_4](r21_4)
      r21_4 = "SetValue"
      r21_4 = true
      r5_4.ToggleRemove:[r21_4](r21_4)
      spawn(function()
        -- line: [0, 0] id: 231
        while wait() do
          local r0_231 = _G.RemoveDameText
          if r0_231 then
            r0_231 = game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter
            r0_231.Enabled = false
          else
            r0_231 = game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter
            r0_231.Enabled = true
          end
        end
      end)
      r21_4 = "AddToggle"
      r21_4 = "ToggleRemoveNotify"
      r22_4 = {
        Title = " Enabled Remove All Notify",
        Description = "",
      }
      r24_4 = false
      r22_4.Default = r24_4
      r19_4 = r4_4.Setting:[r21_4](r21_4, r22_4)
      r22_4 = "OnChanged"
      function r22_4(r0_219)
        -- line: [0, 0] id: 219
        RemoveNotify = r0_219
      end
      r19_4:[r22_4](r22_4)
      r22_4 = "SetValue"
      r22_4 = false
      r5_4.ToggleRemoveNotify:[r22_4](r22_4)
      function r21_4()
        -- line: [0, 0] id: 351
        while wait() do
          local r0_351 = RemoveNotify
          if r0_351 then
            r0_351 = game.Players.LocalPlayer.PlayerGui.Notifications
            r0_351.Enabled = false
          else
            r0_351 = game.Players.LocalPlayer.PlayerGui.Notifications
            r0_351.Enabled = true
          end
        end
      end
      spawn(r21_4)
      r22_4 = "AddToggle"
      r22_4 = "ToggleWhite"
      r23_4 = {}
      r24_4 = " Enabled White Screen"
      r23_4.Title = r24_4
      r23_4.Description = ""
      r24_4 = "Default"
      r23_4[r24_4] = false
      r20_4 = r4_4.Setting:[r22_4](r22_4, r23_4)
      r23_4 = "OnChanged"
      function r23_4(r0_130)
        -- line: [0, 0] id: 130
        _G.WhiteScreen = r0_130
        if _G.WhiteScreen == true then
          game:GetService("RunService"):Set3dRenderingEnabled(false)
        elseif _G.WhiteScreen == false then
          game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
      end
      r20_4:[r23_4](r23_4)
      r21_4 = "ToggleWhite"
      r21_4 = r5_4[r21_4]
      r23_4 = "SetValue"
      r23_4 = false
      r21_4:[r23_4](r23_4)
      r21_4 = r4_4.Setting
      r21_4 = r21_4:AddSection("Skill Mastery")
      r24_4 = "AddToggle"
      r24_4 = "ToggleZ"
      r22_4 = r4_4.Setting:[r24_4](r24_4, {
        Title = "Skill Z",
        Description = "",
        Default = true,
      })
      r25_4 = "OnChanged"
      function r25_4(r0_79)
        -- line: [0, 0] id: 79
        SkillZ = r0_79
      end
      r22_4:[r25_4](r25_4)
      r25_4 = "SetValue"
      r25_4 = true
      r5_4.ToggleZ:[r25_4](r25_4)
      r25_4 = "AddToggle"
      r25_4 = "ToggleX"
      r23_4 = r4_4.Setting:[r25_4](r25_4, {
        Title = "Skill X",
        Description = "",
        Default = true,
      })
      r26_4 = "OnChanged"
      function r26_4(r0_284)
        -- line: [0, 0] id: 284
        SkillX = r0_284
      end
      r23_4:[r26_4](r26_4)
      r24_4 = "ToggleX"
      r24_4 = r5_4[r24_4]
      r26_4 = "SetValue"
      r26_4 = true
      r24_4:[r26_4](r26_4)
      r24_4 = r4_4.Setting
      r26_4 = "AddToggle"
      r26_4 = "ToggleC"
      r27_4 = {
        Title = "Skill C",
        Description = "",
      }
      r29_4 = true
      r27_4.Default = r29_4
      r24_4 = r24_4:[r26_4](r26_4, r27_4)
      r27_4 = "OnChanged"
      function r27_4(r0_320)
        -- line: [0, 0] id: 320
        SkillC = r0_320
      end
      r24_4:[r27_4](r27_4)
      r27_4 = "SetValue"
      r27_4 = true
      r5_4.ToggleC:[r27_4](r27_4)
      r27_4 = "AddToggle"
      r27_4 = "ToggleV"
      r28_4 = {}
      r29_4 = "Skill V"
      r28_4.Title = r29_4
      r28_4.Description = ""
      r29_4 = "Default"
      r28_4[r29_4] = true
      r25_4 = r4_4.Setting:[r27_4](r27_4, r28_4)
      r28_4 = "OnChanged"
      function r28_4(r0_84)
        -- line: [0, 0] id: 84
        SkillV = r0_84
      end
      r25_4:[r28_4](r28_4)
      r28_4 = "SetValue"
      r28_4 = true
      r5_4.ToggleV:[r28_4](r28_4)
      r28_4 = "AddToggle"
      r28_4 = "ToggleF"
      r29_4 = {}
      r29_4.Title = "Skill F"
      r29_4.Description = ""
      r31_4 = false
      r29_4.Default = r31_4
      r26_4 = r4_4.Setting:[r28_4](r28_4, r29_4)
      r29_4 = "OnChanged"
      function r29_4(r0_442)
        -- line: [0, 0] id: 442
        SkillF = r0_442
      end
      r26_4:[r29_4](r29_4)
      r29_4 = "SetValue"
      r29_4 = false
      r5_4.ToggleF:[r29_4](r29_4)
      r29_4 = "Distance Farm"
      r27_4 = r4_4.Setting:AddSection(r29_4)
      r30_4 = "AddSlider"
      r30_4 = "SliderPosX"
      r31_4 = {}
      r31_4.Title = "Pos X"
      r31_4.Description = ""
      r31_4.Default = 0
      r31_4.Min = -60
      r31_4.Max = 60
      r31_4.Rounding = 1
      function r31_4.Callback(r0_255)
        -- line: [0, 0] id: 255
        posX = r0_255
      end
      r28_4 = r4_4.Setting:[r30_4](r30_4, r31_4)
      r31_4 = "OnChanged"
      function r31_4(r0_34)
        -- line: [0, 0] id: 34
        posX = r0_34
      end
      r28_4:[r31_4](r31_4)
      r31_4 = "SetValue"
      r31_4 = 0
      r28_4:[r31_4](r31_4)
      r29_4 = r4_4.Setting
      r31_4 = "AddSlider"
      r31_4 = "SliderPosY"
      r29_4 = r29_4:[r31_4](r31_4, {
        Title = "Pos Y",
        Description = "",
        Default = 30,
        Min = -60,
        Max = 60,
        Rounding = 1,
        Callback = function(r0_280)
          -- line: [0, 0] id: 280
          posY = r0_280
        end,
      })
      local r32_4 = "OnChanged"
      function r32_4(r0_448)
        -- line: [0, 0] id: 448
        posY = r0_448
      end
      r29_4:[r32_4](r32_4)
      r32_4 = "SetValue"
      r32_4 = 30
      r29_4:[r32_4](r32_4)
      r32_4 = "AddSlider"
      r32_4 = "SliderPosZ"
      r30_4 = r4_4.Setting:[r32_4](r32_4, {
        Title = "Pos Z",
        Description = "",
        Default = 0,
        Min = -60,
        Max = 60,
        Rounding = 1,
        Callback = function(r0_215)
          -- line: [0, 0] id: 215
          posZ = r0_215
        end,
      })
      local r33_4 = "OnChanged"
      function r33_4(r0_202)
        -- line: [0, 0] id: 202
        posZ = r0_202
      end
      r30_4:[r33_4](r33_4)
      r33_4 = "SetValue"
      r33_4 = 0
      r30_4:[r33_4](r33_4)
      r31_4 = r4_4.Stats
      r33_4 = "AddToggle"
      r33_4 = "ToggleMelee"
      r31_4 = r31_4:[r33_4](r33_4, {
        Title = "Auto Melee",
        Description = "",
        Default = false,
      })
      local r34_4 = "OnChanged"
      function r34_4(r0_80)
        -- line: [0, 0] id: 80
        _G.Auto_Stats_Melee = r0_80
      end
      r31_4:[r34_4](r34_4)
      r34_4 = "SetValue"
      r34_4 = false
      r5_4.ToggleMelee:[r34_4](r34_4)
      r34_4 = "AddToggle"
      r34_4 = "ToggleDe"
      r32_4 = r4_4.Stats:[r34_4](r34_4, {
        Title = "Auto Defense",
        Description = "",
        Default = false,
      })
      local r35_4 = "OnChanged"
      function r35_4(r0_275)
        -- line: [0, 0] id: 275
        _G.Auto_Stats_Defense = r0_275
      end
      r32_4:[r35_4](r35_4)
      r35_4 = "SetValue"
      r35_4 = false
      r5_4.ToggleDe:[r35_4](r35_4)
      r35_4 = "AddToggle"
      r35_4 = "ToggleSword"
      r33_4 = r4_4.Stats:[r35_4](r35_4, {
        Title = "Auto Sword",
        Description = "",
        Default = false,
      })
      local r36_4 = "OnChanged"
      function r36_4(r0_168)
        -- line: [0, 0] id: 168
        _G.Auto_Stats_Sword = r0_168
      end
      r33_4:[r36_4](r36_4)
      r36_4 = "SetValue"
      r36_4 = false
      r5_4.ToggleSword:[r36_4](r36_4)
      r36_4 = "AddToggle"
      r36_4 = "ToggleGun"
      r34_4 = r4_4.Stats:[r36_4](r36_4, {
        Title = "Auto Gun",
        Description = "",
        Default = false,
      })
      local r37_4 = "OnChanged"
      function r37_4(r0_304)
        -- line: [0, 0] id: 304
        _G.Auto_Stats_Gun = r0_304
      end
      r34_4:[r37_4](r37_4)
      r37_4 = "SetValue"
      r37_4 = false
      r5_4.ToggleGun:[r37_4](r37_4)
      r37_4 = "AddToggle"
      r37_4 = "ToggleFruit"
      r35_4 = r4_4.Stats:[r37_4](r37_4, {
        Title = "Auto Demon Fruit",
        Description = "",
        Default = false,
      })
      local r38_4 = "OnChanged"
      function r38_4(r0_294)
        -- line: [0, 0] id: 294
        _G.Auto_Stats_Devil_Fruit = r0_294
      end
      r35_4:[r38_4](r38_4)
      r38_4 = "SetValue"
      r38_4 = false
      r5_4.ToggleFruit:[r38_4](r38_4)
      spawn(function()
        -- line: [0, 0] id: 341
        while wait() do
          local r0_341 = _G.Auto_Stats_Devil_Fruit
          if r0_341 then
            r0_341 = {}
            r0_341[1] = "AddPoint"
            r0_341[2] = "Demon Fruit"
            r0_341[3] = 3
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_341))
          end
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 418
        while wait() do
          local r0_418 = _G.Auto_Stats_Gun
          if r0_418 then
            r0_418 = {}
            r0_418[1] = "AddPoint"
            r0_418[2] = "Gun"
            r0_418[3] = 3
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_418))
          end
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 277
        while wait() do
          local r0_277 = _G.Auto_Stats_Sword
          if r0_277 then
            r0_277 = {}
            r0_277[1] = "AddPoint"
            r0_277[2] = "Sword"
            r0_277[3] = 3
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_277))
          end
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 391
        while wait() do
          local r0_391 = _G.Auto_Stats_Defense
          if r0_391 then
            r0_391 = {}
            r0_391[1] = "AddPoint"
            r0_391[2] = "Defense"
            r0_391[3] = 3
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_391))
          end
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 337
        while wait() do
          local r0_337 = _G.Auto_Stats_Melee
          if r0_337 then
            r0_337 = {}
            r0_337[1] = "AddPoint"
            r0_337[2] = "Melee"
            r0_337[3] = 3
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(r0_337))
          end
        end
      end)
      r36_4 = {}
      for r40_4, r41_4 in pairs(game:GetService("Players"):GetChildren()) do
        table.insert(r36_4, r41_4.Name)
      end
      r37_4 = r4_4.Player:AddDropdown("SelectedPly", {
        Title = "Select Player",
        Description = "",
        Values = r36_4,
        Multi = false,
        Default = 1,
      })
      local r40_4 = "SetValue"
      r40_4 = "nil"
      r37_4:[r40_4](r40_4)
      r40_4 = "OnChanged"
      function r40_4(r0_19)
        -- line: [0, 0] id: 19
        _G.SelectPly = r0_19
      end
      r37_4:[r40_4](r40_4)
      r40_4 = "AddButton"
      r40_4 = {
        Title = "Refresh Player",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 419
          table.clear(r36_4)
          for r3_419, r4_419 in pairs(game:GetService("Players"):GetChildren()) do
            table.insert(r36_4, r4_419.Name)
          end
        end,
      }
      r4_4.Player:[r40_4](r40_4)
      r40_4 = "AddToggle"
      r40_4 = "ToggleTeleport"
      r38_4 = r4_4.Player:[r40_4](r40_4, {
        Title = "Teleport To Player",
        Description = "",
        Default = false,
      })
      local r41_4 = "OnChanged"
      function r41_4(r0_70)
        -- line: [0, 0] id: 70
        _G.TeleportPly = r0_70
        if r0_70 == false then
          wait()
          AutoHaki()
          toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
          wait()
        end
      end
      r38_4:[r41_4](r41_4)
      r41_4 = "SetValue"
      r41_4 = false
      r5_4.ToggleTeleport:[r41_4](r41_4)
      spawn(function()
        -- line: [0, 0] id: 105
        while wait() do
          local r0_105 = _G.TeleportPly
          if r0_105 then
            pcall(function()
              -- line: [0, 0] id: 106
              if game.Players:FindFirstChild(_G.SelectPly) then
                toTarget(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
              end
            end)
          end
        end
      end)
      r41_4 = "AddToggle"
      r41_4 = "ToggleQuanSat"
      local r39_4 = r4_4.Player:[r41_4](r41_4, {
        Title = "Spectate Player",
        Description = "",
        Default = false,
      })
      local r42_4 = "OnChanged"
      function r42_4(r0_87)
        -- line: [0, 0] id: 87
        SpectatePlys = r0_87
        local r1_87 = game:GetService("Players").LocalPlayer.Character.Humanoid
        local r2_87 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
        repeat
          wait(0.1)
          game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
        until SpectatePlys == false
        game:GetService("Workspace").Camera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
      end
      r39_4:[r42_4](r42_4)
      r42_4 = "SetValue"
      r42_4 = false
      r5_4.ToggleQuanSat:[r42_4](r42_4)
      r42_4 = "AddToggle"
      r42_4 = "ToggleFastAttack"
      r40_4 = r4_4.Player:[r42_4](r42_4, {
        Title = " Click Attack Player",
        Description = "",
        Default = false,
      })
      local r43_4 = "OnChanged"
      function r43_4(r0_394)
        -- line: [0, 0] id: 394
        _G.FastAttackFaiFao = r0_394
      end
      r40_4:[r43_4](r43_4)
      r43_4 = "SetValue"
      r43_4 = false
      r5_4.ToggleFastAttack:[r43_4](r43_4)
      r43_4 = "AddSlider"
      r43_4 = "SliderDelayAttackPlayer"
      r41_4 = r4_4.Player:[r43_4](r43_4, {
        Title = "Delay Fast (sec)",
        Description = "",
        Default = 0.1,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(r0_39)
          -- line: [0, 0] id: 39
          _G.DelayAttackPlayer = r0_39
        end,
      })
      local r44_4 = "OnChanged"
      function r44_4(r0_439)
        -- line: [0, 0] id: 439
        _G.DelayAttackPlayer = r0_439
      end
      r41_4:[r44_4](r44_4)
      r44_4 = "SetValue"
      r44_4 = 0.1
      r41_4:[r44_4](r44_4)
      spawn(function()
        -- line: [0, 0] id: 182
        while wait() do
          pcall(function()
            -- line: [0, 0] id: 183
            if _G.FastAttackFaiFao then
              repeat
                wait(_G.DelayAttackPlayer)
                AttackNoCoolDown()
              until not _G.FastAttackFaiFao
            end
          end)
        end
      end)
      require(game.ReplicatedStorage.Util.CameraShaker):Stop()
      function getAllBladeHitsPlayers(r0_199)
        -- line: [0, 0] id: 199
        local r1_199 = {}
        local r2_199 = game.Players.LocalPlayer
        local r3_199 = game:GetService("Workspace").Characters:GetChildren()
        for r7_199 = 1, #r3_199, 1 do
          local r8_199 = r3_199[r7_199]
          local r9_199 = r8_199:FindFirstChildOfClass("Humanoid")
          if r8_199.Name ~= game.Players.LocalPlayer.Name and r9_199 and r9_199.RootPart and 0 < r9_199.Health and r2_199:DistanceFromCharacter(r9_199.RootPart.Position) < r0_199 + 5 then
            table.insert(r1_199, r9_199.RootPart)
          end
        end
        return r1_199
      end
      function getAllBladeHits(r0_89)
        -- line: [0, 0] id: 89
        local r1_89 = {}
        local r2_89 = game.Players.LocalPlayer
        local r3_89 = game:GetService("Workspace").Enemies:GetChildren()
        for r7_89 = 1, #r3_89, 1 do
          local r9_89 = r3_89[r7_89]:FindFirstChildOfClass("Humanoid")
          if r9_89 and r9_89.RootPart and 0 < r9_89.Health and r2_89:DistanceFromCharacter(r9_89.RootPart.Position) < r0_89 + 5 then
            table.insert(r1_89, r9_89.RootPart)
          end
        end
        return r1_89
      end
      r43_4 = r4_4.Player:AddSection("Combat")
      local r46_4 = "AddSlider"
      r46_4 = "SlidershowFov"
      r44_4 = r4_4.Player:[r46_4](r46_4, {
        Title = "Size Fov",
        Description = "",
        Default = 100,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(r0_103)
          -- line: [0, 0] id: 103
          _G.Select_Size_Fov = r0_103
        end,
      })
      local r47_4 = "OnChanged"
      function r47_4(r0_7)
        -- line: [0, 0] id: 7
        _G.Select_Size_Fov = r0_7
      end
      r44_4:[r47_4](r47_4)
      r47_4 = "SetValue"
      r47_4 = 100
      r44_4:[r47_4](r47_4)
      r47_4 = "AddToggle"
      r47_4 = "ToggleShowFov"
      local r45_4 = r4_4.Player:[r47_4](r47_4, {
        Title = "Show Fov",
        Description = "",
        Default = false,
      })
      local r48_4 = "OnChanged"
      function r48_4(r0_393)
        -- line: [0, 0] id: 393
        _G.Show_Fov = r0_393
      end
      r45_4:[r48_4](r48_4)
      r48_4 = "SetValue"
      r48_4 = false
      r5_4.ToggleShowFov:[r48_4](r48_4)
      r48_4 = "AddToggle"
      r48_4 = "ToggleAimBotSkill"
      r46_4 = r4_4.Player:[r48_4](r48_4, {
        Title = "Auto Aimbot Skill",
        Description = "",
        Default = false,
      })
      local r49_4 = "OnChanged"
      function r49_4(r0_269)
        -- line: [0, 0] id: 269
        _G.Aimbot_Skill_Fov = r0_269
      end
      r46_4:[r49_4](r49_4)
      r49_4 = "SetValue"
      r49_4 = false
      r5_4.ToggleAimBotSkill:[r49_4](r49_4)
      r48_4 = game:GetService("Players").LocalPlayer:GetMouse()
      spawn(function()
        -- line: [0, 0] id: 75
        while wait() do
          local r0_75 = _G.Aimbot_Skill_Fov
          if r0_75 then
            pcall(function()
              -- line: [0, 0] id: 76
              local r0_76 = math.huge
              local r1_76 = nil
              for r5_76, r6_76 in pairs(game:GetService("Players"):GetChildren()) do
                local r8_76, r9_76 = game.Workspace.CurrentCamera.WorldToScreenPoint(game.Workspace.CurrentCamera, r6_76.Character:FindFirstChild("HumanoidRootPart").Position)
                local r12_76 = (Vector2.new(r8_76.X, r8_76.Y) - Vector2.new(r48_4.X, r48_4.Y)).Magnitude
                if r12_76 < r0_76 and r12_76 <= _G.Select_Size_Fov and r6_76.Name ~= game.Players.LocalPlayer.Name then
                  r0_76 = r12_76
                  _G.Aim_Players = r6_76
                end
              end
            end)
          end
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 378
        local r0_378 = getrawmetatable(game)
        local r1_378 = r0_378.__namecall
        setreadonly(r0_378, false)
        r0_378.__namecall = newcclosure(function(...)
          -- line: [0, 0] id: 379
          local r1_379 = getnamecallmethod()
          local r2_379 = {
            ...
          }
          if tostring(r1_379) == "FireServer" and tostring(r2_379[1]) == "RemoteEvent" and tostring(r2_379[2]) ~= "true" and tostring(r2_379[2]) ~= "false" and _G.Aimbot_Skill_Fov then
            r2_379[2] = _G.Aim_Players.Character.HumanoidRootPart.Position
            return r1_378(unpack(r2_379))
          end
          return r1_378(...)
        end)
      end)
      r49_4 = Drawing.new("Circle")
      r49_4.Color = Color3.fromRGB(0, 244, 0)
      r49_4.Thickness = 1
      r49_4.Radius = 250
      r49_4.NumSides = 460
      r49_4.Filled = false
      r49_4.Transparency = 1
      local r50_4 = game:GetService("RunService")
      local r52_4 = "Connect"
      function r52_4()
        -- line: [0, 0] id: 434
        r49_4.Radius = _G.Select_Size_Fov
        r49_4.Thickness = 1
        r49_4.NumSides = 460
        r49_4.Position = game:GetService("UserInputService"):GetMouseLocation()
        if _G.Show_Fov then
          r49_4.Visible = true
        else
          r49_4.Visible = false
        end
      end
      r50_4.Stepped:[r52_4](r52_4)
      r50_4 = r4_4.Player:AddSection("Misc")
      local r53_4 = "AddToggle"
      r53_4 = "ToggleNoClip"
      local r51_4 = r4_4.Player:[r53_4](r53_4, {
        Title = "No Clip",
        Description = "",
        Default = false,
      })
      local r54_4 = "OnChanged"
      function r54_4(r0_151)
        -- line: [0, 0] id: 151
        _G.LOf = r0_151
      end
      r51_4:[r54_4](r54_4)
      r54_4 = "SetValue"
      r54_4 = false
      r5_4.ToggleNoClip:[r54_4](r54_4)
      spawn(function()
        -- line: [0, 0] id: 13
        pcall(function()
          -- line: [0, 0] id: 14
          game:GetService("RunService").Stepped:Connect(function()
            -- line: [0, 0] id: 15
            if _G.LOf then
              for r3_15, r4_15 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if r4_15:IsA("BasePart") then
                  r4_15.CanCollide = false
                end
              end
            end
          end)
        end)
      end)
      r54_4 = "AddToggle"
      r54_4 = "ToggleWalkonWater"
      r52_4 = r4_4.Player:[r54_4](r54_4, {
        Title = "Walk on Water",
        Description = "",
        Default = true,
      })
      local r55_4 = "OnChanged"
      function r55_4(r0_53)
        -- line: [0, 0] id: 53
        _G.WalkonWater = r0_53
      end
      r52_4:[r55_4](r55_4)
      r55_4 = "SetValue"
      r55_4 = true
      r5_4.ToggleWalkonWater:[r55_4](r55_4)
      spawn(function()
        -- line: [0, 0] id: 29
        while task.wait() do
          pcall(function()
            -- line: [0, 0] id: 30
            if _G.WalkonWater then
              game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
              game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
          end)
        end
      end)
      r55_4 = "AddToggle"
      r55_4 = "ToggleSpeedRun"
      r53_4 = r4_4.Player:[r55_4](r55_4, {
        Title = "Run Speed",
        Description = "",
        Default = true,
      })
      local r56_4 = "OnChanged"
      function r56_4(r0_366)
        -- line: [0, 0] id: 366
        InfAbility = r0_366
        if r0_366 == false then
          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
      end
      r53_4:[r56_4](r56_4)
      r56_4 = "SetValue"
      r56_4 = true
      r5_4.ToggleSpeedRun:[r56_4](r56_4)
      spawn(function()
        -- line: [0, 0] id: 88
        while wait() do
          local r0_88 = InfAbility
          if r0_88 then
            InfAb()
          end
        end
      end)
      function InfAb()
        -- line: [0, 0] id: 336
        if InfAbility and not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
          local r0_336 = Instance.new("ParticleEmitter")
          r0_336.Acceleration = Vector3.new(0, 0, 0)
          r0_336.Archivable = true
          r0_336.Drag = 20
          r0_336.EmissionDirection = Enum.NormalId.Top
          r0_336.Enabled = true
          r0_336.Lifetime = NumberRange.new(0, 0)
          r0_336.LightInfluence = 0
          r0_336.LockedToPart = true
          r0_336.Name = "Agility"
          r0_336.Rate = 500
          r0_336.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 4)
          })
          r0_336.RotSpeed = NumberRange.new(9999, 99999)
          r0_336.Rotation = NumberRange.new(0, 0)
          r0_336.Speed = NumberRange.new(30, 30)
          r0_336.SpreadAngle = Vector2.new(0, 0, 0, 0)
          r0_336.Texture = ""
          r0_336.VelocityInheritance = 0
          r0_336.ZOffset = 2
          r0_336.Transparency = NumberSequence.new(0)
          r0_336.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0))
          r0_336.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
        end
      end
      r56_4 = "AddToggle"
      r56_4 = "ToggleEnablePvp"
      r54_4 = r4_4.Player:[r56_4](r56_4, {
        Title = "Auto Enable PVP",
        Description = "",
        Default = false,
      })
      local r57_4 = "OnChanged"
      function r57_4(r0_279)
        -- line: [0, 0] id: 279
        _G.EnabledPvP = r0_279
      end
      r54_4:[r57_4](r57_4)
      r57_4 = "SetValue"
      r57_4 = false
      r5_4.ToggleEnablePvp:[r57_4](r57_4)
      spawn(function()
        -- line: [0, 0] id: 381
        pcall(function()
          -- line: [0, 0] id: 382
          while wait() do
            local r0_382 = _G.EnabledPvP
            if r0_382 then
              r0_382 = game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible
              if r0_382 == true then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
              end
            end
          end
        end)
      end)
      r55_4 = r4_4.Teleport:AddSection("Teleport World")
      local r58_4 = "AddButton"
      r58_4 = {
        Title = "First Sea",
        Description = "Sea 1",
        Callback = function()
          -- line: [0, 0] id: 238
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        end,
      }
      r4_4.Teleport:[r58_4](r58_4)
      r58_4 = "AddButton"
      r58_4 = {
        Title = "Second Sea",
        Description = "Sea 2",
        Callback = function()
          -- line: [0, 0] id: 157
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end,
      }
      r4_4.Teleport:[r58_4](r58_4)
      r58_4 = "AddButton"
      r58_4 = {
        Title = "Third Sea",
        Description = "Sea 3",
        Callback = function()
          -- line: [0, 0] id: 174
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end,
      }
      r4_4.Teleport:[r58_4](r58_4)
      r56_4 = r4_4.Teleport:AddSection("Teleport Island")
      if First_Sea then
        IslandList = {
          "WindMill",
          "Marine",
          "Middle Town",
          "Jungle",
          "Pirate Village",
          "Desert",
          "Snow Island",
          "MarineFord",
          "Colosseum",
          "Sky Island 1",
          "Sky Island 2",
          "Sky Island 3",
          "Prison",
          "Magma Village",
          "Under Water Island",
          "Fountain City",
          "Shank Room",
          "Mob Island"
        }
      elseif Second_Sea then
        IslandList = {
          "The Cafe",
          "Frist Spot",
          "Dark Area",
          "Flamingo Mansion",
          "Flamingo Room",
          "Green Zone",
          "Factory",
          "Colossuim",
          "Zombie Island",
          "Two Snow Mountain",
          "Punk Hazard",
          "Cursed Ship",
          "Ice Castle",
          "Forgotten Island",
          "Ussop Island",
          "Mini Sky Island"
        }
      elseif Third_Sea then
        IslandList = {
          "Mansion",
          "Port Town",
          "Great Tree",
          "Castle On The Sea",
          "MiniSky",
          "Hydra Island",
          "Floating Turtle",
          "Haunted Castle",
          "Ice Cream Island",
          "Peanut Island",
          "Cake Island",
          "Cocoa Island",
          "Candy Island",
          "Tiki Outpost"
        }
      end
      r57_4 = r4_4.Teleport:AddDropdown("DropdownIsland", {
        Title = "Dropdown",
        Description = "",
        Values = IslandList,
        Multi = false,
        Default = 1,
      })
      local r60_4 = "SetValue"
      r60_4 = "..."
      r57_4:[r60_4](r60_4)
      r60_4 = "OnChanged"
      function r60_4(r0_198)
        -- line: [0, 0] id: 198
        _G.SelectIsland = r0_198
      end
      r57_4:[r60_4](r60_4)
      r60_4 = "AddButton"
      r60_4 = {
        Title = "Tween",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 390
          if _G.SelectIsland == "WindMill" then
            toTarget(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
          elseif _G.SelectIsland == "Marine" then
            toTarget(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
          elseif _G.SelectIsland == "Middle Town" then
            toTarget(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
          elseif _G.SelectIsland == "Jungle" then
            toTarget(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
          elseif _G.SelectIsland == "Pirate Village" then
            toTarget(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
          elseif _G.SelectIsland == "Desert" then
            toTarget(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
          elseif _G.SelectIsland == "Snow Island" then
            toTarget(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
          elseif _G.SelectIsland == "MarineFord" then
            toTarget(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
          elseif _G.SelectIsland == "Colosseum" then
            toTarget(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
          elseif _G.SelectIsland == "Sky Island 1" then
            toTarget(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
          elseif _G.SelectIsland == "Sky Island 2" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
          elseif _G.SelectIsland == "Sky Island 3" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
          elseif _G.SelectIsland == "Prison" then
            toTarget(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
          elseif _G.SelectIsland == "Magma Village" then
            toTarget(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
          elseif _G.SelectIsland == "Under Water Island" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
          elseif _G.SelectIsland == "Fountain City" then
            toTarget(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
          elseif _G.SelectIsland == "Shank Room" then
            toTarget(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
          elseif _G.SelectIsland == "Mob Island" then
            toTarget(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
          elseif _G.SelectIsland == "The Cafe" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
            wait(0.1)
            Tween2(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
          elseif _G.SelectIsland == "Frist Spot" then
            toTarget(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
          elseif _G.SelectIsland == "Dark Area" then
            toTarget(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
          elseif _G.SelectIsland == "Flamingo Mansion" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
          elseif _G.SelectIsland == "Flamingo Room" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.152034759521484, 905.48291015625))
          elseif _G.SelectIsland == "Green Zone" then
            toTarget(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
          elseif _G.SelectIsland == "Factory" then
            toTarget(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
          elseif _G.SelectIsland == "Colossuim" then
            toTarget(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
          elseif _G.SelectIsland == "Zombie Island" then
            toTarget(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
          elseif _G.SelectIsland == "Two Snow Mountain" then
            toTarget(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
          elseif _G.SelectIsland == "Punk Hazard" then
            toTarget(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
          elseif _G.SelectIsland == "Cursed Ship" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.40197753906, 125.05712890625, 32885.875))
          elseif _G.SelectIsland == "Ice Castle" then
            toTarget(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
          elseif _G.SelectIsland == "Forgotten Island" then
            toTarget(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
          elseif _G.SelectIsland == "Ussop Island" then
            toTarget(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
          elseif _G.SelectIsland == "Mini Sky Island" then
            Tween2(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
          elseif _G.SelectIsland == "Great Tree" then
            toTarget(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
          elseif _G.SelectIsland == "Castle On The Sea" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
          elseif _G.SelectIsland == "MiniSky" then
            Tween2(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
          elseif _G.SelectIsland == "Port Town" then
            toTarget(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
          elseif _G.SelectIsland == "Hydra Island" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5753.5478515625, 610.7880859375, -282.33172607421875))
          elseif _G.SelectIsland == "Floating Turtle" then
            toTarget(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
          elseif _G.SelectIsland == "Mansion" then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12468.5380859375, 375.0094299316406, -7554.62548828125))
          elseif _G.SelectIsland == "Haunted Castle" then
            toTarget(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
          elseif _G.SelectIsland == "Ice Cream Island" then
            toTarget(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
          elseif _G.SelectIsland == "Peanut Island" then
            toTarget(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
          elseif _G.SelectIsland == "Cake Island" then
            toTarget(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
          elseif _G.SelectIsland == "Cocoa Island" then
            toTarget(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
          elseif _G.SelectIsland == "Candy Island" then
            toTarget(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
          elseif _G.SelectIsland == "Tiki Outpost" then
            toTarget(CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625))
          end
        end,
      }
      r4_4.Teleport:[r60_4](r60_4)
      r60_4 = "AddButton"
      r60_4 = {
        Title = "Stop Tween",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 149
          CancelTween()
        end,
      }
      r4_4.Teleport:[r60_4](r60_4)
      r58_4 = game.ReplicatedStorage:FindFirstChild("Remotes")
      r60_4 = "InvokeServer"
      r60_4 = "GetFruits"
      r58_4 = r58_4.CommF_:[r60_4](r60_4)
      Table_DevilFruitSniper = {}
      ShopDevilSell = {}
      for r62_4, r63_4 in next, r58_4, nil do
        table.insert(Table_DevilFruitSniper, r63_4.Name)
        if r63_4.OnSale then
          table.insert(ShopDevilSell, r63_4.Name)
        end
      end
      _G.SelectFruit = "Leopard-Leopard"
      local r59_4 = r4_4.Fruit:AddDropdown("DropdownFruit", {
        Title = "Select Fruit",
        Description = "",
        Values = Table_DevilFruitSniper,
        Multi = false,
        Default = 1,
      })
      local r62_4 = "SetValue"
      r62_4 = "..."
      r59_4:[r62_4](r62_4)
      r62_4 = "OnChanged"
      function r62_4(r0_154)
        -- line: [0, 0] id: 154
        _G.SelectFruit = r0_154
      end
      r59_4:[r62_4](r62_4)
      r62_4 = "AddToggle"
      r62_4 = "ToggleFruit"
      r60_4 = r4_4.Fruit:[r62_4](r62_4, {
        Title = "Buy Fruit Sniper",
        Description = "",
        Default = false,
      })
      local r63_4 = "OnChanged"
      function r63_4(r0_185)
        -- line: [0, 0] id: 185
        _G.AutoBuyFruitSniper = r0_185
      end
      r60_4:[r63_4](r63_4)
      r63_4 = "SetValue"
      r63_4 = false
      r5_4.ToggleFruit:[r63_4](r63_4)
      spawn(function()
        -- line: [0, 0] id: 328
        pcall(function()
          -- line: [0, 0] id: 329
          while wait(0.1) do
            local r0_329 = _G.AutoBuyFruitSniper
            if r0_329 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", "_G.SelectFruit", false)
            end
          end
        end)
      end)
      r63_4 = "AddToggle"
      r63_4 = "ToggleStore"
      local r61_4 = r4_4.Fruit:[r63_4](r63_4, {
        Title = "Store Fruit",
        Description = "",
        Default = false,
      })
      local r64_4 = "OnChanged"
      function r64_4(r0_363)
        -- line: [0, 0] id: 363
        _G.AutoStoreFruit = r0_363
      end
      r61_4:[r64_4](r64_4)
      r64_4 = "SetValue"
      r64_4 = false
      r5_4.ToggleStore:[r64_4](r64_4)
      spawn(function()
        -- line: [0, 0] id: 445
        while task.wait() do
          local r0_445 = _G.AutoStoreFruit
          if r0_445 then
            pcall(function()
              -- line: [0, 0] id: 446
              if _G.AutoStoreFruit then
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bomb-Bomb", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spike-Spike", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Chop-Chop", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spring-Spring", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rocket-Rocket", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Smoke-Smoke", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spin-Spin", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Flame-Flame", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Falcon Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Falcon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("alcon Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ice-Ice", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Sand-Sand", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dark-Dark", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ghost-Ghost", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Diamond-Diamond", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Light-Light", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Love-Love", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rubber-Rubber", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Barrier-Barrier", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Magma-Magma", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Door-Door", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Quake-Quake", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buddha", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spider-Spider", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Phoenix", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rumble-Rumble", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Pain-Pain", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Gravity-Gravity", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dough-Dough", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Shadow-Shadow", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Venom-Venom", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Control-Control", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Soul-Soul", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit"))
                end
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dragon-Dragon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
                  if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Leopard-Leopard", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
                  end
                end
              end
            end)
          end
          wait(0.3)
        end
      end)
      r64_4 = "AddToggle"
      r64_4 = "ToggleRandomFruit"
      r62_4 = r4_4.Fruit:[r64_4](r64_4, {
        Title = "Random Fruit",
        Description = "",
        Default = false,
      })
      local r65_4 = "OnChanged"
      function r65_4(r0_358)
        -- line: [0, 0] id: 358
        _G.Random_Auto = r0_358
      end
      r62_4:[r65_4](r65_4)
      r65_4 = "SetValue"
      r65_4 = false
      r5_4.ToggleRandomFruit:[r65_4](r65_4)
      spawn(function()
        -- line: [0, 0] id: 249
        pcall(function()
          -- line: [0, 0] id: 250
          while wait(0.1) do
            local r0_250 = _G.Random_Auto
            if r0_250 then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end
          end
        end)
      end)
      r65_4 = "AddToggle"
      r65_4 = "ToggleCollectTP"
      r63_4 = r4_4.Fruit:[r65_4](r65_4, {
        Title = "Collect Devil Fruit (TP)",
        Description = "",
        Default = false,
      })
      local r66_4 = "OnChanged"
      function r66_4(r0_245)
        -- line: [0, 0] id: 245
        _G.CollectFruitTP = r0_245
      end
      r63_4:[r66_4](r66_4)
      r66_4 = "SetValue"
      r66_4 = false
      r5_4.ToggleCollectTP:[r66_4](r66_4)
      spawn(function()
        -- line: [0, 0] id: 35
        while wait(0.1) do
          local r0_35 = _G.CollectFruitTP
          if r0_35 then
            r0_35 = pairs
            for r3_35, r4_35 in r0_35(game.Workspace:GetChildren()) do
              if string.find(r4_35.Name, "Fruit") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r4_35.Handle.CFrame
              end
            end
          end
        end
      end)
      r66_4 = "AddToggle"
      r66_4 = "ToggleCollect"
      r64_4 = r4_4.Fruit:[r66_4](r66_4, {
        Title = "Collect Devil Fruit (Tween)",
        Description = "",
        Default = false,
      })
      local r67_4 = "OnChanged"
      function r67_4(r0_42)
        -- line: [0, 0] id: 42
        _G.Tweenfruit = r0_42
      end
      r64_4:[r67_4](r67_4)
      r67_4 = "SetValue"
      r67_4 = false
      r5_4.ToggleCollect:[r67_4](r67_4)
      spawn(function()
        -- line: [0, 0] id: 397
        while wait(0.1) do
          local r0_397 = _G.Tweenfruit
          if r0_397 then
            r0_397 = pairs
            for r3_397, r4_397 in r0_397(game.Workspace:GetChildren()) do
              if string.find(r4_397.Name, "Fruit") then
                Tween(r4_397.Handle.CFrame)
              end
            end
          end
        end
      end)
      r65_4 = r4_4.Fruit:AddSection("Esp")
      local r68_4 = "AddToggle"
      r68_4 = "ToggleEspPlayer"
      r66_4 = r4_4.Fruit:[r68_4](r68_4, {
        Title = "Esp Player",
        Description = "",
        Default = false,
      })
      local r69_4 = "OnChanged"
      function r69_4(r0_143)
        -- line: [0, 0] id: 143
        ESPPlayer = r0_143
        UpdatePlayerChams()
      end
      r66_4:[r69_4](r69_4)
      r69_4 = "SetValue"
      r69_4 = false
      r5_4.ToggleEspPlayer:[r69_4](r69_4)
      r69_4 = "AddToggle"
      r69_4 = "ToggleEspFruit"
      r67_4 = r4_4.Fruit:[r69_4](r69_4, {
        Title = "Esp Devil Fruit",
        Description = "",
        Default = false,
      })
      local r70_4 = "OnChanged"
      function r70_4(r0_230)
        -- line: [0, 0] id: 230
        DevilFruitESP = r0_230
        while DevilFruitESP do
          wait()
          UpdateDevilChams()
        end
      end
      r67_4:[r70_4](r70_4)
      r70_4 = "SetValue"
      r70_4 = false
      r5_4.ToggleEspFruit:[r70_4](r70_4)
      r70_4 = "AddToggle"
      r70_4 = "ToggleEspIsland"
      r68_4 = r4_4.Fruit:[r70_4](r70_4, {
        Title = "Esp Island",
        Description = "",
        Default = false,
      })
      local r71_4 = "OnChanged"
      function r71_4(r0_354)
        -- line: [0, 0] id: 354
        IslandESP = r0_354
        while IslandESP do
          wait()
          UpdateIslandESP()
        end
      end
      r68_4:[r71_4](r71_4)
      r71_4 = "SetValue"
      r71_4 = false
      r5_4.ToggleEspIsland:[r71_4](r71_4)
      r71_4 = "AddToggle"
      r71_4 = "ToggleEspFlower"
      r69_4 = r4_4.Fruit:[r71_4](r71_4, {
        Title = "Esp Flower",
        Description = "",
        Default = false,
      })
      local r72_4 = "OnChanged"
      function r72_4(r0_5)
        -- line: [0, 0] id: 5
        FlowerESP = r0_5
        UpdateFlowerChams()
      end
      r69_4:[r72_4](r72_4)
      r72_4 = "SetValue"
      r72_4 = false
      r5_4.ToggleEspFlower:[r72_4](r72_4)
      spawn(function()
        -- line: [0, 0] id: 82
        while wait(2) do
          local r0_82 = FlowerESP
          if r0_82 then
            UpdateFlowerChams()
          end
          r0_82 = DevilFruitESP
          if r0_82 then
            UpdateDevilChams()
          end
          r0_82 = ChestESP
          if r0_82 then
            UpdateChestChams()
          end
          r0_82 = ESPPlayer
          if r0_82 then
            UpdatePlayerChams()
          end
          r0_82 = RealFruitESP
          if r0_82 then
            UpdateRealFruitChams()
          end
        end
      end)
      r71_4 = r4_4.Raid:AddDropdown("DropdownRaid", {
        Title = "Select Chip",
        Description = "",
        Values = {
          "Flame",
          "Ice",
          "Quake",
          "Light",
          "Dark",
          "Spider",
          "Rumble",
          "Magma",
          "Buddha",
          "Sand",
          "Phoenix",
          "Dough"
        },
        Multi = false,
        Default = 1,
      })
      local r74_4 = "SetValue"
      r74_4 = "..."
      r71_4:[r74_4](r74_4)
      r74_4 = "OnChanged"
      function r74_4(r0_291)
        -- line: [0, 0] id: 291
        SelectChip = r0_291
      end
      r71_4:[r74_4](r74_4)
      r74_4 = "AddToggle"
      r74_4 = "ToggleBuy"
      r72_4 = r4_4.Raid:[r74_4](r74_4, {
        Title = "Buy Chip",
        Description = "",
        Default = false,
      })
      local r75_4 = "OnChanged"
      function r75_4(r0_122)
        -- line: [0, 0] id: 122
        _G.Auto_Buy_Chips_Dungeon = r0_122
      end
      r72_4:[r75_4](r75_4)
      r75_4 = "SetValue"
      r75_4 = false
      r5_4.ToggleBuy:[r75_4](r75_4)
      spawn(function()
        -- line: [0, 0] id: 355
        while wait() do
          local r0_355 = _G.Auto_Buy_Chips_Dungeon
          if r0_355 then
            pcall(function()
              -- line: [0, 0] id: 356
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "RaidsNpc",
                [2] = "Select",
                [3] = SelectChip,
              }))
            end)
          end
        end
      end)
      r75_4 = "AddToggle"
      r75_4 = "ToggleStart"
      local r73_4 = r4_4.Raid:[r75_4](r75_4, {
        Title = "Start Raid",
        Description = "",
        Default = false,
      })
      local r76_4 = "OnChanged"
      function r76_4(r0_207)
        -- line: [0, 0] id: 207
        _G.Auto_StartRaid = r0_207
      end
      r73_4:[r76_4](r76_4)
      r76_4 = "SetValue"
      r76_4 = false
      r5_4.ToggleStart:[r76_4](r76_4)
      spawn(function()
        -- line: [0, 0] id: 437
        while wait(0.1) do
          pcall(function()
            -- line: [0, 0] id: 438
            if _G.Auto_StartRaid and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false and (not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")) then
              if Second_Sea then
                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
              elseif Third_Sea then
                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
              end
            end
          end)
        end
      end)
      r76_4 = "AddToggle"
      r76_4 = "ToggleKillAura"
      r74_4 = r4_4.Raid:[r76_4](r76_4, {
        Title = "Kill Aura",
        Description = "",
        Default = false,
      })
      local r77_4 = "OnChanged"
      function r77_4(r0_237)
        -- line: [0, 0] id: 237
        KillAura = r0_237
      end
      r74_4:[r77_4](r77_4)
      r77_4 = "SetValue"
      r77_4 = false
      r5_4.ToggleKillAura:[r77_4](r77_4)
      spawn(function()
        -- line: [0, 0] id: 332
        while wait() do
          local r0_332 = KillAura
          if r0_332 then
            pcall(function()
              -- line: [0, 0] id: 333
              for r3_333, r4_333 in pairs(game.Workspace.Enemies:GetDescendants()) do
                if r4_333:FindFirstChild("Humanoid") and r4_333:FindFirstChild("HumanoidRootPart") and 0 < r4_333.Humanoid.Health then
                  while true do
                    task.wait()
                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    r4_333.Humanoid.Health = 0
                    r4_333.HumanoidRootPart.CanCollide = false
                    if KillAura then
                      local r5_333 = r4_333.Parent
                      if r5_333 then
                        r5_333 = r4_333.Humanoid.Health
                        if r5_333 <= 0 then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  end
                end
              end
            end)
          end
        end
      end)
      r77_4 = "AddToggle"
      r77_4 = "ToggleNextIsland"
      r75_4 = r4_4.Raid:[r77_4](r77_4, {
        Title = "Next Island",
        Description = "",
        Default = false,
      })
      local r78_4 = "OnChanged"
      function r78_4(r0_261)
        -- line: [0, 0] id: 261
        AutoNextIsland = r0_261
      end
      r75_4:[r78_4](r78_4)
      r78_4 = "SetValue"
      r78_4 = false
      r5_4.ToggleNextIsland:[r78_4](r78_4)
      spawn(function()
        -- line: [0, 0] id: 152
        while task.wait() do
          local r0_152 = AutoNextIsland
          if r0_152 then
            pcall(function()
              -- line: [0, 0] id: 153
              if game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") then
                  Tween(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame * CFrame.new(0, 70, 100))
                elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") then
                  Tween(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame * CFrame.new(0, 70, 100))
                elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") then
                  Tween(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame * CFrame.new(0, 70, 100))
                elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") then
                  Tween(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame * CFrame.new(0, 70, 100))
                elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") then
                  Tween(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame * CFrame.new(0, 70, 100))
                end
              end
            end)
          end
        end
      end)
      r78_4 = "AddToggle"
      r78_4 = "ToggleAwake"
      r76_4 = r4_4.Raid:[r78_4](r78_4, {
        Title = "Auto Awake",
        Description = "",
        Default = false,
      })
      local r79_4 = "OnChanged"
      function r79_4(r0_212)
        -- line: [0, 0] id: 212
        AutoAwakenAbilities = r0_212
      end
      r76_4:[r79_4](r79_4)
      r79_4 = "SetValue"
      r79_4 = false
      r5_4.ToggleAwake:[r79_4](r79_4)
      spawn(function()
        -- line: [0, 0] id: 395
        while task.wait() do
          local r0_395 = AutoAwakenAbilities
          if r0_395 then
            pcall(function()
              -- line: [0, 0] id: 396
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end)
          end
        end
      end)
      r79_4 = "AddToggle"
      r79_4 = "ToggleGetFruit"
      r77_4 = r4_4.Raid:[r79_4](r79_4, {
        Title = "Get Fruit Low Bely",
        Description = "",
        Default = false,
      })
      local r80_4 = "OnChanged"
      function r80_4(r0_61)
        -- line: [0, 0] id: 61
        _G.Autofruit = r0_61
      end
      r77_4:[r80_4](r80_4)
      spawn(function()
        -- line: [0, 0] id: 165
        while wait(0.1) do
          pcall(function()
            -- line: [0, 0] id: 166
            if _G.Autofruit then
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Rocket-Rocket",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Spin-Spin",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Chop-Chop",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Spring-Spring",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Bomb-Bomb",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Smoke-Smoke",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Spike-Spike",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Flame-Flame",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Falcon-Falcon",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Ice-Ice",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Sand-Sand",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Dark-Dark",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Ghost-Ghost",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Diamond-Diamond",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Light-Light",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Rubber-Rubber",
              }))
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                [1] = "LoadFruit",
                [2] = "Barrier-Barrier",
              }))
            end
          end)
        end
      end)
      if Second_Sea then
        r80_4 = "AddButton"
        r80_4 = {
          Title = "Raid Lab",
          Description = "",
          Callback = function()
            -- line: [0, 0] id: 142
            Tween2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
          end,
        }
        r4_4.Raid:[r80_4](r80_4)
      elseif Third_Sea then
        r80_4 = "AddButton"
        r80_4 = {
          Title = "Raid Lab",
          Description = "",
          Callback = function()
            -- line: [0, 0] id: 272
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
            Tween2(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 0.0000000448217499, -0.378151238, 0.00000000455503146, 1, 0.000000107377559, 0.378151238, 0.000000097681621, -0.925743818))
          end,
        }
        r4_4.Raid:[r80_4](r80_4)
      end
      r78_4 = r4_4.Raid:AddSection("Law Raid")
      local r81_4 = "AddToggle"
      r81_4 = "ToggleLaw"
      r79_4 = r4_4.Raid:[r81_4](r81_4, {
        Title = "Auto Law",
        Description = "",
        Default = false,
      })
      local r82_4 = "OnChanged"
      function r82_4(r0_200)
        -- line: [0, 0] id: 200
        Auto_Law = r0_200
      end
      r79_4:[r82_4](r82_4)
      r82_4 = "SetValue"
      r82_4 = false
      r5_4.ToggleLaw:[r82_4](r82_4)
      spawn(function()
        -- line: [0, 0] id: 305
        pcall(function()
          -- line: [0, 0] id: 306
          while wait() do
            local r0_306 = Auto_Law
            if r0_306 then
              r0_306 = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip")
              if not r0_306 then
                r0_306 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip")
                if not r0_306 then
                  r0_306 = game:GetService("Workspace").Enemies:FindFirstChild("Order")
                  if not r0_306 then
                    r0_306 = game:GetService("ReplicatedStorage")
                    r0_306 = r0_306:FindFirstChild("Order")
                    if not r0_306 then
                      wait(0.3)
                      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                    end
                  end
                end
              end
            end
          end
        end)
      end)
      spawn(function()
        -- line: [0, 0] id: 66
        pcall(function()
          -- line: [0, 0] id: 67
          while wait(0.4) do
            local r0_67 = Auto_Law
            if r0_67 then
              r0_67 = game:GetService("Workspace").Enemies:FindFirstChild("Order")
              if not r0_67 then
                r0_67 = game:GetService("ReplicatedStorage")
                r0_67 = r0_67:FindFirstChild("Order")
                if not r0_67 then
                  r0_67 = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip")
                  if not r0_67 then
                    r0_67 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip")
                    if r0_67 then
                      ::label_49::
                      fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                    end
                  else
                    goto label_49	-- block#6 is visited secondly
                  end
                end
              end
              r0_67 = game:GetService("ReplicatedStorage")
              r0_67 = r0_67:FindFirstChild("Order")
              if not r0_67 then
                r0_67 = game:GetService("Workspace").Enemies:FindFirstChild("Order")
                if not r0_67 then
                end
              end
              r0_67 = game:GetService("Workspace").Enemies:FindFirstChild("Order")
              if r0_67 then
                r0_67 = pairs
                for r3_67, r4_67 in r0_67(game:GetService("Workspace").Enemies:GetChildren()) do
                  if r4_67.Name == "Order" then
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      Tween(r4_67.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                      r4_67.HumanoidRootPart.CanCollide = false
                      r4_67.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
                      if r4_67.Parent then
                        local r5_67 = r4_67.Humanoid.Health
                        if r5_67 > 0 then
                          r5_67 = Auto_Law
                          if r5_67 == false then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                end
              else
                r0_67 = game:GetService("ReplicatedStorage")
                r0_67 = r0_67:FindFirstChild("Order")
                if r0_67 then
                  Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                end
              end
            end
          end
        end)
      end)
      r82_4 = "AddButton"
      r82_4 = {
        Title = "Timple Of Time",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 271
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        end,
      }
      r4_4.Race:[r82_4](r82_4)
      r82_4 = "AddButton"
      r82_4 = {
        Title = "Lever Pull",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 364
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
          Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
        end,
      }
      r4_4.Race:[r82_4](r82_4)
      r82_4 = "AddButton"
      r82_4 = {
        Title = "Acient One",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 233
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
          Tween2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
        end,
      }
      r4_4.Race:[r82_4](r82_4)
      r80_4 = r4_4.Race:AddSection("Auto Race")
      local r83_4 = "AddButton"
      r83_4 = {
        Title = "Race Door",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 25
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
          if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
            Tween2(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
          elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
            Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
          elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
            Tween2(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
          elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
            Tween2(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
          elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
            Tween2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
          elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
            Tween2(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
          end
        end,
      }
      r4_4.Race:[r83_4](r83_4)
      r83_4 = "AddToggle"
      r83_4 = "ToggleHumanandghoul"
      r81_4 = r4_4.Race:[r83_4](r83_4, {
        Title = "Auto [ Human / Ghoul ] Trial",
        Description = "",
        Default = false,
      })
      local r84_4 = "OnChanged"
      function r84_4(r0_400)
        -- line: [0, 0] id: 400
        KillAura = r0_400
      end
      r81_4:[r84_4](r84_4)
      r84_4 = "SetValue"
      r84_4 = false
      r5_4.ToggleHumanandghoul:[r84_4](r84_4)
      r84_4 = "AddToggle"
      r84_4 = "ToggleAutotrial"
      r82_4 = r4_4.Race:[r84_4](r84_4, {
        Title = "Auto Trial",
        Description = "",
        Default = false,
      })
      local r85_4 = "OnChanged"
      function r85_4(r0_108)
        -- line: [0, 0] id: 108
        _G.AutoQuestRace = r0_108
      end
      r82_4:[r85_4](r85_4)
      r85_4 = "SetValue"
      r85_4 = false
      r5_4.ToggleAutotrial:[r85_4](r85_4)
      spawn(function()
        -- line: [0, 0] id: 287
        pcall(function()
          -- line: [0, 0] id: 288
          while wait() do
            local r0_288 = _G.AutoQuestRace
            if r0_288 then
              r0_288 = game:GetService("Players").LocalPlayer.Data.Race.Value
              local r4_288 = nil	-- notice: implicit variable refs by block#[13, 14, 19, 20, 44, 47, 48, 49, 50, 56, 57]
              if r0_288 == "Human" then
                r0_288 = pairs
                for r3_288, r4_288 in r0_288(game.Workspace.Enemies:GetDescendants()) do
                  if r4_288:FindFirstChild("Humanoid") and r4_288:FindFirstChild("HumanoidRootPart") and 0 < r4_288.Humanoid.Health then
                    pcall(function()
                      -- line: [0, 0] id: 289
                      while true do
                        wait(0.1)
                        r4_288.Humanoid.Health = 0
                        r4_288.HumanoidRootPart.CanCollide = false
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        if _G.AutoQuestRace then
                          local r0_289 = r4_288.Parent
                          if r0_289 then
                            r0_289 = r4_288.Humanoid.Health
                            if r0_289 <= 0 then
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      end
                    end)
                  end
                  -- close: r3_288
                end
              else
                r0_288 = game:GetService("Players").LocalPlayer.Data.Race.Value
                if r0_288 == "Skypiea" then
                  r0_288 = pairs
                  for r3_288, r4_288 in r0_288(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                    if r4_288.Name == "snowisland_Cylinder.081" then
                      BTPZ(r4_288.CFrame * CFrame.new(0, 0, 0))
                    end
                  end
                else
                  r0_288 = game:GetService("Players").LocalPlayer.Data.Race.Value
                  if r0_288 == "Fishman" then
                    r0_288 = pairs
                    for r3_288, r4_288 in r0_288(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                      if r4_288.Name == "HumanoidRootPart" then
                        Tween(r4_288.CFrame * r27_4)
                        for r8_288, r9_288 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                          if r9_288:IsA("Tool") and r9_288.ToolTip == "Melee" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(r9_288)
                          end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        for r8_288, r9_288 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                          if r9_288:IsA("Tool") and r9_288.ToolTip == "Blox Fruit" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(r9_288)
                          end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.5)
                        for r8_288, r9_288 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                          if r9_288:IsA("Tool") and r9_288.ToolTip == "Sword" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(r9_288)
                          end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.5)
                        for r8_288, r9_288 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                          if r9_288:IsA("Tool") and r9_288.ToolTip == "Gun" then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(r9_288)
                          end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                      end
                    end
                  else
                    r0_288 = game:GetService("Players").LocalPlayer.Data.Race.Value
                    if r0_288 == "Cyborg" then
                      r4_288 = -30
                      Tween(CFrame.new(28654, 14898.7832, r4_288, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    else
                      r0_288 = game:GetService("Players").LocalPlayer.Data.Race.Value
                      if r0_288 == "Ghoul" then
                        r0_288 = pairs
                        for r3_288, r4_288 in r0_288(game.Workspace.Enemies:GetDescendants()) do
                          if r4_288:FindFirstChild("Humanoid") and r4_288:FindFirstChild("HumanoidRootPart") and 0 < r4_288.Humanoid.Health then
                            pcall(function()
                              -- line: [0, 0] id: 290
                              while true do
                                wait(0.1)
                                r4_288.Humanoid.Health = 0
                                r4_288.HumanoidRootPart.CanCollide = false
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                if _G.AutoQuestRace then
                                  local r0_290 = r4_288.Parent
                                  if r0_290 then
                                    r0_290 = r4_288.Humanoid.Health
                                    if r0_290 <= 0 then
                                      break
                                    end
                                  else
                                    break
                                  end
                                else
                                  break
                                end
                              end
                            end)
                          end
                          -- close: r3_288
                        end
                      else
                        r0_288 = game:GetService("Players").LocalPlayer.Data.Race.Value
                        if r0_288 == "Mink" then
                          r0_288 = pairs
                          for r3_288, r4_288 in r0_288(game:GetService("Workspace"):GetDescendants()) do
                            if r4_288.Name == "StartPoint" then
                              Tween(r4_288.CFrame * CFrame.new(0, 10, 0))
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end)
      end)
      r83_4 = r4_4.Race:AddSection("Auto Train")
      local r86_4 = "AddToggle"
      r86_4 = "ToggleAutoAcientQuest"
      r84_4 = r4_4.Race:[r86_4](r86_4, {
        Title = "Auto Train",
        Description = "",
        Default = false,
      })
      local r87_4 = "OnChanged"
      function r87_4(r0_193)
        -- line: [0, 0] id: 193
        AutoFarmAcient = r0_193
      end
      r84_4:[r87_4](r87_4)
      r87_4 = "SetValue"
      r87_4 = false
      r5_4.ToggleAutoAcientQuest:[r87_4](r87_4)
      r85_4 = CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875)
      spawn(function()
        -- line: [0, 0] id: 221
        pcall(function()
          -- line: [0, 0] id: 222
          while wait() do
            local r0_222 = AutoFarmAcient
            if r0_222 then
              r0_222 = game.Players.LocalPlayer.Character.RaceTransformed.Value
              if r0_222 == true then
                AutoFarmAcient = false
                toTarget(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
              end
            end
          end
        end)
      end)
      spawn(function()
        -- line: [0, 0] id: 420
        while wait() do
          local r0_420 = AutoFarmAcient
          if r0_420 then
            pcall(function()
              -- line: [0, 0] id: 421
              if game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief") or game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel") then
                for r3_421, r4_421 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                  if (r4_421.Name == "Cocoa Warrior" or r4_421.Name == "Chocolate Bar Battler" or r4_421.Name == "Sweet Thief" or r4_421.Name == "Candy Rebel") and r4_421:FindFirstChild("Humanoid") and r4_421:FindFirstChild("HumanoidRootPart") and 0 < r4_421.Humanoid.Health then
                    bringmob = true
                    while true do
                      wait(_G.Fast_Delay)
                      AttackNoCoolDown()
                      AutoHaki()
                      EquipTool(SelectWeapon)
                      r4_421.HumanoidRootPart.CanCollide = false
                      r4_421.Humanoid.WalkSpeed = 0
                      r4_421.Head.CanCollide = false
                      FarmPos = r4_421.HumanoidRootPart.CFrame
                      MonFarm = r4_421.Name
                      Tween(r4_421.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                      if AutoFarmAcient then
                        local r5_421 = r4_421.Parent
                        if r5_421 then
                          r5_421 = r4_421.Humanoid.Health
                          if r5_421 <= 0 then
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    end
                    bringmob = false
                  end
                end
              else
                toTarget(r85_4)
              end
            end)
          end
        end
      end)
      spawn(function()
        -- line: [0, 0] id: 56
        pcall(function()
          -- line: [0, 0] id: 57
          while wait() do
            local r0_57 = AutoFarmAcient
            if r0_57 then
              r0_57 = game.Players.LocalPlayer.Character.RaceTransformed.Value
              if r0_57 == false then
                r0_57 = true
                AutoFarmAcient = r0_57
              end
            end
          end
        end)
      end)
      spawn(function()
        -- line: [0, 0] id: 109
        while wait() do
          pcall(function()
            -- line: [0, 0] id: 110
            if AutoFarmAcient then
              game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
              wait(0.1)
              game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
            end
          end)
        end
      end)
      local r88_4 = "AddButton"
      r88_4 = {
        Title = "Geppo",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 129
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
        end,
      }
      r4_4.Shop:[r88_4](r88_4)
      r88_4 = "AddButton"
      r88_4 = {
        Title = "Buso Haki",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 377
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
        end,
      }
      r4_4.Shop:[r88_4](r88_4)
      r88_4 = "AddButton"
      r88_4 = {
        Title = "Soru",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 58
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
        end,
      }
      r4_4.Shop:[r88_4](r88_4)
      r88_4 = "AddButton"
      r88_4 = {
        Title = "Ken Haki",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 32
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
        end,
      }
      r4_4.Shop:[r88_4](r88_4)
      r86_4 = r4_4.Shop:AddSection("Fighting Styles")
      local r89_4 = "AddButton"
      r89_4 = {
        Title = "Black Leg",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 369
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r89_4 = "AddButton"
      r89_4 = {
        Title = "Electro",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 323
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r89_4 = "AddButton"
      r89_4 = {
        Title = "Fishman Karate",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 292
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r89_4 = "AddButton"
      r89_4 = {
        Title = "Dragon Claw",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 77
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r89_4 = "AddButton"
      r89_4 = {
        Title = "Superhuman",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 95
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r89_4 = "AddButton"
      r89_4 = {
        Title = "Death Step",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 265
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r89_4 = "AddButton"
      r89_4 = {
        Title = "Sharkman Karate",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 267
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r89_4 = "AddButton"
      r89_4 = {
        Title = "Electric Claw",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 353
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r89_4 = "AddButton"
      r89_4 = {
        Title = "Dragon Talon",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 440
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r89_4 = "AddButton"
      r89_4 = {
        Title = "Godhuman",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 145
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
        end,
      }
      r4_4.Shop:[r89_4](r89_4)
      r87_4 = r4_4.Shop:AddSection("Misc Items")
      local r90_4 = "AddButton"
      r90_4 = {
        Title = "Refund Stats",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 405
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
        end,
      }
      r4_4.Shop:[r90_4](r90_4)
      r90_4 = "AddButton"
      r90_4 = {
        Title = "Reroll Race",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 327
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
        end,
      }
      r4_4.Shop:[r90_4](r90_4)
      r90_4 = "AddButton"
      r90_4 = {
        Title = "Rejoin Server",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 370
          game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
        end,
      }
      r4_4.Misc:[r90_4](r90_4)
      r90_4 = "AddButton"
      r90_4 = {
        Title = "Hop Server",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 429
          Hop()
        end,
      }
      r4_4.Misc:[r90_4](r90_4)
      function Hop()
        -- line: [0, 0] id: 410
        local r0_410 = game.PlaceId
        local r1_410 = {}
        local r2_410 = ""
        local r3_410 = os.date("!*t").hour
        local r4_410 = false
        function TPReturner()
          -- line: [0, 0] id: 413
          local r0_413 = nil	-- notice: implicit variable refs by block#[3, 4, 5, 6, 7]
          if r2_410 == "" then
            r0_413 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. r0_410 .. "/servers/Public?sortOrder=Asc&limit=100"))
          else
            r0_413 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. r0_410 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. r2_410))
          end
          local r1_413 = ""
          if r0_413.nextPageCursor and r0_413.nextPageCursor ~= "null" and r0_413.nextPageCursor ~= nil then
            r2_410 = r0_413.nextPageCursor
          end
          local r2_413 = 0
          for r6_413, r7_413 in pairs(r0_413.data) do
            local r8_413 = true
            r1_413 = tostring(r7_413.id)
            if tonumber(r7_413.playing) < tonumber(r7_413.maxPlayers) then
              for r12_413, r13_413 in pairs(r1_410) do
                if r2_413 ~= 0 and r1_413 == tostring(r13_413) then
                  r8_413 = false
                elseif tonumber(r3_410) ~= tonumber(r13_413) then
                  local r14_413 = pcall(function()
                    -- line: [0, 0] id: 415
                    r1_410 = {}
                    table.insert(r1_410, r3_410)
                  end)
                end
                r2_413 = r2_413 + 1
              end
              if r8_413 == true then
                table.insert(r1_410, r1_413)
                wait()
                pcall(function()
                  -- line: [0, 0] id: 414
                  wait()
                  game:GetService("TeleportService"):TeleportToPlaceInstance(r0_410, r1_413, game.Players.LocalPlayer)
                end)
                wait(4)
              end
            end
          end
        end
        r55_4 = function()
          -- line: [0, 0] id: 411
          while wait() do
            pcall(function()
              -- line: [0, 0] id: 412
              TPReturner()
              if r2_410 ~= "" then
                TPReturner()
              end
            end)
          end
        end
        r55_4()
      end
      r88_4 = r4_4.Misc:AddSection("Team")
      local r91_4 = "AddButton"
      r91_4 = {
        Title = "Join Pirates Team",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 408
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
        end,
      }
      r4_4.Misc:[r91_4](r91_4)
      r91_4 = "AddButton"
      r91_4 = {
        Title = "Join Marines Team",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 211
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
        end,
      }
      r4_4.Misc:[r91_4](r91_4)
      r89_4 = r4_4.Misc:AddSection("Open Ui")
      local r92_4 = "AddButton"
      r92_4 = {
        Title = "Devil Shop Menu",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 124
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
          game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
        end,
      }
      r4_4.Misc:[r92_4](r92_4)
      r92_4 = "AddButton"
      r92_4 = {
        Title = "Color Haki Menu",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 115
          game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
        end,
      }
      r4_4.Misc:[r92_4](r92_4)
      r92_4 = "AddButton"
      r92_4 = {
        Title = "Title Name Menu",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 424
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            [1] = "getTitles",
          }))
          game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
        end,
      }
      r4_4.Misc:[r92_4](r92_4)
      r92_4 = "AddButton"
      r92_4 = {
        Title = "Awakening Menu",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 72
          game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
        end,
      }
      r4_4.Misc:[r92_4](r92_4)
      r90_4 = r4_4.Misc:AddSection("Troll")
      local r93_4 = "AddButton"
      r93_4 = {
        Title = "Rain Fruit",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 73
          for r3_73, r4_73 in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
            r4_73.Parent = game.Workspace.Map
            r4_73:MoveTo(game.Players.LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))
            if r4_73.Fruit:FindFirstChild("AnimationController") then
              r4_73.Fruit:FindFirstChild("AnimationController"):LoadAnimation(r4_73.Fruit:FindFirstChild("Idle")):Play()
            end
            r4_73.Handle.Touched:Connect(function(r0_74)
              -- line: [0, 0] id: 74
              if r0_74.Parent == game.Players.LocalPlayer.Character then
                r4_73.Parent = game.Players.LocalPlayer.Backpack
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(r4_73)
              end
            end)
            -- close: r3_73
          end
        end,
      }
      r4_4.Misc:[r93_4](r93_4)
      r91_4 = r4_4.Misc:AddSection("Misc")
      local r94_4 = "AddToggle"
      r94_4 = "ToggleRejoin"
      r92_4 = r4_4.Misc:[r94_4](r94_4, {
        Title = "Auto Rejoin",
        Description = "",
        Default = true,
      })
      local r95_4 = "OnChanged"
      function r95_4(r0_303)
        -- line: [0, 0] id: 303
        _G.AutoRejoin = r0_303
      end
      r92_4:[r95_4](r95_4)
      r95_4 = "SetValue"
      r95_4 = true
      r5_4.ToggleRejoin:[r95_4](r95_4)
      spawn(function()
        -- line: [0, 0] id: 27
        while wait() do
          local r0_27 = _G.AutoRejoin
          if r0_27 then
            r0_27 = getgenv()
            r0_27.rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(r0_28)
              -- line: [0, 0] id: 28
              if r0_28.Name == "ErrorPrompt" and r0_28:FindFirstChild("MessageArea") and r0_28.MessageArea:FindFirstChild("ErrorFrame") then
                game:GetService("TeleportService"):Teleport(game.PlaceId)
              end
            end)
          end
        end
      end)
      r93_4 = r4_4.Misc:AddSection("Kaitun Cap")
      local r96_4 = "AddButton"
      r96_4 = {
        Title = "Show Items",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 309
          local r0_309 = game:GetService("CoreGui").RobloxGui.Modules.Profile:FindFirstChild("UILibrary")
          if r0_309 then
            r0_309:Destroy()
          end
          r0_309 = game:GetService("UserInputService")
          local r1_309 = game:GetService("TweenService")
          local r2_309 = game:GetService("RunService")
          local r4_309 = game:GetService("Players").LocalPlayer:GetMouse()
          local r5_309 = game:GetService("Lighting"):FindFirstChild("Blur")
          if r5_309 then
            r5_309:Destroy()
          end
          r5_309 = Instance.new("BlurEffect")
          r1_309:Create(r5_309, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {
            Size = 50,
          }):Play()
          r5_309.Parent = game.Lighting
          local r6_309 = Instance.new("UIStroke")
          local r7_309 = Instance.new("UICorner")
          local r8_309 = Instance.new("ScreenGui")
          local r9_309 = Instance.new("ImageButton")
          local r10_309 = Enum.ButtonStyle.RobloxButton
          r8_309.Parent = game.CoreGui
          r8_309.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
          local r11_309 = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.UIController.Inventory)
          local r12_309 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
          local r13_309 = {}
          local r14_309 = {
            "Mythical",
            "Legendary",
            "Rare",
            "Uncommon",
            "Common"
          }
          local r15_309 = {
            Common = Color3.fromRGB(179, 179, 179),
            Uncommon = Color3.fromRGB(92, 140, 211),
            Rare = Color3.fromRGB(140, 82, 255),
            Legendary = Color3.fromRGB(213, 43, 228),
            Mythical = Color3.fromRGB(238, 47, 50),
          }
          function GetRaity(r0_310)
            -- line: [0, 0] id: 310
            for r4_310, r5_310 in pairs(r15_309) do
              if r5_310 == r0_310 then
                return r4_310
              end
            end
          end
          for r19_309, r20_309 in pairs(r12_309) do
            r13_309[r20_309.Name] = r20_309
          end
          local r16_309 = #getupvalue(r11_309.UpdateRender, 4)
          local r17_309 = {}
          local r18_309 = {}
          local r19_309 = 0
          while r19_309 < r16_309 do
            local r20_309 = 0
            while r20_309 < 25000 and r19_309 < r16_309 do
              game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.CanvasPosition = Vector2.new(0, r20_309)
              for r24_309, r25_309 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.InventoryContainer.Right.Content.ScrollingFrame.Frame:GetChildren()) do
                if r25_309:IsA("Frame") and not r17_309[r25_309.ItemName.Text] and r25_309.ItemName.Visible == true then
                  local r26_309 = GetRaity(r25_309.Background.BackgroundColor3)
                  if r26_309 then
                    if not r18_309[r26_309] then
                      r18_309[r26_309] = {}
                    end
                    table.insert(r18_309[r26_309], r25_309:Clone())
                  end
                  r19_309 = r19_309 + 1
                  r17_309[r25_309.ItemName.Text] = true
                end
              end
              r20_309 = r20_309 + 20
            end
            wait()
          end
          function GetXY(r0_311)
            -- line: [0, 0] id: 311
            return r0_311 * 100
          end
          local r20_309 = Instance.new("UIListLayout")
          r20_309.FillDirection = Enum.FillDirection.Vertical
          r20_309.SortOrder = 2
          r20_309.Padding = UDim.new(0, 10)
          local r21_309 = Instance.new("Frame", game.Players.LocalPlayer.PlayerGui.BubbleChat)
          r21_309.BackgroundTransparency = 1
          r21_309.Size = UDim2.new(0.5, 0, 1, 0)
          r20_309.Parent = r21_309
          local r22_309 = Instance.new("Frame", game.Players.LocalPlayer.PlayerGui.BubbleChat)
          r22_309.BackgroundTransparency = 1
          r22_309.Size = UDim2.new(0.5, 0, 1, 0)
          r22_309.Position = UDim2.new(0.6, 0, 0, 0)
          r20_309:Clone().Parent = r22_309
          for r26_309, r27_309 in pairs(r18_309) do
            local r28_309 = Instance.new("Frame", r21_309)
            r28_309.BackgroundTransparency = 1
            r28_309.Size = UDim2.new(1, 0, 0, 0)
            r28_309.LayoutOrder = table.find(r14_309, r26_309)
            local r29_309 = Instance.new("Frame", r22_309)
            r29_309.BackgroundTransparency = 1
            r29_309.Size = UDim2.new(1, 0, 0, 0)
            r29_309.LayoutOrder = table.find(r14_309, r26_309)
            local r30_309 = Instance.new("UIGridLayout", r28_309)
            r30_309.CellPadding = UDim2.new(0.005, 0, 0.005, 0)
            r30_309.CellSize = UDim2.new(0, 70, 0, 70)
            r30_309.FillDirectionMaxCells = 100
            r30_309.FillDirection = Enum.FillDirection.Horizontal
            r30_309:Clone().Parent = r29_309
            for r35_309, r36_309 in pairs(r27_309) do
              if r13_309[r36_309.ItemName.Text] and r13_309[r36_309.ItemName.Text].Mastery then
                if r36_309.ItemLine2.Text ~= "Accessory" then
                  local r37_309 = r36_309.ItemName:Clone()
                  r37_309.BackgroundTransparency = 1
                  r37_309.TextSize = 10
                  r37_309.TextXAlignment = 2
                  r37_309.TextYAlignment = 2
                  r37_309.ZIndex = 5
                  r37_309.Text = r13_309[r36_309.ItemName.Text].Mastery
                  r37_309.Size = UDim2.new(0.5, 0, 0.5, 0)
                  r37_309.Position = UDim2.new(0.5, 0, 0.5, 0)
                  r37_309.Parent = r36_309
                end
                r36_309.Parent = r28_309
              elseif r36_309.ItemLine2.Text == "Blox Fruit" then
                r36_309.Parent = r29_309
              end
            end
            r28_309.AutomaticSize = 2
            r29_309.AutomaticSize = 2
          end
          local r23_309 = {
            Superhuman = Vector2.new(3, 2),
            DeathStep = Vector2.new(4, 3),
            ElectricClaw = Vector2.new(2, 0),
            SharkmanKarate = Vector2.new(0, 0),
            DragonTalon = Vector2.new(1, 5),
          }
          local r24_309 = Instance.new("Frame", r21_309)
          r24_309.BackgroundTransparency = 1
          r24_309.Size = UDim2.new(1, 0, 0, 0)
          r24_309.LayoutOrder = table.find(r14_309, k)
          r24_309.AutomaticSize = 2
          r24_309.LayoutOrder = 100
          local r25_309 = Instance.new("UIGridLayout", r24_309)
          r25_309.CellPadding = UDim2.new(0.005, 0, 0.005, 0)
          r25_309.CellSize = UDim2.new(0, 70, 0, 70)
          r25_309.FillDirectionMaxCells = 100
          r25_309.FillDirection = Enum.FillDirection.Horizontal
          for r30_309, r31_309 in pairs({
            "Superhuman",
            "ElectricClaw",
            "DragonTalon",
            "SharkmanKarate",
            "DeathStep",
            "GodHuman"
          }) do
            local r32_309 = r23_309[r31_309]
            if r32_309 then
              r32_309 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy" .. r31_309, true)
              if r32_309 == 1 then
                r32_309 = Instance.new("ImageLabel", r24_309)
                r32_309.Image = "rbxassetid://9945562382"
                r32_309.ImageRectSize = Vector2.new(100, 100)
                r32_309.ImageRectOffset = r23_309[r31_309] * 100
              end
            end
          end
          function formatNumber(r0_318)
            -- line: [0, 0] id: 318
            return tostring(r0_318):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
          end
          game:GetService("Players").LocalPlayer.PlayerGui.Main.Beli.AnchorPoint = Vector2.new(0.5, 0.5)
          game:GetService("Players").LocalPlayer.PlayerGui.Main.Beli.Position = UDim2.new(0, 1120, 0, 700)
          game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.AnchorPoint = Vector2.new(0.5, 0.5)
          game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Position = UDim2.new(0, 1150, 0, 750)
          local r27_309 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone()
          r27_309.Name = "Name"
          r27_309.Parent = game:GetService("Players").LocalPlayer.PlayerGui.Main.Beli
          r27_309.Position = UDim2.new(0, 0, -1.5, 0)
          r27_309.Size = UDim2.new(1, 0, 1, 0)
          r27_309.TextColor3 = Color3.fromRGB(255, 255, 255)
          r27_309.Text = game.Players.LocalPlayer.Name
          local r28_309 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Fragments:Clone()
          r28_309.Name = "FragmentsCheck"
          r28_309.Parent = game:GetService("Players").LocalPlayer.PlayerGui.Main.Beli
          r28_309.Position = UDim2.new(0, 0, -0.75, 0)
          r28_309.Size = UDim2.new(1, 0, 1, 0)
          r28_309.Text = " " .. formatNumber(game:GetService("Players").LocalPlayer.Data.Fragments.Value)
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            [1] = "getAwakenedAbilities",
          }))
          game.Players.LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
          game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Position = UDim2.new(0.48, 10, 0.908, 2)
          game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Size = UDim2.new(1, 0, 0.22, 0)
          pcall(function()
            -- line: [0, 0] id: 319
            game:GetService("Players").LocalPlayer.PlayerGui.Main.MenuButton.Visible = false
          end)
          pcall(function()
            -- line: [0, 0] id: 312
            game:GetService("Players").LocalPlayer.PlayerGui.Main.RaceEnergy.Visible = false
          end)
          pcall(function()
            -- line: [0, 0] id: 317
            game:GetService("Players").LocalPlayer.PlayerGui.Main.SafeZone.Visible = false
          end)
          pcall(function()
            -- line: [0, 0] id: 314
            game:GetService("Players").LocalPlayer.PlayerGui.Main.HP.Visible = false
          end)
          pcall(function()
            -- line: [0, 0] id: 315
            game:GetService("Players").LocalPlayer.PlayerGui.Backpack.Enabled.Visible = false
          end)
          pcall(function()
            -- line: [0, 0] id: 313
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Energy.Visible = false
          end)
          for r33_309, r34_309 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main:GetChildren()) do
            if r34_309:IsA("ImageButton") then
              r34_309:Destroy()
            end
          end
          pcall(function()
            -- line: [0, 0] id: 316
            game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass.Visible = false
          end)
        end,
      }
      r4_4.Misc:[r96_4](r96_4)
      r94_4 = r4_4.Misc:AddSection("Day")
      local r97_4 = "AddButton"
      r97_4 = {
        Title = "Remove Fog",
        Description = "",
        Callback = function()
          -- line: [0, 0] id: 83
          NoFog()
        end,
      }
      r4_4.Misc:[r97_4](r97_4)
      function NoFog()
        -- line: [0, 0] id: 334
        local r0_334 = game.Lighting
        r0_334.FogEnd = 100000
        for r4_334, r5_334 in pairs(r0_334:GetDescendants()) do
          if r5_334:IsA("Atmosphere") then
            r5_334:Destroy()
          end
        end
      end
      if First_Sea or Second_Sea then
        r95_4 = r4_4.Hop:AddSection("Thid Sea Please !!!")
      end
      if Third_Sea then
        r97_4 = "AddToggle"
        r97_4 = "ToggleFindMoon"
        r95_4 = r4_4.Hop:[r97_4](r97_4, {
          Title = "Find Full Moon",
          Description = "",
          Default = false,
        })
        local r98_4 = "OnChanged"
        function r98_4(r0_50)
          -- line: [0, 0] id: 50
          _G.AutoFindMoon = r0_50
        end
        r95_4:[r98_4](r98_4)
        r98_4 = "SetValue"
        r98_4 = false
        r5_4.ToggleFindMoon:[r98_4](r98_4)
        spawn(function()
          -- line: [0, 0] id: 346
          while wait() do
            local r0_346 = _G.AutoFindMoon
            if r0_346 then
              r0_346 = game:GetService("Lighting").Sky.MoonTextureId
              if r0_346 ~= "http://www.roblox.com/asset/?id=9709149052" then
                r0_346 = game:GetService("Lighting").Sky.MoonTextureId
                if r0_346 == "http://www.roblox.com/asset/?id=9709149431" then
                  ::label_24::
                  wait(2)
                end
              else
                goto label_24	-- block#4 is visited secondly
              end
              r0_346 = game:GetService("Lighting").Sky.MoonTextureId
              if r0_346 == "http://www.roblox.com/asset/?id=9709143733" then
                Hop()
                r0_4:Notify({
                  Title = "SolixHub [Free] | Blox Fruit",
                  Content = "Turn Off Find Full Moon...",
                  SubContent = "",
                  Duration = 5,
                })
              else
                r0_346 = game:GetService("Lighting").Sky.MoonTextureId
                if r0_346 == "http://www.roblox.com/asset/?id=9709150401" then
                  Hop()
                  r0_4:Notify({
                    Title = "SolixHub Hopping",
                    Content = "Hop...",
                    SubContent = "",
                    Duration = 5,
                  })
                else
                  r0_346 = game:GetService("Lighting").Sky.MoonTextureId
                  if r0_346 == "http://www.roblox.com/asset/?id=9709149680" then
                    Hop()
                    r0_4:Notify({
                      Title = "SolixHub",
                      Content = "Hop...",
                      SubContent = "",
                      Duration = 5,
                    })
                  else
                    Hop()
                  end
                end
              end
            end
          end
        end)
        r98_4 = "AddToggle"
        r98_4 = "ToggleMirageIsland"
        r96_4 = r4_4.Hop:[r98_4](r98_4, {
          Title = "Find Mirage Island",
          Description = "",
          Default = false,
        })
        local r99_4 = "OnChanged"
        function r99_4(r0_90)
          -- line: [0, 0] id: 90
          _G.FindMirageIsland = r0_90
        end
        r96_4:[r99_4](r99_4)
        r99_4 = "SetValue"
        r99_4 = false
        r5_4.ToggleMirageIsland:[r99_4](r99_4)
        spawn(function()
          -- line: [0, 0] id: 268
          while wait() do
            local r0_268 = _G.FindMirageIsland
            if r0_268 then
              r0_268 = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
              if not r0_268 then
                r0_268 = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if r0_268 then
                  ::label_28::
                  r0_268 = HighestPointRealCFrame
                  if r0_268 then
                    r0_268 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - HighestPointRealCFrame.Position).Magnitude
                    if r0_268 > 10 then
                      Tween(getHighestPoint().CFrame * CFrame.new(0, 211.88, 0))
                    end
                  end
                end
              else
                goto label_28	-- block#4 is visited secondly
              end
              r0_268 = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
              if r0_268 then
                r0_268 = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if r0_268 then
                end
              end
              Hop()
            end
          end
        end)
      end
      r97_4 = "SetLibrary"
      r97_4 = r0_4
      r1_4:[r97_4](r97_4)
      r97_4 = "SetLibrary"
      r97_4 = r0_4
      r2_4:[r97_4](r97_4)
      r1_4:IgnoreThemeSettings()
      r97_4 = "SetIgnoreIndexes"
      r97_4 = {}
      r1_4:[r97_4](r97_4)
      r97_4 = "SetFolder"
      r97_4 = "solixhub"
      r2_4:[r97_4](r97_4)
      r97_4 = "SetFolder"
      r97_4 = "solixhub/bloxfruit"
      r1_4:[r97_4](r97_4)
      r97_4 = "BuildInterfaceSection"
      r97_4 = r4_4.Configs
      r2_4:[r97_4](r97_4)
      r97_4 = "BuildConfigSection"
      r97_4 = r4_4.Configs
      r1_4:[r97_4](r97_4)
      r97_4 = "SelectTab"
      r97_4 = 1
      r3_4:[r97_4](r97_4)
      r97_4 = "Notify"
      r97_4 = {
        Title = "SolixHub",
        Content = "Solix Script Loaded!",
        Duration = 0,
      }
      r0_4:[r97_4](r97_4)
      r1_4:LoadAutoloadConfig()
      -- close: r0_4
    end
  end)
end)()
