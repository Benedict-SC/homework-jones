return {
    ---@param cutscene BattleCutscene
    laterchewsx = function(cutscene,battler,enemy)
        enemy.sprite:setAnimation("pain_normal");
        Assets.playSound("impact")
        enemy:shake(4);
        enemy.chewed = enemy.chewed + 4;
        if enemy.chewed >= 14 then
            if enemy.tired then
                cutscene:setSpeaker("susie");
                cutscene:text("Kris, uh...","suspicious")
                cutscene:text("...let's just have Ralsei put him to sleep and go get some moss, okay?","sus_nervous")
                cutscene:battlerText(enemy,"Do it![wait:5] Turn me\ninto calories![wait:5] Give\nme meaning,[wait:3] Susie!!!")
                cutscene:text("Let's go get some moss right now, actually.","surprise_frown")
            elseif enemy.susieNoThanks then
                cutscene:text("* Susie doesn't want to\neat any more Jones.[react:1]",nil,{reactions= { {
                    "(Is this\ncannibalism???)",400,45,"shock_nervous","susie"
                }}})
                cutscene:text("* You ate her share.")
                cutscene:text("* He got a little more exhausted.")
            else
                cutscene:text("* Susie doesn't want to\neat any more Jones.[react:1]",nil,{reactions= { {
                    "I don't, uh,\nactually eat faces.",400,45,"shy_b","susie"
                }}})
                enemy.susieNoThanks = true
                cutscene:text("* You served yourself an extra portion instead.")
                cutscene:text("* He got a little more exhausted.")
            end
        else
            cutscene:text("* You and Susie devoured more of the Fruits of Knowledge.")
            cutscene:text("* Homework Jones got even less readable.")
        end
        cutscene:gotoCutscene("checkchewaftereat", "checkchewaftereat",battler,enemy,enemy.chewed - 4);
    end
}