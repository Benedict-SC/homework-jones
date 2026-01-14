return {
    ---@param cutscene BattleCutscene
    laterchews = function(cutscene,battler,enemy)
        enemy.sprite:setAnimation("pain_normal");
        Assets.playSound("impact")
        enemy:shake(4);
        enemy.chewed = enemy.chewed + 2;
        cutscene:text("* You devoured more of the Fruits of Knowledge.")
        cutscene:text("* Homework Jones got even less readable.")
        cutscene:gotoCutscene("checkchewaftereat", "checkchewaftereat",battler,enemy,enemy.chewed - 2);
    end
}