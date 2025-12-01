--========================================================--
--              Xeno対応 RayField GUIスクリプト           --
--========================================================--

-- RayField読み込み
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

-- メインウィンドウ作成
local Window = Rayfield:CreateWindow({
    Name = "Xeno Script",
    LoadingTitle = "Loading Script...",
    LoadingSubtitle = "by Masashi",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "XenoScriptConfigs",
        FileName = "Config"
    },
    KeySystem = false
})

--========================================================--
--================== プレイヤータブ ====================--
--========================================================--

local PlayerTab = Window:CreateTab("プレイヤー", 4483362458)

local PlayerSection = PlayerTab:CreateSection("移動/能力")

-- スピードアップ
local speedValue = 16
PlayerTab:CreateSlider({
    Name = "スピードアップ",
    Range = {16, 500},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Speed",
    Callback = function(value)
        speedValue = value
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedValue
    end
})

-- 無限ジャンプ
local InfiniteJump = false
PlayerTab:CreateToggle({
    Name = "無限ジャンプ",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(value)
        InfiniteJump = value
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJump then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- 空中TP
local AirTPEnabled = false
PlayerTab:CreateToggle({
    Name = "空中TP",
    CurrentValue = false,
    Flag = "AirTP",
    Callback = function(value)
        AirTPEnabled = value
    end
})

-- 壁貫通
local WallClip = false
PlayerTab:CreateToggle({
    Name = "壁貫通",
    CurrentValue = false,
    Flag = "WallClip",
    Callback = function(value)
        WallClip = value
    end
})

--========================================================--
--====================== ESPタブ ========================--
--========================================================--

local ESPTab = Window:CreateTab("ESP", 4483362458)
local ESPSection = ESPTab:CreateSection("ESP設定")

local ESPItems = {}
local ESPEnemies = {}
local ESPPlayers = {}

-- アイテムESP
local ItemsEnabled = false
ESPTab:CreateToggle({
    Name = "アイテムESP",
    CurrentValue = false,
    Flag = "ItemsESP",
    Callback = function(value)
        ItemsEnabled = value
        -- ESP更新処理
    end
})

-- 敵ESP
local EnemiesEnabled = false
ESPTab:CreateToggle({
    Name = "敵ESP",
    CurrentValue = false,
    Flag = "EnemyESP",
    Callback = function(value)
        EnemiesEnabled = value
    end
})

-- プレイヤーESP
local PlayersESPEnabled = false
ESPTab:CreateToggle({
    Name = "プレイヤーESP",
    CurrentValue = false,
    Flag = "PlayerESP",
    Callback = function(value)
        PlayersESPEnabled = value
    end
})

--========================================================--
--===================== 戦闘タブ ========================--
--========================================================--

local CombatTab = Window:CreateTab("戦闘", 4483362458)
local CombatSection = CombatTab:CreateSection("プレイヤー選択/TP")

local SelectedPlayer = nil
local AttachMode = false
local OriginalCFrame = nil

local function UpdatePlayerList()
    CombatSection:ClearAllObjects()
    for i, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            CombatSection:CreateButton({
                Name = player.Name,
                Callback = function()
                    if SelectedPlayer == player then
                        -- 張り付きの場合、元に戻す
                        if AttachMode and OriginalCFrame then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OriginalCFrame
                            AttachMode = false
                        end
                        SelectedPlayer = nil
                        OriginalCFrame = nil
                        return
                    end
                    SelectedPlayer = player
                    OriginalCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    AttachMode = true
                    -- TP
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                end
            })
        end
    end
end

-- 初回生成
UpdatePlayerList()

-- プレイヤー追加時に自動更新
game.Players.PlayerAdded:Connect(UpdatePlayerList)
game.Players.PlayerRemoving:Connect(UpdatePlayerList)

-- 張り付きループ
game:GetService("RunService").RenderStepped:Connect(function()
    if AttachMode and SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
    end
end)

--========================================================--
--===================== その他タブ =======================--
--========================================================--

local OtherTab = Window:CreateTab("その他", 4483362458)
local OtherSection = OtherTab:CreateSection("便利機能")

-- アンチAFK
OtherTab:CreateToggle({
    Name = "アンチAFK",
    CurrentValue = false,
    Flag = "AntiAFK",
    Callback = function(value)
        if value then
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            end)
        end
    end
})
