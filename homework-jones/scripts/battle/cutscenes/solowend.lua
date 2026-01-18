return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    solowend = function(cutscene,enemy)
            enemy.sprite:setAnimation("lecture");
            cutscene:battlerText(enemy,"Partial credit for doing\nyour best,[wait:5] Kris!")
            cutscene:battlerText(enemy,"I'll give you\nhalf a point.")
            enemy.sprite:setAnimation("idle");
            cutscene:battlerText(enemy,"Too bad this\none's worth 90%\nof your grade!");
            cutscene:setSpeaker("susie");
            cutscene:text("Hey,[wait:5] hang on.","suspicious");
            cutscene:text("The hell's this question doing in our homework?","angry_b");
            enemy.sprite:setAnimation("hmm");
            cutscene:battlerText(enemy,"Hwuh?");
            cutscene:text("Dunno what a Solo model is,[wait:5] but I'm pretty sure it's not algebra.","annoyed");
            cutscene:text("Or,[wait:5] uh,[wait:5] anything Alphys taught us.","shy_b");
            enemy.sprite:setAnimation("lecture");
            cutscene:battlerText(enemy,"The assignment is\nthe assignment,[wait:5] Susie.");
            cutscene:battlerText(enemy,"It's just like my other\npuzzles[wait:3] and...[wait:5] problems[wait:1].[wait:1].[wait:1].");
            enemy.sprite:setAnimation("nonplussed");
            cutscene:battlerText(enemy,"...");
            enemy.sprite:setAnimation("fear");
            cutscene:battlerText(enemy,"This is,[wait:5] uh,[wait:5] from a\npostgrad textbook.");
            cutscene:battlerText(enemy,"...");
            enemy.sprite:setAnimation("scold");
            cutscene:battlerText(enemy,"...don't look at me like\nthat![wait:5] Blame Miss Alphys!!");
            enemy.sprite:setAnimation("idle");

    end
}