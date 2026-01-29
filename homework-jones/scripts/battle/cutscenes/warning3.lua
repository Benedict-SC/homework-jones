return {
    ---@param cutscene BattleCutscene
    warning3 = function(cutscene,battler,enemy)
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"(Prince Ralsei do you have a\nsharpened #2 pencil, or possibly\na black or dark blue pen.)");
        cutscene:setSpeaker("ralsei");
        cutscene:text("* (Um...[wait:8] no.[wait:5] I believe those turn into swords in the Dark World.)","surprise_neutral");
        enemy.sprite:setAnimation("nonplussed");
        cutscene:battlerText(enemy,"(Can you make them stop???)");
        cutscene:text("* (Kris, would you consider... not eating Mr. Jones?)","pleased")
        cutscene:text("* (I don't believe it will do anything terrible to him, but he seems...)","concern_smile")
        cutscene:text("* (Upset.)","disappointed")
        enemy.sprite:setAnimation("idle");
        enemy.dialogue_override = "...";
    end
}