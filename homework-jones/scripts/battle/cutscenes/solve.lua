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
            if enemy.mercy >= 27 and enemy.wordProblemsGiven == 0 then
                cutscene:text("* Homework Jones's face opens to reveal an essay question!");
                enemy.wave_override = "favorite";
                enemy.dialogue_override = "Pencils at the ready,[wait:5] kids!"
                enemy.wordProblemsGiven = 1;
            elseif enemy.mercy >= 54 and enemy.wordProblemsGiven == 1 then
                cutscene:text("* Homework Jones's face opens to reveal a word problem!");
                cutscene:text("* ...but not really, 'cause we haven't implemented this one yet!");
                --TODO: initiate wordproblem 2
                enemy.wordProblemsGiven = 2;
            elseif enemy.mercy >= 81 and enemy.wordProblemsGiven == 2 then
                cutscene:text("* Homework Jones's face opens to reveal a word problem!");
                cutscene:text("* ...but not really, 'cause we haven't implemented this one yet!");
                --TODO: initiate wordproblem 3
                enemy.wordProblemsGiven = 3;
            end
        end
    end
}