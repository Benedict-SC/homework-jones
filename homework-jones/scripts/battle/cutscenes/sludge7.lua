return {
    ---@param cutscene BattleCutscene
    sludge7 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"It's not my fault.");
        cutscene:battlerText(enemy,"It's not my fault\nI'm so UN KOOL.");
        cutscene:battlerText(enemy,"It's Miss Alphys![wait:5] It's\nMiss Alphys who doesn't\nknow what COOL IS!");
        cutscene:battlerText(enemy,"Alphys is bad at her job![wait:5]\nShe's a bad teacher!!");
        cutscene:battlerText(enemy,"So they can't blame\nme for any of it!");
        cutscene:battlerText(enemy,"They can't blame me for\nall the missed assignments!");
        cutscene:battlerText(enemy,"It's not my fault\nif you fail!");
        cutscene:battlerText(enemy,"Or pass out\nall the time!");
        cutscene:battlerText(enemy,"Or shred a parent-teacher\nconference invitation\nright there on your desk\nand laugh about it!");
        cutscene:battlerText(enemy,"It's not my fault,[wait:5] right?");
        enemy.dialogue_override = "...right?";
    end
}