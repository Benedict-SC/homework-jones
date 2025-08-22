return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    favoriteFriend = function(cutscene, enemy,dialogue)
        cutscene:text("")
        for i=1,#dialogue do
            cutscene:battlerText({enemy},dialogue[i]);
        end
    end
}