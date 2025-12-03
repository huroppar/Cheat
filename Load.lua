--========================================================--
--                🔑 RobloxCheatScriptVer2 Key GUI        --
--========================================================--

local VALID_KEY = "RobloxCheatScriptVer2"  -- 正しいキー

local RayField = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = RayField:CreateWindow({
    Name = "Roblox Cheat Script Ver2",
    LoadingTitle = "KEY SYSTEM",
    LoadingSubtitle = "Access Protection",
    Theme = "Default",
})

local keyTab = Window:CreateTab("Key", 4483362458)
keyTab:CreateLabel("スクリプトを使うにはキーを入力してください")

local enteredKey = ""
keyTab:CreateTextbox({
    Name = "Key Input",
    PlaceholderText = "Enter your key...",
    Callback = function(text)
        enteredKey = text
    end
})

keyTab:CreateButton({
    Name = "認証する",
    Callback = function()
        if enteredKey == VALID_KEY then
            RayField:Notify({
                Title = "成功",
                Content = "キー認証成功！スクリプトをロードしています…",
                Duration = 3
            })

            -- ★ 本体スクリプトを読み込む ★
            loadstring(game:HttpGet("https://raw.githubusercontent.com/huroppar/Cheat/refs/heads/main/Cheat.lua"))()

        else
            RayField:Notify({
                Title = "失敗",
                Content = "キーが間違っています。",
                Duration = 3
            })
        end
    end
})
