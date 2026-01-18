return {
    ---@param cutscene BattleCutscene
    presolve8 = function(cutscene,battler,enemy)
        cutscene:setSpeaker("ralsei");
        cutscene:text("Well, what DO you know about economics, Mr. Jones?","pleased")
        cutscene:text("It's not often Susie takes\nan interest in her education![react:1]","small_smile_side",{reactions= { {
                    "NOT what's\nhappening.",400,55,"teeth","susie"
        }}});
        cutscene:battlerText(enemy,"Well!");
        enemy.sprite:setAnimation("hmm");
        cutscene:battlerText(enemy,"...I WANT to help\nyou learn, but...");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"It seems like I\nmight be too fun?[wait:5]\nAnd radical?[wait:5] To actually...");
        enemy.sprite:setAnimation("nonplussed");
        cutscene:battlerText(enemy,"Teach you...[wait:7]\nanything?");
        cutscene:setSpeaker("susie");
        cutscene:text("Yeah, Alphys can't handle me either.","closed_grin");
        cutscene:text("Guess that's nothing new, heh.","nervous");
        enemy.sprite:setAnimation("fear");
        cutscene:battlerText(enemy,"B-[wait:2]b-[wait:2]but, it's my job!\nMy purpose as a Darkner!");
        enemy.sprite:setAnimation("hmm");
        cutscene:battlerText(enemy,"Doesn't Miss Alphys pay\nattention to your grades?");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"I'm supposed to be fit\nfor your grade LVL![wait:5]\nFun-ducational for ages\nfourteen to seventeen!");
        enemy.sprite:setAnimation("nonplussed");
        cutscene:battlerText(enemy,"Or did I just get downloaded\nfrom busyteacher.free.virus.org???");
        enemy.sprite:setAnimation("idle");
        enemy.dialogue_override = "...";
    end
}