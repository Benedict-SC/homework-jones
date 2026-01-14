return {
    ---@param cutscene BattleCutscene
    sludge9 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"You can't just be eating\npaper and nothing else.");
        cutscene:battlerText(enemy,"With no calories,[wait:5] you'll\nnever solve a thing.");
        cutscene:battlerText(enemy,"Babies learn that first\nthing in Kindergarten!");
        cutscene:battlerText(enemy,"But Kris sleeps\nthrough lunch,[wait:5] and\nSusie scarfs grass.");
        cutscene:battlerText(enemy,"Even Prince Ralsei skips\nhis own dinner to make\nLancer his milk and honey.");
        cutscene:battlerText(enemy,"You're eating like garbage!");
        enemy.dialogue_override = "In fact,[wait:5] you're eating ME!";
    end
}