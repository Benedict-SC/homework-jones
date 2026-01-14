return {
    ---@param cutscene BattleCutscene
    sludge6 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"Instead I'm supposed to teach you about\nfree radicals with skateboard tricks,[wait:5]\nand pi with ALSO skateboard tricks...");
        cutscene:battlerText(enemy,"...for three to four hours\nafter school while you're\ntired as dogs...");
        cutscene:battlerText(enemy,"And then BE YOUR FRIEND?");
        cutscene:battlerText(enemy,"Never going to happen![wait:5]\nI can't puzzle or problem\nmy way out of THAT!");
        cutscene:battlerText(enemy,"Who cares if the cool teacher\ndoesn't punish you for skipping\nclass when every day's a\npunishment for SHOWING UP?");
        enemy.dialogue_override = "Kya ha!! Ha!!!";
    end
}