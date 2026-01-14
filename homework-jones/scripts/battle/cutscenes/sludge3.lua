return {
    ---@param cutscene BattleCutscene
    sludge3 = function(cutscene,battler,enemy)
        cutscene:battlerText(enemy,"It's not your fault,[wait:5] kids.");
        cutscene:battlerText(enemy,"HOME WORK won't\never be KOOL.");
        cutscene:battlerText(enemy,"It's just a big old slog!");
        cutscene:battlerText(enemy,"Problems,[wait:5] puzzles,[wait:5]\nit's all just KEYS\njingled in your FACES...");
        cutscene:battlerText(enemy,"So you never figure\nout I don't know\nhow to talk to you.");
        enemy.dialogue_override = "Keh huh...";
    end
}