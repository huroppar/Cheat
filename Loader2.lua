--========================================================--
--           🔑 自前作成 Key GUI (近未来風)            --
--========================================================--

local VALID_KEY = "FRP"
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FutureKeyGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- 背景フレーム
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 180)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.ClipsDescendants = true

-- 角丸 & UIGradientで近未来感
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

local UIGradient = Instance.new("UIGradient", MainFrame)
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
}
UIGradient.Rotation = 45

-- タイトル
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 50)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "🔐 Future Key Access"
Title.TextColor3 = Color3.fromRGB(0, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.Arcade
Title.Parent = MainFrame

-- TextBox
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0, 300, 0, 50)
KeyInput.Position = UDim2.new(0.5, -150, 0, 70)
KeyInput.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
KeyInput.TextColor3 = Color3.fromRGB(0, 255, 255)
KeyInput.PlaceholderText = "Enter your key..."
KeyInput.Font = Enum.Font.Arcade
KeyInput.TextScaled = true
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = MainFrame

local KeyInputCorner = Instance.new("UICorner", KeyInput)
KeyInputCorner.CornerRadius = UDim.new(0, 8)

-- Button
local ConfirmButton = Instance.new("TextButton")
ConfirmButton.Size = UDim2.new(0, 150, 0, 40)
ConfirmButton.Position = UDim2.new(0.5, -75, 1, -50)
ConfirmButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ConfirmButton.TextColor3 = Color3.fromRGB(20, 20, 30)
ConfirmButton.Text = "認証"
ConfirmButton.Font = Enum.Font.Arcade
ConfirmButton.TextScaled = true
ConfirmButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner", ConfirmButton)
ButtonCorner.CornerRadius = UDim.new(0, 8)

-- 通知用関数
local function Notify(title, content, color)
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 300, 0, 40)
    notif.Position = UDim2.new(0.5, -150, 0, -50)
    notif.BackgroundColor3 = color
    notif.TextColor3 = Color3.fromRGB(20, 20, 30)
    notif.Text = title.." - "..content
    notif.TextScaled = true
    notif.Font = Enum.Font.Arcade
    notif.Parent = ScreenGui

    local TweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(notif, tweenInfo, {Position = UDim2.new(0.5, -150, 0, 10)}):Play()

    delay(3, function()
        TweenService:Create(notif, tweenInfo, {Position = UDim2.new(0.5, -150, 0, -50)}):Play()
        game:GetService("Debris"):AddItem(notif, 0.6)
    end)
end

-- ボタンクリック処理
ConfirmButton.MouseButton1Click:Connect(function()
    if KeyInput.Text == VALID_KEY then
        Notify("成功", "キー認証成功！スクリプトをロード中…", Color3.fromRGB(0, 255, 0))
        -- 本体スクリプトロード
        loadstring(game:HttpGet("https://raw.githubusercontent.com/huroppar/Cheat/refs/heads/main/Cheat.lua"))()
        MainFrame:Destroy()
    else
        Notify("失敗", "キーが間違っています", Color3.fromRGB(255, 0, 0))
    end
end)
