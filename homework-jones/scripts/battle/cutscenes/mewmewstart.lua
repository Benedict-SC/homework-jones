return {
    ---@param cutscene BattleCutscene
    mewmewstart = function(cutscene,enemy)
        cutscene:battlerText(enemy,"...Kris...");
        cutscene:battlerText(enemy,"Technically,[wait:5] this is\na free response\nquestion,[wait:5] but...[wait:5]");
        cutscene:battlerText(enemy,"My answer key says\nthe correct response is\n'Mew Mew Kissy Cutie 2.'");
        cutscene:battlerText(enemy,"If you write anything else,\nyou're going to lose points.");
        cutscene:battlerText(enemy,"Just so you know.");
    end
}