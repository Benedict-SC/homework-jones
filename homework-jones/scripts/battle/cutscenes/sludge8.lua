return {
    ---@param cutscene BattleCutscene
    sludge8 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"...Still eating,[wait:5] kids?");
        cutscene:battlerText(enemy," Don't you have better meals\nthan me?[wait:5] You know Miss Alphys\nwon't actually CHECK if you\nate it all or not,[wait:5] right?");
        cutscene:battlerText(enemy,"All I saw in your bags\nwere pencils and hairbrushes\nand pieces of glass.");
        cutscene:battlerText(enemy,"That's not even ON the\nNutrition Trapezohedron.");
        cutscene:battlerText(enemy,"Doesn't anyone give you\nlunch money? Can't that Noelle\ngirl spare her fourth TV\nto buy you some fries?");
        enemy.dialogue_override = "...";
    end
}