return {
    ---@param cutscene BattleCutscene
    sludge2 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"Even in a Dark World\nin a school,[wait:5] it's\nall fun and games.");
        cutscene:battlerText(enemy,"I thought,[wait:5] if I turned math\ninto bullets and history\ninto gun's [sic],[wait:5] I'd fit in.");
        cutscene:battlerText(enemy,"But teens are never going\nto think homework is FUN.");
        cutscene:battlerText(enemy,"My purpose as a Darkner,[wait:5]\nand you Lightners\nhate it so much...");
        cutscene:battlerText(enemy,"That you'd rather\nchew me down into\na soggy paste!");
        enemy.dialogue_override = "...";
    end
}