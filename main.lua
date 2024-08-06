-- To avoid errors while editing Isaac lua files in VSCode press Ctrl+Shift+P and select
-- "Manually activate Isaac Lua autocompletion for this workspace"
-- Download the Lua and Binding of Isaac Extension from VSCode as well for easier developing :]

local mod = RegisterMod("No Amnesia with Black Candle", 1)

function mod:PreventAmnesia()
    local player = Isaac.GetPlayer(0)
    if player:HasCollectible(CollectibleType.COLLECTIBLE_BLACK_CANDLE) then
        -- If you have black candle then we ensure Curse of the Maze and Curse of the Lost 
        -- are removed (as these are the only 2 curses you are able to get once having black candle
        -- with Amnesia and ??? pill)
        local level = Game():GetLevel()
        level:RemoveCurses(LevelCurse.CURSE_OF_THE_LOST)
        level:RemoveCurses(LevelCurse.CURSE_OF_MAZE)
    end
end
-- Add call back, checks every frame
mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.PreventAmnesia)