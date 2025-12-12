--========================================================--
-- 779, 867 を押し続けるオートクリッカー（スタート/ストップ付き）
--========================================================--

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local clicking = false
local X, Y = 779, 867   -- ← 押し続ける座標

--========================================================--
-- GUI 作成
--========================================================--

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 130)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0

local function makeBtn(name, y)
	local b = Instance.new("TextButton", frame)
	b.Size = UDim2.new(1, -20, 0, 45)
	b.Position = UDim2.new(0, 10, 0, y)
	b.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	b.TextColor3 = Color3.new(1, 1, 1)
	b.TextSize = 20
	b.Text = name
	return b
end

local startBtn = makeBtn("スタート", 10)
local stopBtn  = makeBtn("ストップ", 60)

--========================================================--
-- スタート
--========================================================--

startBtn.MouseButton1Click:Connect(function()
	clicking = true
	print("🔥 オートクリック開始")

	task.spawn(function()
		while clicking do
			mouse1move(X, Y)  -- 座標に移動
			mouse1click()      -- クリック
			task.wait()        -- 高速化したいなら 0.01 とかに変更可
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
