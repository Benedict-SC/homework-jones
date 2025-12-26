return {
    ---@param cutscene BattleCutscene
    ---@param battler PartyBattler
    ---@param enemy EnemyBattler
    solve = function(cutscene, battler, enemy)
        if enemy.chewed and (enemy.chewed >= 10) then
            cutscene:text("* Your sword goes right through the soggy paper.");
            cutscene:text("* Doesn't seem like solving is an option.");
        else
            cutscene:text("* You write down an answer with your sword tip.");
            enemy:addMercy(5);
            cutscene:wait(1);
            cutscene:gotoCutscene("checkmercyaftersolve", "checkmercyaftersolve",battler,enemy);
        end
    end
}