--========================================================--
--  スマホ対応 + マーカー表示 + スタート/ストップ
--  固定座標(779, 867) を押し続けるオートクリッカー
--========================================================--

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ここが押し続ける座標
local clickX, clickY = 779, 867

local clicking = false

--========================================================--
-- GUI
--========================================================--

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 230, 0, 150)
frame.Position = UDim2.new(0.2, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0

local function makeBtn(text, y)
	local b = Instance.new("TextButton", frame)
	b.Size = UDim2.new(1, -20, 0, 45)
	b.Position = UDim2.new(0, 10, 0, y)
	b.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	b.TextColor3 = Color3.new(1,1,1)
	b.TextSize = 20
	b.Text = text
	return b
end

local startBtn = makeBtn("スタート", 10)
local stopBtn  = makeBtn("ストップ", 60)

--========================================================--
-- マーカー（赤丸）
--========================================================--

local marker = Instance.new("Frame", gui)
marker.Size = UDim2.new(0, 20, 0, 20)
marker.Position = UDim2.fromOffset(clickX, clickY)
marker.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
marker.BorderSizePixel = 0
marker.AnchorPoint = Vector2.new(0.5, 0.5)
marker.ZIndex = 99999
marker.Visible = true

local corner = Instance.new("UICorner", marker)
corner.CornerRadius = UDim.new(1, 0)

--========================================================--
-- スタート
--========================================================--

startBtn.MouseButton1Click:Connect(function()
	clicking = true
	print("🔥 連打開始 (", clickX, clickY, ")")

	task.spawn(function()
		while clicking do
			-- 座標へマウス移動（スマホでも内部的にはこれで動く）
			mouse1move(clickX, clickY)

			-- 連打
			mouse1click()

			task.wait()  -- 速くしたいなら 0.01 とかに変更
		end
	end)
end)

--========================================================--
-- ストップ
--========================================================--

stopBtn.MouseButton1Click:Connect(function()
	clicking = false
	print("🛑 停止")
end)
