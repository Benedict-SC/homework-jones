return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    presolve4 = function(cutscene,battler,enemy)
        if not enemy.kindnessInterrupted then
            cutscene:battlerText(enemy,"See,[wait:5] wasn't that fun?[wait:5]\nIsn't learning so much\neasier this way?");
        end
        enemy.sprite:setAnimation("hmm");
        cutscene:battlerText(enemy,"Susie![wait:5] It's been tough\nfor you,[wait:5] hasn't it?");
        cutscene:battlerText(enemy,"A new school,[wait:5]\na new class.");
        cutscene:battlerText(enemy,"Plenty of chances to lag\nbehind.[wait:5] Get caught up in\nrough necks of the towns.");
        enemy.sprite:setAnimation("idle");
        cutscene:battlerText(enemy,"I'll do my level most\nto help you![wait:5] Just like\nall your assignments.");
        cutscene:battlerText(enemy,"All these catchup papers\nand XtraCredits...");
        enemy.dialogue_override = "That's just how your\nteacher shows she cares!";
    end
}