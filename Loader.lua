if not game:IsLoaded() then
    print("Game is loading...")
    game.Loaded:Wait()
end
print("Game loaded.")

repeat 
    print("Waiting for LocalPlayer and Character...")
    task.wait() 
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character

print("Player and Character Loaded!")

-- PlaceId atual
local placeId = game.PlaceId
print("Current PlaceId:", placeId)

-- Lista dos jogos suportados
local games = {
    [70876832253163] = 'https://raw.githubusercontent.com/vitorzz07/Sapphire.lua/refs/heads/main/AutoBond.lua', -- Dead Rails
    [126884695634066] = 'https://raw.githubusercontent.com/vitorzz07/Sapphire.lua/refs/heads/main/Grow-A-Garden.lua', -- Grow A Garden
    [2753915549] = 'https://raw.githubusercontent.com/vitorzz07/Sapphire.lua/refs/heads/main/FruitFinder.lua', -- Blox Fruits Sea 1
    [4442272183] = 'https://raw.githubusercontent.com/vitorzz07/Sapphire.lua/refs/heads/main/FruitFinder.lua', -- Blox Fruits Sea 2
    [7449423635] = 'https://raw.githubusercontent.com/vitorzz07/Sapphire.lua/refs/heads/main/FruitFinder.lua', -- Blox Fruits Sea 3
    [16044264830] = 'https://raw.githubusercontent.com/vitorzz07/Sapphire.lua/refs/heads/main/Bladeball.lua', -- Blade Ball
}

if games[placeId] then
    if placeId == 2753915549 then
        print("Blox Fruits - Sea 1 Detected")
    elseif placeId == 4442272183 then
        print("Blox Fruits - Sea 2 Detected")
    elseif placeId == 7449423635 then
        print("Blox Fruits - Sea 3 Detected")
    else
        print("Game supported. Loading script...")
    end

    local success, result = pcall(function()
        return loadstring(game:HttpGet(games[placeId]))()
    end)

    if success then
        print("Script loaded successfully!")
    else
        warn("Failed to load script:", result)
    end
else
    warn("Unsupported Game. PlaceId:", placeId)
end
