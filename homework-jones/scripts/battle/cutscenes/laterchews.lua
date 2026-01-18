return {
    ---@param cutscene BattleCutscene
    laterchews = function(cutscene,battler,enemy)
        enemy.sprite:setAnimation("pain_normal");
        Assets.playSound("impact")
        enemy:shake(4);
        enemy.chewed = enemy.chewed + 2;
        if enemy.chewed >= 12 then
            if enemy.tired then
                cutscene:text("* There isn't even enough solid paper here to chew on.")
                cutscene:text("* You lap up a little of Sludge Puddle Jones like a dog.")
                cutscene:text("* ...then immediately spit it out.")
                cutscene:text("* Ralsei should probably cast PACIFY now.")
            else
                cutscene:text("* You kept chewing on the former Homework Jones.")
                cutscene:text("* He got a little more exhausted.")
            end
        else
            cutscene:text("* You devoured more of the Fruits of Knowledge.")
            cutscene:text("* Homework Jones got even less readable.")
        end
        cutscene:gotoCutscene("checkchewaftereat", "checkchewaftereat",battler,enemy,enemy.chewed - 2);
    end
}