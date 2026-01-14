return {
    ---@param cutscene BattleCutscene
    laterchewsx = function(cutscene,battler,enemy)
        enemy.sprite:setAnimation("pain_normal");
        Assets.playSound("impact")
        enemy:shake(4);
        enemy.chewed = enemy.chewed + 4;
        cutscene:text("* You and Susie devoured more of the Fruits of Knowledge.")
        cutscene:text("* Homework Jones got even less readable.")
        cutscene:gotoCutscene("checkchewaftereat", "checkchewaftereat",battler,enemy,enemy.chewed - 4);
    end
}