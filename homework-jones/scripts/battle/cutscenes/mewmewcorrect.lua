return {
    ---@param cutscene BattleCutscene
    mewmewcorrect = function(cutscene,enemy)
        cutscene:battlerText(enemy,"...");
        cutscene:battlerText(enemy,"Your teacher will be happy.");
    end
}