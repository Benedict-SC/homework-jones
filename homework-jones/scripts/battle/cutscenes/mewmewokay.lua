return {
    ---@param cutscene BattleCutscene
    mewmewokay = function(cutscene,enemy)
        cutscene:battlerText(enemy,"It's okay if you\ndidn't do the reading.");
        cutscene:battlerText(enemy,"Just finish it before\nnext class,[wait:5] okay?");
        cutscene:battlerText(enemy,"(Subbed,[wait:5] not dubbed!)");
    end
}