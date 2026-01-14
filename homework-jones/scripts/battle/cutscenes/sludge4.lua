return {
    ---@param cutscene BattleCutscene
    sludge4 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"Isn't it miserable?");
        cutscene:battlerText(enemy,"To be taught by\na puddle of gloob.");
        cutscene:battlerText(enemy,"Some melty flop-ink wreck\nwho makes you listen to\ndepressing,[wait:5] adult problems.");
        cutscene:battlerText(enemy,"Who folds like\npaper the minute\nanyone gets mad.");
        enemy.dialogue_override = "It's your teacher who\nmade me like this,[wait:5] kids.";
    end
}