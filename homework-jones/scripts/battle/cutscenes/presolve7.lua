return {
    ---@param cutscene BattleCutscene
    presolve7 = function(cutscene,battler,enemy)
        cutscene:setSpeaker("susie");
        cutscene:text("...what's a Solo model, anyway?","small_smile");
        enemy.sprite:setAnimation("lecture");
        cutscene:battlerText(enemy,"Don't worry about it!");
        enemy.sprite:setAnimation("idle");
        cutscene:text("Is it like... you know, the crap with triangles?","nervous")
        enemy:shake(4);
        enemy.sprite:setAnimation("lecture");
        cutscene:battlerText(enemy,"Don't worry about it!!!");
        cutscene:text("...","sus_nervous")
        cutscene:setSpeaker("ralsei");
        cutscene:text("I believe it's about economics, Susie.","surprise_smile")
        cutscene:setSpeaker("susie");
        cutscene:text("So... money?","surprise");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"...well,[wait:5] probably?");
        cutscene:setSpeaker("susie");
        cutscene:text("Do you not know...?","annoyed");
        enemy.sprite:setAnimation("fear");
        cutscene:battlerText(enemy,"Y-[wait:3]your teacher hasn't\nused this stuff\nsince grad school!");
        enemy.sprite:setAnimation("idle");
        enemy.dialogue_override = "Sheesh!";
    end
}