return {
    ---@param cutscene BattleCutscene
    sludge1 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"I'm...[wait:5] a puddle?");
        cutscene:battlerText(enemy,"A gooey muddle?");
        cutscene:battlerText(enemy,"...but my puzzles and problems.[wait:5]\nYou can't solve them any more.");
        cutscene:battlerText(enemy,"Even I can't solve\nthem any more.");
        cutscene:battlerText(enemy,"Did you really hate\nit that much...?");
        cutscene:battlerText(enemy,".[wait:2].[wait:2].[wait:5]");
        cutscene:battlerText(enemy,"Puzzles,[wait:5] problems...[wait:7]\nkeh huh huh...");
        cutscene:battlerText(enemy,"What a laughing matter.");
        cutscene:battlerText(enemy,"You were never going\nto finish me at\nall,[wait:5] were you?");
        enemy.dialogue_override = "Keh huh huh...";
    end
}