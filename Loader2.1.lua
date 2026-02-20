if getgenv().__FURO_HUB_LOADED__ then
    warn("Furo Hub は既に読み込まれています。スキップします")
    return
end
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI作成
local playerGui = player:WaitForChild("PlayerGui", 30)
if not playerGui then
    warn("PlayerGuiが見つからない")
    return
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MasashiKeyGui"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.Enabled = true
screenGui.DisplayOrder = 9999

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.4, 0, 0.5, 0)
frame.Position = UDim2.new(0.3, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Text = "キー認証"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextScaled = true
title.Parent = frame

local inputBox = Instance.new("TextBox")
inputBox.Name = "KeyInputBox"
inputBox.Size = UDim2.new(0.8, 0, 0.15, 0)
inputBox.Position = UDim2.new(0.1, 0, 0.3, 0)
inputBox.PlaceholderText = "キーを入力..."
inputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.Parent = frame

local submitBtn = Instance.new("TextButton")
submitBtn.Name = "SubmitButton"
submitBtn.Size = UDim2.new(0.8, 0, 0.12, 0)
submitBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
submitBtn.Text = "認証"
submitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Parent = frame

local status = Instance.new("TextLabel")
status.Name = "StatusLabel"
status.Size = UDim2.new(0.8, 0, 0.15, 0)
status.Position = UDim2.new(0.1, 0, 0.7, 0)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255, 255, 255)
status.TextScaled = true
status.Parent = frame

-- ✖閉じるボタン
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0.1, 0, 0.1, 0)
closeBtn.Position = UDim2.new(0.9, 0, 0.05, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Parent = frame

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local API_URL = "https://script.google.com/macros/s/AKfycbxwIg1pRnIyULmWRO-iMItO74o8ofbAU3jBPdxaG6IUXsIHd0W1o09_oYgC4Iika3z0/exec"  -- あなたのURL

submitBtn.MouseButton1Click:Connect(function()
    local key = inputBox.Text:gsub("%s+", ""):upper()
    if key == "" then
        status.Text = "キーを入力してください"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end

    status.Text = "認証中..."
    status.TextColor3 = Color3.fromRGB(255, 255, 100)

    local fullUrl = API_URL .. "?key=" .. HttpService:UrlEncode(key)

    print("[DEBUG] リクエストURL: " .. fullUrl)

    local httpSuccess, response = pcall(function()
        return game:HttpGet(fullUrl)
    end)

    if not httpSuccess then
        status.Text = "接続エラー: " .. tostring(response)
        status.TextColor3 = Color3.fromRGB(255, 80, 80)
        print("[HTTP ERROR] " .. tostring(response))
        return
    end

    print("[DEBUG] 生応答: " .. response)

    local decodeSuccess, data = pcall(function()
        return HttpService:JSONDecode(response)
    end)

    if not decodeSuccess then
        status.Text = "データエラー (応答がJSONじゃないかも)"
        print("[JSON ERROR] 生データ: " .. response)
        return
    end

    if data.success then
        status.Text = "成功！有効期限: " .. (data.expires or "OK")
        status.TextColor3 = Color3.fromRGB(80, 255, 80)
        task.wait(1.5)
        screenGui:Destroy()

        -- 本体スクリプトロード
        loadstring(game:HttpGet("https://raw.githubusercontent.com/huroppar/Cheat/refs/heads/main/Xeno3.lua"))()
    else
        status.Text = data.message or "無効なキーです"
        status.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

inputBox:CaptureFocus()
