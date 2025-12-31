return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    presolve3 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"Having problems?[wait:5] Make\nthem word problems!");
        cutscene:battlerText(enemy,"And you can't get cyberbullied\non Charlotte's Web! Kya-ha-ha!");
    end
}