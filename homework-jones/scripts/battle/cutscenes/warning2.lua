return {
    ---@param cutscene BattleCutscene
    warning2 = function(cutscene,battler,enemy)
        enemy.sprite:setAnimation("scold");
        cutscene:battlerText(enemy,"Kids![wait:5] Kids![wait:5] Kya ha\nhuh,[wait:3] huh,[wait:3] uhh,[wait:5] this\nisn't creditable work!");
        cutscene:battlerText(enemy,"I don't have that much\nscratch paper left![wait:5] It's\nmore like sludge paper now...");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"But these long-division\nproblems are still solvable![wait:5]\nIf you stop now!");
        cutscene:battlerText(enemy,"You can still squeak\nby with a D+!");
        cutscene:battlerText(enemy,"I'll,[wait:5] uhh,[wait:5] umm,[wait:5]\ngive you ExtraCredit...");
        enemy.sprite:setAnimation("idle");
        enemy.dialogue_override = "...Anyone???";
    end
}