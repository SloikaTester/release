-- Инжектор для Da Hood Combat Bot
getgenv().BotConfig = {
    MainOwner = "kcadamsqier", -- Ваш основной ник
    Prefix = ".", -- Префикс команд
    AutoInject = true -- Авто-инжект при входе в игру
}

local function LoadBot()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Beeya_2554/DAHOOD_BOT/main/stand.lua"))()
    end)
    
    if not success then
        warn("Ошибка загрузки бота: " .. err)
    end
end

if getgenv().BotConfig.AutoInject then
    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
        if state == Enum.TeleportState.InProgress then
            syn.queue_on_teleport([[
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Beeya_2554/DAHOOD_BOT/main/stand.lua"))()
            ]])
        end
    end)
    
    LoadBot()
end

return LoadBot
