local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 既存GUI削除（再実行対策）
pcall(function()
	game:GetService("CoreGui"):FindFirstChild("ImageToggleGui"):Destroy()
end)

-- GUI作成（CoreGuiに入れる）
local gui = Instance.new("ScreenGui")
gui.Name = "ImageToggleGui"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

-- 画像
local img = Instance.new("ImageLabel")
img.Parent = gui
img.Size = UDim2.fromScale(0.5, 0.5)
img.Position = UDim2.fromScale(0.25, 0.25)
img.BackgroundTransparency = 1
img.Image = "rbxassetid://121625222653881"
img.Visible = false
img.ZIndex = 10

-- ボタン
local btn = Instance.new("TextButton")
btn.Parent = gui
btn.Size = UDim2.fromScale(0.2, 0.08)
btn.Position = UDim2.fromScale(0.1, 0.1)
btn.Text = "画像 ON"
btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.ZIndex = 11

-- ON / OFF
btn.MouseButton1Click:Connect(function()
	img.Visible = not img.Visible
	btn.Text = img.Visible and "画像 OFF" or "画像 ON"
end)
