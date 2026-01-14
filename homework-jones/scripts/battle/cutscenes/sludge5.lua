return {
    ---@param cutscene BattleCutscene
    sludge5 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"She doesn't know\nanything about teenagers.");
        cutscene:battlerText(enemy,"In fact,[wait:5] I'll bet you she\nKNOWS she doesn't know\nanything about teenagers!");
        cutscene:battlerText(enemy,"If I were a Toriel assignment,[wait:5]\nyou'd bet I'd be cruising\ndown Popsicle Stick\nDiorama Junction right now.");
        cutscene:battlerText(enemy,"Teens LOVE popsicle\nsticks,[wait:5] right?");
        cutscene:battlerText(enemy,"(I actually don't know.)");
        enemy.dialogue_override = "Crafts projects![wait:5]\nCreativity![wait:5]\nAll that crap!";
    end
}