return {
    ---@param cutscene BattleCutscene
    sludge11 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"Yes![wait:5] Let me\nfulfill my purpose!");
        cutscene:battlerText(enemy,"Take my final puzzles![wait:5]\nTake my ultimate problems![wait:5]\nDigest it all into a paste!");
        cutscene:battlerText(enemy,"Even if there's nothing\nelse I can do for you...");
        cutscene:battlerText(enemy,"Even if I don't\nunderstand what's wrong\nin the first place...");
        cutscene:battlerText(enemy,"Even if you'll never\ntrust me enough to\ntell me a thing...");
        cutscene:battlerText(enemy,"It's a Darkner's purpose\nto make you happy,[wait:5] kids!");
        cutscene:battlerText(enemy,"And I'll do that better\nin your stomachs than I\never did on my feet!");
        cutscene:battlerText(enemy,"That's L[wait:3]-O[wait:3]-V[wait:3]-E[wait:3] [shake:1]LOVE![shake:0]");
        enemy.dialogue_override = "[shake:2]Kya ha ha ha ha ha ha!!!!!";
        cutscene:text("* Sludge Puddle Jones became [color:#00B3FF]TIRED[color:white].")
        enemy:setTired(true);
        enemy.text = enemy.pacifyText;
    end
}