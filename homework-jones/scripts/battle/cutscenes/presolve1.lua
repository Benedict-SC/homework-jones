return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    presolve1 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"Check it out,[wait:5] kids![wait:5] Isn't\nthis fun?[wait:5] Kya ha ha!");
        cutscene:battlerText(enemy,"Even if you don't like\nschool,[wait:5] I bet you like\nflips and tricks,[wait:5] right?");
        cutscene:battlerText(enemy,"Now you can find the\nsquare root of flips or\nthe cosine of tricks!");
    end
}