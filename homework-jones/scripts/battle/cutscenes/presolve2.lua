return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    presolve2 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"Super Kool,[wait:5] mega fun,[wait:5]\nand Rel-[wait:3]A+[wait:3]-able,[wait:5] too!");
        cutscene:battlerText(enemy,"Puzzles and problems\nmake education a breeze!");
        cutscene:battlerText(enemy,"See,[wait:5] aren't you\nlearning a ton?");
        enemy.dialogue_override = "Way better than\nboring old class!";
    end
}