return {
    ---@param cutscene BattleCutscene
    mewmewokay = function(cutscene,enemy)
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"It's okay if you\ndidn't do the reading.");
        cutscene:battlerText(enemy,"Just finish it before\nnext class,[wait:5] okay?");
        enemy.sprite:setAnimation("idle");
        cutscene:battlerText(enemy,"(Subbed,[wait:5] not dubbed!)");
    end
}