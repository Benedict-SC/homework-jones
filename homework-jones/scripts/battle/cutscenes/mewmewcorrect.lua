return {
    ---@param cutscene BattleCutscene
    mewmewcorrect = function(cutscene,enemy)
        enemy.sprite:setAnimation("dark");
        cutscene:battlerText(enemy,"...");
        cutscene:battlerText(enemy,"Your teacher will be happy.");
        enemy.sprite:setAnimation("idle");
    end
}