return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    solowstart = function(cutscene,enemy)
        cutscene:setSpeaker("susie");
        cutscene:text("...Ralsei,[wait:5] you got this.","sincere_smile");
        cutscene:setSpeaker("ralsei");
        cutscene:text("...Um.","shock_smile");
        cutscene:battlerText(enemy,"Show us your stuff,[wait:5]\nPrince Ralsei!");
        cutscene:setSpeaker("ralsei");
        cutscene:text("(K-[wait:2]Kris,[wait:5] help...)","concern");
        Game.battle.soul.visible = false;
        Game.battle.battle_ui.choice_box.optionYOffsets = {-7,-22,0,0};
        local choice = cutscene:choicer({"Let's do it\ntogether!","Answer the\nquestion\nbrain boy"});
        Game.battle.soul.visible = true;
        Game.battle.battle_ui.choice_box.optionYOffsets = {0,0,0,0};
        if choice == 1 then
            enemy.tryYourBest = true;
        else
            cutscene:setSpeaker("ralsei");
            cutscene:text("I...","no_glasses_closed");
            cutscene:text("I don't know![wait:5] I never studied macroeconomics!","concern");
            cutscene:battlerText(enemy,"Oh-no,[wait:5] so sorry,[wait:5] but this one\nis worth 90% of the grade!");
            cutscene:text("Kris,[wait:5] I'm so sorry...!","concern");
            cutscene:setSpeaker("susie");
            cutscene:text("Hey,[wait:5] hang on.","suspicious");
            cutscene:text("The hell's this question doing in our homework?","angry_b");
            cutscene:battlerText(enemy,"Hwuh?");
            cutscene:text("Dunno what a Solo model is,[wait:5] but I'm pretty sure it's not algebra.","annoyed");
            cutscene:text("Or,[wait:5] uh,[wait:5] anything Alphys taught us.","shy_b");
            cutscene:battlerText(enemy,"You get what you get and\nyou don't get upset,[wait:5] Susie.");
            cutscene:battlerText(enemy,"It's just like my other\npuzzles[wait:3] and...[wait:5] problems[wait:1].[wait:1].[wait:1].");
            cutscene:battlerText(enemy,"...");
            cutscene:battlerText(enemy,"This is,[wait:5] uh,[wait:5] from a\npostgrad textbook.");
            cutscene:battlerText(enemy,"...");
            cutscene:battlerText(enemy,"...don't look at me like\nthat![wait:5] Blame Miss Alphys!!");
        end
    end
}