return {
    ---@param cutscene BattleCutscene
    mewmewgaiden = function(cutscene,enemy)
        enemy.sprite:setAnimation("scold");
        cutscene:battlerText(enemy,"Please read\nthe instructions\nbefore answering\nthe question.");
        cutscene:battlerText(enemy,"No credit.");
        enemy.sprite:setAnimation("idle");
    end
}