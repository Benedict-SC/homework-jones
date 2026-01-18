return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    presolve5 = function(cutscene,battler,enemy)
        enemy.sprite:setAnimation("lecture");
        cutscene:battlerText(enemy,"We should all\nbe grateful for\nMiss Alphys.");
        cutscene:battlerText(enemy,"The does-[wait:2]her-[wait:2]bestest\nteacher I know!");
        if enemy.alphysFriend then
            enemy.sprite:setAnimation("hmm");
            cutscene:battlerText(enemy,"And so good at...[wait:7]\nreasonable boundaries with\nher students.[wait:5] Kya-heh.")
        end
        enemy.sprite:setAnimation("scold");
        cutscene:battlerText(enemy,"Miss Toriel's homework-ners\nare such sticklers.");
        cutscene:battlerText(enemy,"'Answer in the correct font size!'[wait:5]\n'No spinning in class!'[wait:5]\n'Get some sleep and don't stay\nup grading!'");
        enemy.sprite:setAnimation("patient");
        cutscene:battlerText(enemy,"What a drag,[wait:5] right?[wait:5]\nI'd never put a heavy hand\non you like that.");
        enemy.sprite:setAnimation("idle");
        cutscene:battlerText(enemy,"Don't turn in anything![wait:5]\nDon't turn up to class!");
        cutscene:battlerText(enemy,"I'm cool![wait:5] I won't\ntell anyone!");
        enemy.dialogue_override = "Miss Alphys might\nnot even notice!";
    end
}