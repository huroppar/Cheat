--========================================================--
--        PLATFORM SELECTION GUI (PC / Mobile)           --
--========================================================--

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.ResetOnSpawn = false
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

local PCButton = Instance.new("TextButton", Frame)
PCButton.Size = UDim2.new(0, 120, 0, 50)
PCButton.Position = UDim2.new(0.1,0,0.3,0)
PCButton.Text = "PC (Xeno)"
PCButton.TextScaled = true
PCButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PCButton.TextColor3 = Color3.fromRGB(0, 255, 255)

local MobileButton = Instance.new("TextButton", Frame)
MobileButton.Size = UDim2.new(0, 120, 0, 50)
MobileButton.Position = UDim2.new(0.5,0,0.3,0)
MobileButton.Text = "Mobile (Delta)"
MobileButton.TextScaled = true
MobileButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MobileButton.TextColor3 = Color3.fromRGB(255, 0, 255)

--================= BUTTON CALLBACKS =================--

-- PC ボタンを押した場合
PCButton.MouseButton1Click:Connect(function()
    Frame:Destroy()
    -- ここにPC専用スクリプト呼び出し
    -- 例: loadstring(game:HttpGet("https://raw.githubusercontent.com/ユーザー名/リポジトリ名/main/PCScript.lua"))()
end)

-- Mobile ボタンを押した場合
MobileButton.MouseButton1Click:Connect(function()
    Frame:Destroy()
    -- ここにスマホ専用スクリプト呼び出し
    -- 例: loadstring(game:HttpGet("https://raw.githubusercontent.com/ユーザー名/リポジトリ名/main/MobileScript.lua"))()
    -- ↑ GitHub のリンクをここに張る
end)
