return {
    ---@param cutscene BattleCutscene
    mewmewgaiden = function(cutscene,enemy)
        cutscene:battlerText(enemy,"Please read\nthe instructions\nbefore answering\nthe question.");
        cutscene:battlerText(enemy,"No credit.");
    end
}